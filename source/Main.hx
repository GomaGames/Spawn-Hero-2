package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
    //                                skip splash --------------V
		addChild(new FlxGame(640, 480, PlayState, null, null, null, true));
	}
}
