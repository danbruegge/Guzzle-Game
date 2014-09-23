package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;

class Walls extends FlxTypedGroup<FlxSprite> {

    public var positions:Array<String>;

    var _width = FlxG.width;
    var _height = FlxG.height;

    var _color = 0xff85144b;

    var _topWall:FlxSprite;
    var _bottomWall:FlxSprite;
    var _leftWall:FlxSprite;
    var _rightWall:FlxSprite;

    override public function new():Void {

        super();


        this.positions = ['top', 'bottom', 'left', 'right'];

        this._topWall = new FlxSprite(0, 0);
        this._topWall.ID = 0;
        this._topWall.makeGraphic(this._width, 1, this._color);
        this._topWall.immovable = true;

        this._bottomWall = new FlxSprite(0, this._height);
        this._bottomWall.ID = 1;
        this._bottomWall.makeGraphic(this._width, 1, this._color);
        this._bottomWall.immovable = true;

        this._leftWall = new FlxSprite(0, 0);
        this._leftWall.ID = 2;
        this._leftWall.makeGraphic(1, this._height, this._color);
        this._leftWall.immovable = true;

        this._rightWall = new FlxSprite(this._width, 0);
        this._rightWall.ID = 3;
        this._rightWall.makeGraphic(1, this._height, this._color);
        this._rightWall.immovable = true;

        this.add(this._topWall);
        this.add(this._bottomWall);
        this.add(this._leftWall);
        this.add(this._rightWall);

    }
    
}
