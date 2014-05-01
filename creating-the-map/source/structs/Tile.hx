package structs;

import flash.display.Bitmap;
import datas.TileData;

class Tile {

    public var bitmap:Bitmap;

    private var _tileData:TileData;

    public function new() {
        bitmap = new Bitmap();
    }

    public function set_tileData(tileData:TileData) {
        _tileData = tileData;

        bitmap.bitmapData = tileData.bitmapData;
    }

    public function get_tileData():TileData {
        return _tileData;
    }

    public function get_id():Int {
        return _tileData.id;
    }

}