package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

enum EndType {
  TIME_OUT;
  SURVIVED; // if there are no gems, timed out
  FINISH; // if there are gems, all gems have been collected
}

class EndState extends FlxState
{
  public function new(player_1_score:Int, player_2_score:Int, end_type:EndType){
    super();

  }

  override public function create():Void
  {
    super.create();
    bgColor = Main.BACKGROUND_GREY;

    var headerText = new FlxText( 0 + ( Main.STAGE_WIDTH / 10 ), 0 + ( Main.STAGE_HEIGHT / 10 ), 'GAME OVER', 48 );
    headerText.setFormat( AssetPaths.CHUNKY_FONT, 32, Main.FONT_GREY, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    add( headerText );

    var winnerText = new FlxText( Main.STAGE_WIDTH / 2, Main.STAGE_HEIGHT / 2, 'SOMEBODY WON', 72 );
    winnerText.setFormat( AssetPaths.CHUNKY_FONT, 32, Main.FONT_RED, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    winnerText.screenCenter();
    add( winnerText );

    var player1Text = new FlxText( 1*(Main.STAGE_WIDTH/5), Main.STAGE_HEIGHT/2, "HERO 1", 48 );
    player1Text.setFormat( AssetPaths.CHUNKY_FONT, 32, Main.FONT_GREY, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    add( player1Text );

    var player2Text = new FlxText( 3*(Main.STAGE_WIDTH/5), Main.STAGE_HEIGHT/2, "HERO 2", 48 );
    player2Text.setFormat( AssetPaths.CHUNKY_FONT, 32, Main.FONT_GREY, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    add( player2Text );

    var playAgain = new FlxText( 3*(Main.STAGE_WIDTH/5), Main.STAGE_HEIGHT/2, "PLAY AGAIN?", 48 );
    playAgain.setFormat( AssetPaths.CHUNKY_FONT, 32, Main.FONT_YELLOW, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    playAgain.y = ( 2/3 ) * ( Main.STAGE_HEIGHT );
    playAgain.x = ( 1/3 ) * ( Main.STAGE_WIDTH );
    add( playAgain );

  }

  override public function update(elapsed:Float):Void
  {
    if( FlxG.keys.getIsDown().length > 0 ) FlxG.switchState( new PlayState() );
    super.update(elapsed);
  }
}
