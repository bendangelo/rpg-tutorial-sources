package structs;

class GameObject {

    public static var tileSize:Int;
    private static var idCount:Int;

    public var xt(get, set):Int;
    public var yt(get, set):Int;

    public var x(default, set):Float;
    public var y(default, set):Float;

    public var id(default, null):Float;

    public var map:Map;

    public function new(){
        id = ++idCount;
    }

    public function set_x(value:Float):Float {
        x = value;
        xChange(x);
        return x;
    }

    private function xChange(value:Float){

    }

    public function set_y(value:Float):Float {
        y = value;
        yChange(y);
        return y;
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

    public function isOnTile():Bool {
        return x % tileSize == 0 && y % tileSize == 0;
    }

}
