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
  
  public static inline function drawGridLines( state:PlayState, map:FlxSprite ):Void
  {
    // DRAWING GRID LINES
    for( x in 0...GRID_LINES_X ) state.add(FlxSpriteUtil.drawLine( map, ( x * GRID_SIZE ) + GRID_SIZE , 0, ( x * GRID_SIZE ) + GRID_SIZE, Main.STAGE_HEIGHT, { color: FlxColor.RED, thickness: 0.5 } ));
    for( y in 0...GRID_LINES_Y ) state.add(FlxSpriteUtil.drawLine( map, 0, ( y * GRID_SIZE ) + GRID_SIZE , Main.STAGE_WIDTH, ( y * GRID_SIZE ) + GRID_SIZE , { color: FlxColor.RED, thickness: 0.5 } ));
  }
}
