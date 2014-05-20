package structs;

import components.InputComponent;
import components.GraphicsComponent;
import components.MoveComponent;
import structs.Orientation;

class GameObject {

    public static var tileSize:Int;
    private static var idCount:Int;

    public var orientation:Int;

    public var xt(get, set):Int;
    public var yt(get, set):Int;

    public var x(default, set):Float;
    public var y(default, set):Float;

    public var id(default, null):Int;

    public var map:Map;

    public var input(default, set):InputComponent;
    public var move(default, set):MoveComponent;
    public var graphics(default, set):GraphicsComponent;

    public function new(){
        id = ++idCount;
        orientation = Orientation.DOWN;
    }

    public function update(time:Int) {
        if(input != null){
            input.update(time);
        }

        if(move != null){
            move.update(time);
        }

        if(graphics != null){
            graphics.update(time);
        }
    }

    public function set_x(value:Float):Float {
        x = value;
        return x;
    }

    public function set_y(value:Float):Float {
        y = value;
        return y;
    }

    public function set_xt(value:Int) {
        x = value * tileSize;
        return Math.floor(x);
    }

    public function get_xt():Int {
        return Math.floor(x / tileSize);
    }

    public function set_yt(value:Int) {
        y = value * tileSize;
        return Math.floor(y);
    }

    public function get_yt():Int {
        return Math.floor(y / tileSize);
    }

    public function isOnTile():Bool {
        return x % tileSize == 0 && y % tileSize == 0;
    }

    public function set_input(value:InputComponent):InputComponent {
        input = value;
        input.gameObject = this;
        return input;
    }

    public function set_move(value:MoveComponent):MoveComponent {
        move = value;
        move.gameObject = this;
        return move;
    }

    public function set_graphics(value:GraphicsComponent):GraphicsComponent {
        graphics = value;
        graphics.gameObject = this;
        return graphics;
    }
}
