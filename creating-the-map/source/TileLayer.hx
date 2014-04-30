package;

import openfl.display.Tilesheet;
import flash.display.Sprite;

class TileLayer extends Sprite {

    private var _tilesheet:Tilesheet;

    private var _map:Array<Array<Int>>;

    public function new(tilesheet:Tilesheet){
        super();
        _tilesheet = tilesheet;
    }

    public function setMap(map:Array<Array<Int>>) {
        _map = map;
    }

    public function setTile(x:Int, y:Int, value:Int) {
        _map[y][x] = value;
    }

    public function getTile(x:Int, y:Int):Int {
        return _map[y][x];
    }

    public function draw() {
        graphics.clear();
        // var drawList:Array<Float> = [tileX, tileY, 0,
        //     10, 10, 1];

        // tilesheet.drawTiles(graphics, drawList);
    }

    public function get_tilesheet():Tilesheet {
        return _tilesheet;
    }

}