package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
  public static inline var STAGE_WIDTH = 920;
  public static inline var STAGE_HEIGHT = 640;

	public function new()
	{
		super();
    //                                skip splash -------------------------------V
    // addChild(new FlxGame(STAGE_WIDTH, STAGE_HEIGHT, MenuState, null, null, null, true));
		addChild(new FlxGame(STAGE_WIDTH, STAGE_HEIGHT, TitleState, null, null, null, true));
	}
}
