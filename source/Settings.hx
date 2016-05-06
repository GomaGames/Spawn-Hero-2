package;

import sprites.Player;
import sprites.Enemy;
import sprites.pickups.*;

@:expose class Settings {

  public static var time_limit = 4; // seconds

  public static var hero_1 = {
    skin : Player.DEFAULT_SKIN_1,
    speed : Player.DEFAULT_SPEED
  };
  public static var hero_2 = {
    skin : Player.DEFAULT_SKIN_1,
    speed : Player.DEFAULT_SPEED
  };

  public static var enemy = {
    default_skin : Enemy.DEFAULT_SKIN,
    default_speed : Enemy.DEFAULT_SPEED
  }

  public static var wall = {
    default_skin : Spawn.DEFAULT_WALL_SKIN
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

  public static var slow = {
    default_skin : Slow.DEFAULT_SKIN,
    default_duration : Slow.DEFAULT_DURATION
  }

}
