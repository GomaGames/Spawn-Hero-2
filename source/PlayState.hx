package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.Map;
import sprites.Player;

class PlayState extends FlxState
{
  private var map:Map;
  private var player:Player;

	override public function create():Void
	{
		super.create();
    map = new Map(this);
    add(map);

    player = new Player(this,1,10,10);
    add(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
