package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
    bgColor = Main.BACKGROUND_GREY;

    var titleImage = new FlxSprite();
    titleImage.loadGraphic( AssetPaths.INSTRUCTION_SCREEN );
    titleImage.scale.set(0.5, 0.5);
    titleImage.screenCenter();
    add( titleImage );

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
