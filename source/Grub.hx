package;

import flixel.FlxSprite;
import flixel.util.FlxAngle;

class Grub extends FlxSprite {

    var _speed = 500;
    var _angle = -45;

    public function new(startX:Float=0, startY:Float=0):Void {

        super(startX, startY);

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
    
        switch(wallPos) {
        
            case 'top':
                if (this._angle > -90) {
                    this._angle = 45;
                } else {
                    this._angle = 135;
                }
                // this._angle = 90; // to bottom

            case 'bottom': 
                if (this._angle < 90) {
                    this._angle = -45;
                } else {
                    this._angle = -135;
                }
                // this._angle = -90; // to top

            case 'left':
                if (this._angle < 0) {
                    this._angle = -45;
                } else {
                    this._angle = 45;
                }
                // this._angle = 0; // to right
 
            case 'right':
                if (this._angle < 0) {
                    this._angle = -135;
                } else {
                    this._angle = 135;
                }
                // this._angle = 180; // to left

        };
    
    }

}
