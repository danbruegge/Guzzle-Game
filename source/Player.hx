package;

import flixel.FlxG;
import flixel.FlxSprite;

using flixel.util.FlxSpriteUtil;

class Player extends FlxSprite {

    public var isOverlapped = false;

    var _growthRate = 5;

    override public function new(x:Float=0, y:Float=0):Void {

        super(x, y);

        this.loadGraphic(AssetPaths.player__png, false, 32, 32);
        this.immovable = true;

    }

    override public function update():Void {
    
        super.update();

    }

    public function checkOverlap(enemy:BallEnemy):Void {
    
        if (FlxG.overlap(enemy, this)) {
        
            if (!this.isOverlapped) {

                this.isOverlapped = true;

            }

            if (FlxG.mouse.justReleased) {
            // if (FlxG.mouse.justReleased || FlxG.touches.justReleased) {

                if (this.isOverlapped) {
            
                    this.onOverlapClick();
                    enemy.onOverlapClick();

                } else {

                    this.noOverlapClick();
                    enemy.noOverlapClick();

                }

            }
        
        } else {

            this.isOverlapped = false;

        }

    }

    public function onOverlapClick():Void {
    
        this.setGraphicSize(
            Std.int(this.width) + this._growthRate,
            Std.int(this.height) + this._growthRate
        );
        this._updateSprite();
    
    }

    public function noOverlapClick():Void {
    
        this.setGraphicSize(
            Std.int(this.width) - this._growthRate,
            Std.int(this.height) - this._growthRate
        );
        this._updateSprite();
    
    }

    function _updateSprite():Void {
    
        this.updateHitbox();
        this.screenCenter();

    }

}
