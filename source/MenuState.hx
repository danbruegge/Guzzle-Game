package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxDestroyUtil;
import flixel.util.FlxMath;

using flixel.util.FlxSpriteUtil;

class MenuState extends FlxState {

    var _btnPlay:FlxButton;

    override public function create():Void {

        super.create();
        
        this.bgColor = 0xff3d9970;

        this._btnPlay = new FlxButton(10, 10, 'Play', this._clickPlay);
        this._btnPlay.screenCenter();

        this.add(this._btnPlay);

    }
    
    override public function destroy():Void {

        FlxDestroyUtil.destroy(this._btnPlay);

        super.destroy();
            
    }

    override public function update():Void {

        super.update();

    }

    function _clickPlay():Void {

        FlxG.switchState(new PlayState());

    }

}
