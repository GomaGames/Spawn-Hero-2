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
    bgColor = FlxColor.GRAY;

    var titleText = new FlxText( Main.STAGE_WIDTH/4, Main.STAGE_HEIGHT/3, "SPAWN HERO", 72 );
    titleText.font = AssetPaths.CHUNKY_FONT;
    add( titleText );

    var startText = new FlxText( 2*(Main.STAGE_WIDTH/5), Main.STAGE_HEIGHT/2, "START", 48 );
    startText.font = AssetPaths.CHUNKY_FONT;
    add( startText );
  }

  override public function update(elapsed:Float):Void
  {
    super.update(elapsed);
  }
}
