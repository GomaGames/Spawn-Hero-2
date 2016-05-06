package sprites;

import haxe.ds.IntMap;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;

class PlayerInput {
  // map Int-> Player number
  public static var up:IntMap<FlxKey> = [ 1 => FlxKey.UP ];
  public static var down:IntMap<FlxKey> = [ 1 => FlxKey.DOWN ];
  public static var left:IntMap<FlxKey> = [ 1 => FlxKey.LEFT ];
  public static var right:IntMap<FlxKey> = [ 1 => FlxKey.RIGHT ];
}

class Player extends FlxSprite {

  private static inline var DIAGONAL_MOVEMENT = 1.41421356237;  // divide by sqrt(2)
  private static inline var default_graphic = "assets/images/graphic-07.png";
  private var player_num:Int;
  private var graphic_path:String;
  private var attacking:Bool;
  private var speed:Int;

  public function new(state:PlayState, player_num:Int, x:Int, y:Int) {
    super(x, y, default_graphic);

    this.player_num = player_num;
    this.speed = 100;

  }

  override public function update(elapsed:Float):Void
  {
    movement();
    super.update(elapsed);
  }

  private inline function movement():Void
  {
    this.velocity.x = this.velocity.y = 0;
    this.acceleration.x = this.acceleration.y = 0;
    var moving_h = false
      , moving_v = false;

    if(!this.attacking){
      if (FlxG.keys.anyPressed([PlayerInput.up.get(1)])){
        // this.acceleration.y = -GG.hero_speed;
        this.acceleration.y = -this.speed;
        moving_v = true;
      }
      if (FlxG.keys.anyPressed([PlayerInput.down.get(1)])){
        this.acceleration.y = this.speed;
        moving_v = true;
      }
      if (FlxG.keys.anyPressed([PlayerInput.left.get(1)])){
        // this.acceleration.y = -GG.hero_speed;
        this.acceleration.x = -this.speed;
        moving_h = true;
      }
      if (FlxG.keys.anyPressed([PlayerInput.right.get(1)])){
        this.acceleration.x = this.speed;
        moving_h = true;
      }
      // if (game.input.space){
      //   this.attack();
      // }
    }


    this.velocity.x = ((moving_h)? 0 : this.velocity.x) + this.acceleration.x;
    this.velocity.y = ((moving_v)? 0 : this.velocity.y) + this.acceleration.y;

    // orthagonal movement goes faster
    if(moving_h && moving_v){
      this.velocity.x /= DIAGONAL_MOVEMENT;
      this.velocity.y /= DIAGONAL_MOVEMENT;
    }

  }
}

