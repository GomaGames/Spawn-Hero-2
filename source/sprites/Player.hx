package sprites;

import flixel.FlxSprite;

class Player extends FlxSprite {

  private static inline var default_graphic = "assets/images/graphic-07.png";
  private var graphic_path:String;

  public function new(state:PlayState, x:Int, y:Int) {
    super(x, y, default_graphic);

  }
}

