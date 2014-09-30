package;

import flixel.FlxSprite;
import flixel.util.FlxRandom;

class Ball extends FlxSprite {

    public var speed = 400;

    public function new(x:Float=0, y:Float=0):Void {

        super(x, y);

        this.loadGraphic('assets/images/balls.png', true, 32, 32);

        this.elasticity = 1;
        this.velocity.set(this.speed, this.speed);

    }

    override public function update():Void {
    
        super.update();

    }

    public function updateSpeed(speed:Int=0):Void {
    
        var x = this.velocity.x;
        var y = this.velocity.y;

        if (x >= 0) {
            
            x += speed;

        } else {
        
            x -= speed;
        
        }
        
        if (y >= 0) {
        
            y += speed;

        } else {
        
            y -= speed;
        
        }

        this.velocity.set(x, y);
    
    }

}
