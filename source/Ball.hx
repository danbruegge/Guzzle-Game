package;

import flash.filters.GlowFilter;
import flixel.FlxSprite;
import flixel.effects.FlxSpriteFilter;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class Ball extends FlxSprite {

    public var ballTween:FlxTween;

    var _ballFilter:GlowFilter;
    var _ballFilterSprite:FlxSpriteFilter;

    override public function new(startX:Float=0, startY:Float=0):Void {

        super(startX, startY);

        this.loadGraphic(AssetPaths.ball__png, false, 32, 32);
        this.immovable = true;

        this._ballFilter = new GlowFilter(0xffff851b, 1, 30, 30, 1.5, 1);

        this._ballFilterSprite = new FlxSpriteFilter(this, 30, 30);
        this._ballFilterSprite.addFilter(this._ballFilter);

        this.ballTween = FlxTween.tween(
            this._ballFilter,
            {
                blurX: 1,
                blurY: 1,
            },
            0.5,
            {
                type: FlxTween.PINGPONG,
            }
        );
        this.ballTween.active = false;

    }

    override public function update():Void {
    
        super.update();

        this._ballFilterSprite.applyFilters();

    }

}
