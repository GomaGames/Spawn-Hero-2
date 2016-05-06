package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxColor;
import sprites.Map;
import sprites.Player;
import sprites.Enemy;
import sprites.pickups.Pickup;

class PlayState extends FlxState
{
  private var map:Map;
  private var player_1:Player;
  private var player_2:Player;
  private var spawn_engine:Spawn;
  private var pickups:List<Pickup>;
  private var enemies:List<Enemy>;


	override public function create():Void
	{
    pickups = new List<Pickup>();
    enemies = new List<Enemy>();

		super.create();
    map = new Map(this);
    map.makeGraphic( Main.STAGE_WIDTH, Main.STAGE_HEIGHT );
    Map.drawGridLines( this, map );
    bgColor = flixel.util.FlxColor.WHITE;
    add(map);
    add(flixel.util.FlxCollision.createCameraWall(FlxG.camera, true, 1));


#if neko
    Spawn.dev();
#end
    spawnAll();
	}

  private inline function spawnAll():Void
  {
    // walls
    for( wall in Spawn.walls ){
      var wall = new FlxSprite(wall.x, wall.y, wall.graphic);
      wall.immovable = true;
      add( wall );
    }

    // pickups
    for( pickup in Spawn.pickups ){
      var new_pickup:Pickup = switch(pickup.type){

        case GEM: null;
          new sprites.pickups.Gem(pickup.x, pickup.y, pickup.graphic);

        case FREEZE:
          new sprites.pickups.Freeze(pickup.x, pickup.y, pickup.graphic);

        case SLOW: null;
          new sprites.pickups.Slow(pickup.x, pickup.y, pickup.graphic);

        case SPEED: null;
          new sprites.pickups.Speed(pickup.x, pickup.y, pickup.graphic);

      }

      pickups.add(new_pickup);
      add(new_pickup);
    }

    // enemies
    for( enemy in Spawn.enemies ){
      var new_enemy = new Enemy(enemy.x, enemy.y, enemy.graphic, enemy.direction);
      enemies.add(new_enemy);
      add(new_enemy);
    }

    // heros
    if( Spawn.hero_1_setting != null ){
      player_1 = new Player(this,1,Spawn.hero_1_setting.x,Spawn.hero_1_setting.y);
      add(player_1);
    }

    if( Spawn.hero_1_setting != null ){
      player_2 = new Player(this,2,Spawn.hero_2_setting.x,Spawn.hero_2_setting.y);
      add(player_2);
    }

  }

  private inline function pickup_collision():Void
  {
    for( pickup in pickups ){
      for( hero in [player_1,player_2] ){
        if( FlxG.collide(hero, pickup) ){
          remove(pickup);
          pickups.remove(pickup);
          switch(Type.getClass(pickup)){
            case sprites.pickups.Speed:
              hero.speed_boost(pickup.DURATION);
            case sprites.pickups.Slow:
              hero.slow_down(pickup.DURATION);
            case sprites.pickups.Freeze:
              hero.freeze(pickup.DURATION);
            case sprites.pickups.Gem:
              hero.score(pickup.POINTS);
          }
        }
      }

    }
  }

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

    pickup_collision();

    FlxG.collide();
	}
}
