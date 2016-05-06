package sprites;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.group.FlxGroup;

class Map extends FlxSprite {
  public static inline var GRID_SIZE:Int = 40;
  public static inline var GRID_LINES_X:Int = 23;
  public static inline var GRID_LINES_Y:Int = 15;
  public function new(state:PlayState) {
    super(0,0);
  }
  
  
}
