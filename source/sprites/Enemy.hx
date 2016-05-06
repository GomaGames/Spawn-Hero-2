package sprites;

import flixel.FlxSprite;
using flixel.util.FlxSpriteUtil;

class Enemy extends FlxSprite {

  public static inline var UP = "up";
  public static inline var DOWN = "down";
  public static inline var LEFT = "left";
  public static inline var RIGHT = "right";
  public static inline var DEFAULT_VELOCITY = 100;
  public var speed = DEFAULT_VELOCITY;

  public function new(x:Int, y:Int, graphic:String, ?direction:String){
    super(x, y, graphic);
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
    super.update(_);
  }

}


