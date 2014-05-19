package structs;

import flash.display.Bitmap;
import datas.TileData;

class Tile extends GameObject {

    public var bitmap:Bitmap;

    private var _tileData:TileData;

    public var walkable:Bool;

    public var tileData(get, set):TileData;

    public function new() {
        super();
        bitmap = new Bitmap();
    }

    public function set_tileData(tileData:TileData) {
        _tileData = tileData;

        walkable = tileData.walkable;
        bitmap.bitmapData = tileData.bitmapData;

        return _tileData;
    }

    public function get_tileData() {
        return _tileData;
    }

    override private function yChange(value:Float){
        bitmap.y = value;
    }

    override private function xChange(value:Float){
        bitmap.x = value;
    }

}
