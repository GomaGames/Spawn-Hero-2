package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.util.FlxAxes;

class EndState extends FlxState
{
  // TO BE REPLACED WITH ACTUAL SCORES
  private static inline var MOCK_SCORE_1:Int = 12;
  private static inline var MOCK_SCORE_2:Int = 32;
  private inline function resolveWinner( player1score:Int, player2score:Int ):Int
  {
    return ( player1score > player2score )?1:2; 
  }

  override public function create():Void
  {
    super.create();
    bgColor = Main.BACKGROUND_GREY;

    var headerText = new FlxText( ( Main.STAGE_WIDTH / 8 ), ( Main.STAGE_HEIGHT / 10 ), 'GAME OVER' );
    headerText.setFormat( AssetPaths.CHUNKY_FONT, 48, Main.FONT_GREY, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    headerText.screenCenter( FlxAxes.X );
    add( headerText );

    var winnerText = new FlxText( Main.STAGE_WIDTH / 2, Main.STAGE_HEIGHT * (20/100), 'Hero ${resolveWinner(MOCK_SCORE_1,MOCK_SCORE_2)} Wins!' );
    winnerText.setFormat( AssetPaths.CHUNKY_FONT, 88, Main.FONT_RED, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    winnerText.screenCenter( FlxAxes.X );
    add( winnerText );

    var player1TextX = (1/5) * Main.STAGE_WIDTH;
    var player2TextX = (3/5) * Main.STAGE_WIDTH;
    var playerTextY = (40/100) * Main.STAGE_HEIGHT;
    
    var player1Text = new FlxText( player1TextX, playerTextY, "Hero 1" );
    player1Text.setFormat( AssetPaths.CHUNKY_FONT, 52, Main.FONT_GREY, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    add( player1Text );

    var player2Text = new FlxText( player2TextX, playerTextY, "Hero 2" );
    player2Text.setFormat( AssetPaths.CHUNKY_FONT, 52, Main.FONT_GREY, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    add( player2Text );

    var player1Score = new FlxText( player1TextX + (player1TextX/10), playerTextY + (playerTextY/4), Std.string( MOCK_SCORE_1 ) );
    player1Score.setFormat( AssetPaths.CHUNKY_FONT, 90, Main.FONT_RED, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    add( player1Score );

    var player2Score = new FlxText( player2TextX + (player2TextX/10), playerTextY + (playerTextY/4), Std.string( MOCK_SCORE_2 ) );
    player2Score.setFormat( AssetPaths.CHUNKY_FONT, 88, Main.FONT_BLUE, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    add( player2Score );

    var playAgain = new FlxText( 3*(Main.STAGE_WIDTH/5), Main.STAGE_HEIGHT * (3/4), "PLAY AGAIN?" );
    playAgain.setFormat( AssetPaths.CHUNKY_FONT, 60, Main.FONT_YELLOW, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    playAgain.screenCenter( FlxAxes.X );
    add( playAgain );

  }

  override public function update(elapsed:Float):Void
  {
    if( FlxG.keys.getIsDown().length > 0 ) FlxG.switchState( new MenuState() );
    super.update(elapsed);
  }
}
