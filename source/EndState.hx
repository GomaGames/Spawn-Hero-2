package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.util.FlxAxes;
import sprites.Player;

enum EndType {
  TIME_OUT;
  SURVIVED; // if there are no gems, timed out, there is a survivor
  NO_SURVIVORS; // if there are no gems, there is no survivors, all lose
  FINISH; // if there are gems, all gems have been collected
}

class EndState extends FlxState
{
  private var p1Score:Int;
  private var p2Score:Int;
  private var end_type:EndType;

  private inline function resolveWinner( p1Score:Int, p2Score:Int ):String
  {
    if( p1Score == p2Score ) return "It's a tie!"; // REFACTOR WHEN SURVIVAL IS IMPLEMENTED
    var winner = ( p1Score > p2Score )?1:2;
    var text = switch( this.end_type ){
      // TODO: VICTORY CONDITIONS
      case EndType.TIME_OUT: 'Hero ${winner} Wins!';
      case EndType.SURVIVED: 'Hero Survived!';
      case EndType.NO_SURVIVORS: 'Nobody survived!';
      case EndType.FINISH: 'Hero ${winner} Wins!';
      default: 'Hero ${winner} Wins!';
    }
    return text;
  }

  public function new(player_1:Player, player_2:Player, end_type:EndType){
    super();
    this.p1Score = player_1.points;
    this.p2Score = player_2.points;
    this.end_type = end_type;
  }

  override public function create():Void
  {
    super.create();
    bgColor = Main.BACKGROUND_GREY;

    var headerText = new FlxText( ( Main.STAGE_WIDTH / 8 ), ( Main.STAGE_HEIGHT / 10 ), 'GAME OVER' );
    headerText.setFormat( AssetPaths.CHUNKY_FONT, 42, Main.FONT_GREY, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    headerText.screenCenter( FlxAxes.X );
    add( headerText );

    var winnerText = new FlxText( Main.STAGE_WIDTH / 2, Main.STAGE_HEIGHT * (20/100), resolveWinner( this.p1Score, this.p2Score ));
    winnerText.setFormat( AssetPaths.CHUNKY_FONT, 72, Main.FONT_RED, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
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

    var player1Score = new FlxText( player1TextX + 50, playerTextY + (playerTextY/4), Std.string( this.p1Score ) );
    player1Score.setFormat( AssetPaths.CHUNKY_FONT, 90, Main.FONT_BLUE, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    add( player1Score );

    var player2Score = new FlxText( player2TextX + 50, playerTextY + (playerTextY/4), Std.string( this.p2Score ) );
    player2Score.setFormat( AssetPaths.CHUNKY_FONT, 88, Main.FONT_RED, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    add( player2Score );

    var playAgain = new FlxText( 3*(Main.STAGE_WIDTH/5), Main.STAGE_HEIGHT * (3/4), "PLAY AGAIN?" );
    playAgain.setFormat( AssetPaths.CHUNKY_FONT, 60, Main.FONT_YELLOW, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    playAgain.screenCenter( FlxAxes.X );
    add( playAgain );

  }

  override public function destroy():Void
  {
    p1Score = null;
    p2Score = null;
    end_type = null;
    super.destroy();
  }
  override public function update(elapsed:Float):Void
  {
    if( FlxG.keys.getIsDown().length > 0 ) FlxG.switchState( new MenuState() );
    super.update(elapsed);
  }

}
