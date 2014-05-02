package structs;

import flash.display.Bitmap;
import datas.TileData;

class Tile {

    public var bitmap:Bitmap;

    private var _tileData:TileData;

    public var tileData(get, set):TileData;

    public function new() {
        bitmap = new Bitmap();
    }

    public function set_tileData(tileData:TileData) {
        _tileData = tileData;

        bitmap.bitmapData = tileData.bitmapData;

        return _tileData;
    }

    public function get_tileData() {
        return _tileData;
    }

    public function get_id():Int {
        return _tileData.id;
    }

}