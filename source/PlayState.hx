package;

import Std;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxRandom;
import flixel.plugin.MouseEventManager;

using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState {

    var _player:Player;
    var _enemies:Enemies;
    var _walls:Walls;

    override public function create():Void {

        super.create();

        FlxG.plugin.add(new MouseEventManager);

        this._walls = new Walls();

        this._player = new Player();
        this._player.screenCenter();

        this._enemies = new Enemies();

        this.add(this._walls);
        this.add(this._player);
        this.add(this._player.halo);
        this.add(this._enemies);

    }
    
    override public function destroy():Void {

        super.destroy();

    }

    override public function update():Void {

        super.update();

        FlxG.collide(this._enemies, this._walls);
        FlxG.collide(this._enemies, this._enemies);
        FlxG.collide(this._enemies, this._player);
        FlxG.overlap(this._enemies, this._player.halo, this._player.haloOverlaps);
        // this._player.checkOverlap(this._enemies);

    }

}
