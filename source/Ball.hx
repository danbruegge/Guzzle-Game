package;

import flixel.FlxSprite;
import flixel.util.FlxAngle;
import flixel.util.FlxRandom;

class Ball extends FlxSprite {

    public var speed = 400;

    var _angle:Int;

    public function new(x:Float=0, y:Float=0):Void {

        super(x, y);

        this._angle = FlxRandom.intRanged(-179, 180);

        this.loadGraphic(AssetPaths.balls__png, true, 32, 32);

        this.elasticity = 1;
        this.drag.x = this.drag.y = 1600;

    }

    override public function update():Void {
    
        super.update();

        FlxAngle.rotatePoint(this.speed, 0, 0, 0, this._angle, this.velocity); 

    }

    public function changeMovement(wallPos:String):Void {
    
        var angl = this._angle;
        var range = FlxRandom.intRanged(0, 20);

        switch(wallPos) {
        
            case 'top':
                if (angl > -90) {
                    angl = 45 - range;
                } else {
                    angl = 135 + range;
                }

            case 'bottom': 
                if (angl < 90) {
                    angl = -45 - range;
                } else {
                    angl = -135 - range;
                }

            case 'left':
                if (angl < 0) {
                    angl = -45 + range;
                } else {
                    angl = 45 - range;
                }
 
            case 'right':
                if (angl < 0) {
                    angl = -135 - range;
                } else {
                    angl = 135 - range;
                }

        }

        this._angle = angl;
    
    }

}
