package;

import flixel.FlxGame;
import openfl.display.Sprite;
import flixel.util.FlxColor;
class Main extends Sprite
{
  public static inline var STAGE_WIDTH = 920;
  public static inline var STAGE_HEIGHT = 680;
  public static var BACKGROUND_GREY:FlxColor = FlxColor.fromString('#333333');
  public static var FONT_GREY:FlxColor = FlxColor.fromString('#6d6e70');
  public static var FONT_RED:FlxColor = FlxColor.fromString('#e76924');
  public static var FONT_YELLOW:FlxColor = FlxColor.fromString('#fec256');
  public static var FONT_BLUE:FlxColor = FlxColor.fromString('#5dc3ce');
	public function new()
	{
		super();
    //                                skip splash -------------------------------V
    // addChild(new FlxGame(STAGE_WIDTH, STAGE_HEIGHT, MenuState, null, null, null, true));
		addChild(new FlxGame(STAGE_WIDTH, STAGE_HEIGHT, PlayState, null, null, null, true));
	}
}
