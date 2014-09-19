package;

import flixel.FlxSprite;
import flixel.util.FlxAngle;
import flixel.util.FlxRandom;

class Grub extends FlxSprite {

    var _speed:Int;
    var _angle:Int;

    public function new(startX:Float=0, startY:Float=0):Void {

        super(startX, startY);

        this._speed = 500;
        this._angle = FlxRandom.intRanged(-179, 180);

        this.loadGraphic(AssetPaths.grub__png, false, 32, 32);
        this.setGraphicSize(16, 16);

        this.elasticity = 1;
        this.drag.x = this.drag.y = 1600;

    }

    override public function update():Void {
    
        super.update();

        FlxAngle.rotatePoint(this._speed, 0, 0, 0, this._angle, this.velocity); 

    }

    public function changeMovement(wallPos:String):Void {
    
        var range = FlxRandom.intRanged(0, 20);
        switch(wallPos) {
        
            case 'top':
                if (this._angle > -90) {
                    this._angle = 45 + range;
                } else {
                    this._angle = 135 + range;
                }

            case 'bottom': 
                if (this._angle < 90) {
                    this._angle = -45 - range;
                } else {
                    this._angle = -135 - range;
                }

            case 'left':
                if (this._angle < 0) {
                    this._angle = -45 - range;
                } else {
                    this._angle = 45 + range;
                }
 
            case 'right':
                if (this._angle < 0) {
                    this._angle = -135 - range;
                } else {
                    this._angle = 135 + range;
                }

        }
    
    }

}
