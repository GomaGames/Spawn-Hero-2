package sprites.pickups;

import flixel.FlxSprite;

class Gem extends Pickup {

  public static inline var DEFAULT_POINTS = 1;
  public static inline var DEFAULT_SKIN = "assets/images/27.png";

  public function new(x:Int, y:Int, graphic:String, points:Int){
    super(x, y, graphic);
    this.scale.set(.5,.5);
    this.updateHitbox();
    if(points != null){
      POINTS = points;
    }
  }

}

