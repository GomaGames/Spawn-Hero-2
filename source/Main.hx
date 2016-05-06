package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
  private static inline var STAGE_WIDTH = 920;
  private static inline var STAGE_HEIGHT = 640;

	public function new()
	{
		super();
    //                                skip splash -------------------------------V
		addChild(new FlxGame(STAGE_WIDTH, STAGE_HEIGHT, PlayState, null, null, null, true));
	}
}
