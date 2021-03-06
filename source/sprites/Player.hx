package sprites;

import haxe.ds.IntMap;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;

class PlayerInput {
  // map Int-> Player number
  public static var up:IntMap<FlxKey> = [
    2 => FlxKey.UP,
    1 => FlxKey.W
  ];
  public static var down:IntMap<FlxKey> = [
    2 => FlxKey.DOWN,
    1 => FlxKey.S
  ];
  public static var left:IntMap<FlxKey> = [
    2 => FlxKey.LEFT,
    1 => FlxKey.A
  ];
  public static var right:IntMap<FlxKey> = [
    2 => FlxKey.RIGHT,
    1 => FlxKey.D
  ];
}

class Player extends FlxSprite {

  private static inline var DIAGONAL_MOVEMENT = 1.41421356237;  // divide by sqrt(2)
  public static inline var DEFAULT_SKIN_1 = "assets/images/01.png";
  public static inline var DEFAULT_SKIN_2 = "assets/images/04.png";
  public static inline var DEFAULT_SPEED = 200;

  public var points:Int;

  private var state:PlayState;
  private var player_num:Int;
  private var graphic_path:String;
  private var attacking:Bool;
  private var speed:Int;
  private var spawn_position:FlxPoint;
  private var settings:{ skin:String, speed:Int };
  private var walkRot:Float;
  private var walkHopY:Float;

  public function new(state:PlayState, player_num:Int, x:Int, y:Int) {
    settings = player_num == 1 ? Settings.hero_1 : Settings.hero_2;
    super(x, y, settings.skin);

    this.scale.set(.5,.5);
    this.updateHitbox();
    this.height /= 4;
    this.width /= 4;
    this.centerOffsets();
    this.centerOrigin();

    this.spawn_position = FlxPoint.weak(x, y);
    this.player_num = player_num;
    this.speed = settings.speed;
    this.drag = FlxPoint.weak(this.speed*10, this.speed*10);
    this.points = 0;
    this.walkRot = 0;
    this.walkHopY = 0;
    this.state = state;
  }

  override public function update(elapsed:Float):Void
  {
    movement();
    super.update(elapsed);
  }

  private inline function movement():Void
  {
    // this.velocity.set(0,0);
    var moving_h = false
      , moving_v = false;

    if(!this.attacking){
      if (FlxG.keys.anyPressed([PlayerInput.up.get(this.player_num)])){
        // this.acceleration.y = -GG.hero_speed;
        this.acceleration.y = -this.speed *10;
        moving_v = true;
      }
      if (FlxG.keys.anyPressed([PlayerInput.down.get(this.player_num)])){
        this.acceleration.y = this.speed *10;
        moving_v = true;
      }
      if (FlxG.keys.anyPressed([PlayerInput.left.get(this.player_num)])){
        // this.acceleration.y = -GG.hero_speed;
        this.acceleration.x = -this.speed *10;
        moving_h = true;
      }
      if (FlxG.keys.anyPressed([PlayerInput.right.get(this.player_num)])){
        this.acceleration.x = this.speed *10;
        moving_h = true;
      }
      // if (game.input.space){
      //   this.attack();
      // }
    }

    // funner walking
    if(moving_h || moving_v){
      this.angle = Math.cos(++this.walkRot)  * 10; // 100 tumbles
      this.y += Math.sin(--this.walkHopY) * 3;
    }else{
      this.angle = 0;
    }

    if(!moving_h) this.acceleration.x = 0;
    else this.flipX = this.acceleration.x > 0;
    if(!moving_v) this.acceleration.y = 0;


    // orthagonal movement goes faster
    this.maxVelocity = if(moving_h && moving_v){
      FlxPoint.weak(this.speed/DIAGONAL_MOVEMENT, this.speed/DIAGONAL_MOVEMENT);
    } else {
      FlxPoint.weak(this.speed, this.speed);

    }

  }

  public inline function speed_boost(duration:Float):Void
  {
    this.speed = settings.speed * 2;
    new FlxTimer().start(duration, function(timer){
      this.speed = settings.speed;
    });
  }

  public inline function slow_down(duration:Float):Void
  {
    this.speed = Std.int(settings.speed / 2);
    new FlxTimer().start(duration, function(timer){
      this.speed = settings.speed;
    });
  }

  public inline function freeze(duration:Float):Void
  {
    this.velocity.set(0,0);
    this.acceleration.set(0,0);
    this.speed = 0;
    new FlxTimer().start(duration, function(timer){
      this.speed = settings.speed;
    });
  }

  public inline function score(points:Int):Void
  {
    this.points += points;
  }

  public inline function die():Void
  {
    if( this.state.survival_type ){
      this.alive = false;
      this.destroy();
    } else { // respawn
      this.x = spawn_position.x;
      this.y = spawn_position.y;
      this.velocity.set(0,0);
    }
  }
}

