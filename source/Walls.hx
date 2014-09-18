package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

class Walls extends FlxGroup {

    public var positions:Array<String>;

    var _topWall:FlxSprite;
    var _bottomWall:FlxSprite;
    var _leftWall:FlxSprite;
    var _rightWall:FlxSprite;

    override public function new():Void {

        super();

        this.positions = ['top', 'bottom', 'left', 'right'];

        this._topWall = new FlxSprite(0, 0);
        this._topWall.ID = 0;
        this._topWall.makeGraphic(FlxG.width, 5, 0xff85144b);
        this._topWall.immovable = true;

        this._bottomWall = new FlxSprite(0, FlxG.height - 4);
        this._bottomWall.ID = 1;
        this._bottomWall.makeGraphic(FlxG.width, 5, 0xff85144b);
        this._bottomWall.immovable = true;

        this._leftWall = new FlxSprite(0, 0);
        this._leftWall.ID = 2;
        this._leftWall.makeGraphic(5, FlxG.height, 0xff85144b);
        this._leftWall.immovable = true;

        this._rightWall = new FlxSprite(FlxG.width - 4, 0);
        this._rightWall.ID = 3;
        this._rightWall.makeGraphic(5, FlxG.height, 0xff85144b);
        this._rightWall.immovable = true;

        this.add(this._topWall);
        this.add(this._bottomWall);
        this.add(this._leftWall);
        this.add(this._rightWall);

    }

}
