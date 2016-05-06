package sprites.pickups;

import flixel.FlxSprite;

class Gem extends Pickup {

  public static inline var DEFAULT_POINTS = 1;

  public function new(x:Int, y:Int, graphic:String, ?points:Int = DEFAULT_POINTS){
    super(x, y, graphic);
    if(points != null){
      POINTS = points;
    }
  }

}

