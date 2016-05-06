package;

import flixel.FlxSprite;

typedef Wall = {
  x : Int,
  y : Int,
  graphic : String
};

@:expose class Spawn {

  private static inline var WALL_GRAPHIC = "assets/images/game_wall.png";

  public static var state:PlayState;
  public static var pickups = new List<IPickup>();
  public static var walls = new List<Wall>();

  public static inline function wall(x:Int, y:Int):Void
  {
    walls.add( { x : x, y : y, graphic : WALL_GRAPHIC } );
  }

  public static inline function gem(x:Int, y:Int):Void
  {
    trace('spawning gem at $x $y');

  }

#if neko
  public static inline function dev():Void
  {
    wall( 120, 240 );
    wall( 160, 200 );
  }
#end

}
