package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class TitleState extends FlxState
{
  override public function create():Void
  {
    super.create();
    bgColor = Main.BACKGROUND_GREY;

    var titleImage = new FlxSprite();
    titleImage.loadGraphic( AssetPaths.TITLE_SCREEN );
    titleImage.scale.set(0.5, 0.5);
    titleImage.screenCenter();
    add( titleImage );
  }

  override public function update(elapsed:Float):Void
  {
    if(
      FlxG.keys.getIsDown().length > 0 ||
      FlxG.mouse.pressed
      ) FlxG.switchState( new MenuState() );
    super.update(elapsed);
  }
}
