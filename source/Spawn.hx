package;

import flixel.FlxSprite;

enum PickupType{
  GEM;
  FREEZE;
  SLOW;
  SPEED;
}

typedef Placeable = {
  x : Int,
  y : Int,
  graphic : String
}

typedef Wall = Placeable;

typedef PlacePickup = { > Placeable,
  type : PickupType
}

typedef HeroSetting = {
  x : Int,
  y : Int
}

@:expose class Spawn {

  private static inline var WALL_GRAPHIC = "assets/images/game_wall.png";
  private static inline var FREEZE_GRAPHIC = "assets/images/graphic-49.png";
  private static inline var SPEED_GRAPHIC = "assets/images/game_good.png";
  private static inline var SLOW_GRAPHIC = "assets/images/graphic-45.png";
  private static inline var GEM_GRAPHIC = "assets/images/graphic-57.png";

  public static var hero_1_setting:HeroSetting;
  public static var hero_2_setting:HeroSetting;
  public static var state:PlayState;
  public static var pickups = new List<PlacePickup>();
  public static var walls = new List<Wall>();

  public static inline function hero_1(x:Int, y:Int):Void
  {
    hero_1_setting = { x : x, y : y };
  }

  public static inline function hero_2(x:Int, y:Int):Void
  {
    hero_2_setting = { x : x, y : y };
  }

  public static inline function wall(x:Int, y:Int):Void
  {
    walls.add( { x : x, y : y, graphic : WALL_GRAPHIC } );
  }

  public static inline function freeze(x:Int, y:Int):Void
  {
    pickups.add( { type: FREEZE, x : x, y : y, graphic : FREEZE_GRAPHIC } );
  }

  public static inline function speed(x:Int, y:Int):Void
  {
    pickups.add( { type: SPEED, x : x, y : y, graphic : SPEED_GRAPHIC } );
  }

  public static inline function slow(x:Int, y:Int):Void
  {
    pickups.add( { type: SLOW, x : x, y : y, graphic : SLOW_GRAPHIC } );
  }

  public static inline function gem(x:Int, y:Int):Void
  {
    pickups.add( { type: GEM, x : x, y : y, graphic : GEM_GRAPHIC } );

  }

#if neko
  public static inline function dev():Void
  {
    hero_1( 0, 0 );
    hero_2( 400, 0 );
    wall( 120, 240 );
    wall( 160, 200 );
    freeze( 200, 200 );
    speed( 160, 100 );
    slow( 160, 300 );
    gem( 200, 100 );
  }
#end

}
