package;

import sprites.Player;

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

}
