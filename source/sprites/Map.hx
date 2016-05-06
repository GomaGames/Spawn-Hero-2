package sprites;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

class Map extends FlxSprite {
  public static inline var GRID_SIZE:Int = 40;
  public static inline var GRID_LINES_X:Int = 23;
  public static inline var GRID_LINES_Y:Int = 15;
  public static inline var TOP_BAR_BUFFER:Int = 40;

  public static var TOPBAR_GREY:FlxColor = FlxColor.fromString('#212121');
  public static var LINES_GREY:FlxColor = FlxColor.fromString('#6d6e70');

  public function new(state:PlayState) {
    super(0,0);
  }
  
  public static inline function drawGridLines( state:PlayState, map:FlxSprite ):Void
  {
    // DRAWING GRID LINES
    for( x in 0...GRID_LINES_X ) {
      var x_line = FlxSpriteUtil.drawLine( map, ( x * GRID_SIZE ) + GRID_SIZE , TOP_BAR_BUFFER, ( x * GRID_SIZE ) + GRID_SIZE, Main.STAGE_HEIGHT, { color: LINES_GREY, thickness: 0.5 } );
      x_line.immovable = true;
      state.add( x_line );
    }
    for( y in 0...GRID_LINES_Y ) {
      var y_line = FlxSpriteUtil.drawLine( map, 0, TOP_BAR_BUFFER + ( y * GRID_SIZE ) + GRID_SIZE , Main.STAGE_WIDTH, TOP_BAR_BUFFER + ( y * GRID_SIZE ) + GRID_SIZE , { color: LINES_GREY, thickness: 0.5 } );
      y_line.immovable = true;
      state.add( y_line );
    }
  }

  public static inline function drawTopBar( state:PlayState, map:FlxSprite ):Void
  {
    // var topBar = FlxSpriteUtil.drawRect( map, 0, 110, Main.STAGE_WIDTH, GRID_SIZE, FlxColor.BLACK, { color: FlxColor.RED, thickness: 0.5 } );
    var topBar = new FlxSprite();
    topBar.makeGraphic(Main.STAGE_WIDTH, GRID_SIZE, TOPBAR_GREY);
    topBar.immovable = true;
    state.add( topBar );
    var hero1Text = new FlxText( 2*( Main.STAGE_WIDTH / GRID_LINES_X ), 10, "Hero 1");
    var hero2Text = new FlxText( Main.STAGE_WIDTH - 4 *( Main.STAGE_WIDTH / GRID_LINES_X ), 10, "Hero 2");
    hero1Text.setFormat( AssetPaths.CHUNKY_FONT, 18, Main.FONT_GREY, FlxTextAlign.LEFT, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    hero2Text.setFormat( AssetPaths.CHUNKY_FONT, 18, Main.FONT_GREY, FlxTextAlign.LEFT, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    state.add( hero1Text );
    state.add( hero2Text );
  }
}
