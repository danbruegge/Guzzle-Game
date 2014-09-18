package;

import flixel.FlxSprite;

class Ball extends FlxSprite {

    override public function new(startX:Float=0, startY:Float=0):Void {

        super(startX, startY);

        this.loadGraphic(AssetPaths.ball__png, false, 32, 32);
        this.immovable = true;

    }

}
