package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class MenuState extends FlxState
{
  private var ready_text:FlxText; // don't allow rapid continue while holding buttons
  private var countdown_timer:FlxTimer;
  private var countdown_seconds:Int = 3;

	override public function create():Void
	{
		super.create();
    bgColor = Main.BACKGROUND_GREY;

    var titleImage = new FlxSprite();
    titleImage.loadGraphic( AssetPaths.INSTRUCTION_SCREEN );
    titleImage.scale.set(0.5, 0.5);
    titleImage.screenCenter();
    add( titleImage );

    ready_text = new FlxText( 400, 600, Std.string( "READY?" ) );
    ready_text.setFormat( "Arial", 30, Main.FONT_BLUE, FlxTextAlign.CENTER, FlxTextBorderStyle.SHADOW, FlxColor.BLACK, true);
    add( ready_text );

	}

  private inline function start_countdown():Void
  {
    countdown_timer = new FlxTimer();
    countdown_timer.start(countdown_seconds, function(t){
      FlxG.switchState( new PlayState() );
    });
  }

	override public function update(elapsed:Float):Void
	{
    if( countdown_timer == null && FlxG.keys.getIsDown().length > 0 ){
      start_countdown();
    }

    if( countdown_timer != null ){
      ready_text.text = Std.string(Std.int(countdown_timer.timeLeft));
    }

		super.update(elapsed);
	}
}
