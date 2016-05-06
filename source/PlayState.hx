package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import sprites.Map;

class PlayState extends FlxState
{
  private var map:Map;

	override public function create():Void
	{
		super.create();
    map = new Map(this);
    add(map);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
