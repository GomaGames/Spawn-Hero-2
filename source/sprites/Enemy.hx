package sprites;

import flixel.FlxSprite;
using flixel.util.FlxSpriteUtil;

class Enemy extends FlxSprite {

  public static inline var DEFAULT_SKIN = "assets/images/12.png";
  public static inline var DEFAULT_SPEED = 100;
  public static inline var UP = "up";
  public static inline var DOWN = "down";
  public static inline var LEFT = "left";
  public static inline var RIGHT = "right";
  public var speed:Int;

  public function new(x:Int, y:Int, speed:Int, skin:String, ?direction:String ){
    this.speed = speed;
    super(x, y, skin);
    this.scale.set(.5,.5);
    this.updateHitbox();
    this.elasticity = 1;
    if(direction != null){
      switch(direction){
        case UP : this.velocity.set(0,-speed);
        case DOWN : this.velocity.set(0,speed);
        case LEFT : this.velocity.set(-speed, 0);
        case RIGHT : this.velocity.set(speed, 0);
      }
    }
  }

  public override function update(_:Float):Void
  {
    this.flipX = this.velocity.x > 0;
    super.update(_);
  }

}


