package structs;

import displays.TileBitmap;
import datas.TileData;

class Tile {

    public var tileBitmap:TileBitmap;

    private var _tileData:TileData;

    public var id(get, null):Int;
    public var tileData(get, set):TileData;

    public function new() {
        tileBitmap = new TileBitmap();
    }

    public function set_tileData(tileData:TileData) {
        _tileData = tileData;

        tileBitmap.bitmapData = tileData.bitmapData;

        return _tileData;
    }

    public function get_tileData() {
        return _tileData;
    }

    public function get_id():Int {
        return _tileData.id;
    }

}