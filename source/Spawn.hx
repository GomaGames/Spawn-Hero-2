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
  skin : String
}

typedef Wall = Placeable;

typedef PlacePickup = { > Placeable,
  type : PickupType,
  ?points : Int,
  ?duration : Int
}

typedef HeroSetting = {
  x : Int,
  y : Int
}

typedef Enemy = {
  x : Int,
  y : Int,
  direction : String,
  skin : String,
  speed : Int
}

@:expose class Spawn {

  public static inline var DEFAULT_WALL_SKIN = "assets/images/17.png";

  public static var hero_1_setting:HeroSetting;
  public static var hero_2_setting:HeroSetting;
  public static var state:PlayState;
  public static var pickups = new List<PlacePickup>();
  public static var walls = new List<Wall>();
  public static var enemies = new List<Enemy>();

  public static inline function hero_1(x:Int, y:Int):Void
  {
    hero_1_setting = { x : x, y : y };
  }

  public static inline function hero_2(x:Int, y:Int):Void
  {
    hero_2_setting = { x : x, y : y };
  }

  public static inline function wall(x:Int, y:Int, ?skin:String):Void
  {
    walls.add({
      x : x,
      y : y,
      skin : skin != null ? skin : Settings.wall.default_skin,
    });
  }

  public static inline function freeze(x:Int, y:Int, ?duration:Int, ?skin:String):Void
  {
    pickups.add({
      type: FREEZE,
      x : x,
      y : y,
      skin : skin != null ? skin : Settings.freeze.default_skin,
      duration : duration != null ? duration : Settings.freeze.default_duration
    });
  }

  public static inline function speed(x:Int, y:Int, ?duration:Int, ?skin:String):Void
  {
    pickups.add({
      type: SPEED,
      x : x,
      y : y,
      skin : skin != null ? skin : Settings.speed.default_skin,
      duration : duration != null ? duration : Settings.speed.default_duration
    });
  }


  public static inline function slow(x:Int, y:Int, ?duration:Int, ?skin:String):Void
  {
    pickups.add({
      type: SLOW,
      x : x,
      y : y,
      skin : skin != null ? skin : Settings.slow.default_skin,
      duration : duration != null ? duration : Settings.slow.default_duration
    });
  }

  public static inline function gem(x:Int, y:Int, ?points:Int, ?skin:String):Void
  {
    pickups.add({
      type: GEM,
      x : x,
      y : y,
      skin : skin != null ? skin : Settings.gem.default_skin,
      points : points != null ? points : Settings.gem.default_points
    });
  }

  public static inline function enemy(x:Int, y:Int, ?direction:String, ?speed:Int, ?skin:String):Void
  {
    enemies.add({
      direction: direction,
      x : x,
      y : y,
      skin : skin != null ? skin : Settings.enemy.default_skin,
      speed : speed != null ? speed : Settings.enemy.default_speed
    });
  }

#if neko
  public static inline function dev():Void
  {
    hero_1( 0, 50 );
    hero_2( 400, 50 );
    wall( 120, 240 );
    wall( 160, 200 );
    freeze( 200, 200 );
    speed( 160, 100 );
    slow( 160, 300 );
    gem( 200, 100 );
    gem( 200, 400 );
    enemy( 650, 500 , "down");
    wall( 650, 600 );
    enemy( 500, 550 , "right");
    enemy( 600, 500 , "up");
    enemy( 500, 450 , "left");
    enemy( 400, 450 );
  }
#end

}
