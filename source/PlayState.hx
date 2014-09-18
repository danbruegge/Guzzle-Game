package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

using flixel.util.FlxSpriteUtil;

class PlayState extends FlxState {

    var _ball:Ball;
    var _grub:Grub;
    var _walls:Walls;

    override public function create():Void {

        super.create();

        this._walls = new Walls();

        this._ball = new Ball();
        this._ball.screenCenter();

        this._grub = new Grub(32, 32);

        this.add(this._walls);
        this.add(this._ball);
        this.add(this._grub);

    }
    
    override public function destroy():Void {

        super.destroy();

    }

    override public function update():Void {

        super.update();

        FlxG.collide(this._grub, this._walls, this.grubHitWall);
        if (FlxG.pixelPerfectOverlap(this._grub, this._ball)) {
            this.grubOverBall(this._grub, this._ball);
        }

    }

    function grubHitWall(grub:Grub, wall:FlxObject):Void {
    
        grub.changeMovement(this._walls.positions[wall.ID]);

    }

    function grubOverBall(grub:Grub, ball:Ball):Void {
    
        trace('grub over ball');
    
    }

}
