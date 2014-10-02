package;

import Std;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.util.FlxRandom;

class Enemies extends FlxGroup {

    override public function new() {
    
        super();

        this.addNew();

    }

    public function addNew() {
    
        this.add(new BallEnemy(
            FlxRandom.intRanged(
                Std.int(FlxG.width * 0.1),
                Std.int(FlxG.width * 0.9)
            ),
            FlxRandom.intRanged(
                Std.int(FlxG.height * 0.1),
                Std.int(FlxG.height * 0.9)
            )
        ));
    
    }

}
