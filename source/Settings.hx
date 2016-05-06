package;

import sprites.Player;
import sprites.Enemy;

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

}
