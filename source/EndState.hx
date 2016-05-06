package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class EndState extends FlxState
{
  override public function create():Void
  {
    super.create();
    bgColor = Main.BACKGROUND_GREY;

    var headerText = new FlxText( 0 + ( Main.STAGE_WIDTH / 10 ), 0 + ( Main.STAGE_HEIGHT / 10 ), 'GAME OVER', 48 );
    headerText.font = AssetPaths.CHUNKY_FONT;
    add( headerText );

    var player1Text = new FlxText( 1*(Main.STAGE_WIDTH/5), Main.STAGE_HEIGHT/2, "HERO 1", 48 );
    player1Text.font = AssetPaths.CHUNKY_FONT;
    add( player1Text );

    var player2Text = new FlxText( 3*(Main.STAGE_WIDTH/5), Main.STAGE_HEIGHT/2, "HERO 2", 48 );
    player2Text.font = AssetPaths.CHUNKY_FONT;
    add( player2Text );

  }

  override public function update(elapsed:Float):Void
  {
    if( FlxG.keys.getIsDown().length > 0 ) FlxG.switchState( new PlayState() );
    super.update(elapsed);
  }
}