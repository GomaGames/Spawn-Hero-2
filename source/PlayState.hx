package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxColor;
import sprites.Map;
import sprites.Player;

class PlayState extends FlxState
{
  private var map:Map;
  private var player_1:Player;
  private var player_2:Player;
  private var spawn_engine:Spawn;


	override public function create():Void
	{

		super.create();
    map = new Map(this);
    map.makeGraphic( Main.STAGE_WIDTH, Main.STAGE_HEIGHT );
    bgColor = flixel.util.FlxColor.WHITE;
    add(map);
    
    // DRAWING GRID LINES
    for( x in 0...Map.GRID_LINES_X ) add(FlxSpriteUtil.drawLine( map, ( x * Map.GRID_SIZE ) + Map.GRID_SIZE , 0, ( x * Map.GRID_SIZE ) + Map.GRID_SIZE, Main.STAGE_HEIGHT, { color: FlxColor.RED, thickness: 0.5 } ));
    for( y in 0...Map.GRID_LINES_Y ) add(FlxSpriteUtil.drawLine( map, 0, ( y * Map.GRID_SIZE ) + Map.GRID_SIZE , Main.STAGE_WIDTH, ( y * Map.GRID_SIZE ) + Map.GRID_SIZE , { color: FlxColor.RED, thickness: 0.5 } ));


    player_1 = new Player(this,1,10,10);
    add(player_1);

    player_2 = new Player(this,2,100,100);
    add(player_2);

    // Spawn.state = this;
    spawnAll();
	}

  public inline function spawnAll():Void
  {
    // walls
    for( wall in Spawn.walls ){
      // trace(wall);
      // add(wall);
      add( new FlxSprite(wall.x, wall.y, wall.graphic) );
    }

    // pickups

    // enemies

    // heros

  }

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
