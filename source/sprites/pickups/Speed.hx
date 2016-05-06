package sprites.pickups;

import flixel.FlxSprite;

class Speed extends Pickup {

  public static inline var DEFAULT_DURATION = 2; // seconds

  public function new(x:Int, y:Int, graphic:String, ?duration:Float = DEFAULT_DURATION){
    super(x, y, graphic);
    if(duration != null){
      DURATION = duration;
    }
  }

}
