package;

import sprites.Player;
import sprites.Enemy;
import sprites.pickups.*;

@:expose class Settings {

  public static var time_limit = 4; // seconds

  public static var hero_1 = {
    skin : Player.default_graphic,
    speed : Player.default_speed
  };
  public static var hero_2 = {
    skin : Player.default_graphic,
    speed : Player.default_speed
  };

  public static var enemy = {
    default_skin : Enemy.default_skin,
    default_speed : Enemy.default_speed
  }

  public static var wall = {
    skin : Spawn.WALL_GRAPHIC
  }

  public static var gem = {
    default_skin : Gem.DEFAULT_SKIN,
    default_points : Gem.DEFAULT_POINTS
  }

  public static var freeze = {
    default_skin : Freeze.DEFAULT_SKIN,
    default_duration : Freeze.DEFAULT_DURATION
  }

  public static var speed = {
    default_skin : Speed.DEFAULT_SKIN,
    default_duration : Speed.DEFAULT_DURATION
  }

}
