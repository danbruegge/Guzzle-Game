package;

import Std;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxRandom;

using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState {

    var _player:Player;
    var _enemy:BallEnemy;
    var _walls:Walls;

    override public function create():Void {

        super.create();

        this._walls = new Walls();

        this._player = new Player();
        this._player.screenCenter();

        this._enemy = new BallEnemy(
            FlxRandom.intRanged(
                Std.int(FlxG.width * 0.1),
                Std.int(FlxG.width * 0.9)
            ),
            FlxRandom.intRanged(
                Std.int(FlxG.height * 0.1),
                Std.int(FlxG.height * 0.9)
            )
        );

        this.add(this._walls);
        this.add(this._player);
        this.add(this._player.halo);
        this.add(this._enemy);

    }
    
    override public function destroy():Void {

        super.destroy();

    }

    override public function update():Void {

        super.update();

        FlxG.collide(this._enemy, this._walls);
        FlxG.collide(this._enemy, this._player);
        this._player.checkOverlap(this._enemy);

    }

}
