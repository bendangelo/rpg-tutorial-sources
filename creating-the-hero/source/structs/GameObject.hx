package structs;

class GameObject {

    public static var tileSize:Int;
    private static var idCount:Int;

    public var xt(get, set):Int;
    public var yt(get, set):Int;

    public var x(get, set):Float;
    public var y(get, set):Float;

    public var id(get, null):Float;

    private var _x:Float;
    private var _y:Float;

    private var _id:Int;

    public function new(){
        _id = ++idCount;
    }

    public function get_id():Int {
        return _id;
    }

    public function set_x(value:Float) {
        _x = value;
        xChange(_x);
        return _x;
    }

    private function xChange(value:Float){

    }

    public function get_x():Float {
        return _x;
    }

    public function get_y():Float {
        return _y;
    }

    public function set_y(value:Float) {
        _y = value;
        yChange(_y);
        return _y;
    }

    private function yChange(value:Float){

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

}