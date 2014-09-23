package;

class BallEnemy extends Ball {

    var _growthRate = 2;

    override public function new(x:Float=0, y:Float=0):Void {

        super(x, y);

        this.animation.frameIndex = 0;

    }

    public function onOverlapClick():Void {
    
        this.updateSpeed(50);
        this.setGraphicSize(
            Std.int(this.width) - this._growthRate,
            Std.int(this.height) - this._growthRate
        );
        this.updateHitbox();
    
    }

    public function noOverlapClick():Void {
    
        this.updateSpeed(-50);
        this.setGraphicSize(
            Std.int(this.width) + this._growthRate,
            Std.int(this.height) + this._growthRate
        );
        this.updateHitbox();
    
    }

}
