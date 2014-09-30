package;

import flixel.FlxG;
import flixel.FlxSprite;

using flixel.util.FlxSpriteUtil;

class Player extends FlxSprite {

    public var halo:FlxSprite; // the halo around the player for klicking
    public var isOverlapped = false;

    var _growthRate = 5;

    override public function new(x:Float=0, y:Float=0):Void {

        super(x, y);

        this.loadGraphic('assets/images/player.png', true, 32, 32);
        this.immovable = true;
        this.antialiasing = true;

        this.animation.add('normal', [0, 1, 2, 3], 15);
        this.animation.add('active', [4, 5, 6, 7], 15);

        this.halo = new FlxSprite();
        this.halo.loadGraphic('assets/images/player_halo.png', false, 96, 96);
        this.halo.immovable = true;
        this.halo.antialiasing = true;
        this.halo.screenCenter();

    }

    override public function update():Void {
    
        super.update();

        if (this.isOverlapped) {
        
            this.animation.play('active');
        
        } else {
        
            this.animation.play('normal');
        
        }

    }

    public function checkOverlap(enemy:BallEnemy):Void {
    
        if (FlxG.overlap(enemy, this.halo)) {
        
            if (!this.isOverlapped) {

                this.isOverlapped = true;

            }

        } else {

            this.isOverlapped = false;

        }

        if (FlxG.mouse.justReleased) {

            if (this.isOverlapped) {

                this.onOverlapClick();
                enemy.onOverlapClick();

            } else {

                this.noOverlapClick();
                enemy.noOverlapClick();

            }

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
