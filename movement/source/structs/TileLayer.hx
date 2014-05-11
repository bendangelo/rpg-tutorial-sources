package structs;

import stores.Tilesheet;
import structs.Tile;
import datas.TileData;

class TileLayer {

    private var _tilesheet:Tilesheet;

    private var _tiles:Array<Array<Tile>>;

    public var tilesheet(get, never):Tilesheet;

    public function new(tilesheet:Tilesheet){
        _tilesheet = tilesheet;
    }

    public function setMap(map:Array<Array<Int>>) {
        _tiles = new Array<Array<Tile>>();

        for(y in 0...map.length){
            _tiles[y] = new Array<Tile>();

            for(x in 0...map[0].length){
                var tile:Tile = new Tile();
                tile.xt = x;
                tile.yt = y;

                _tiles[y][x] = tile;

                setTile(x, y, map[y][x]);
            }
        }
    }

    public function forEachTile(callback:Tile->Void) {
        for(y in 0..._tiles.length){
            for(x in 0..._tiles[0].length){
                callback(getTile(x, y));
            }
        }
    }

    public function setTile(x:Int, y:Int, value:Int) {
        var tileData:TileData = _tilesheet.getTileData(value);

        getTile(x, y).tileData = tileData;
    }

    public function getTile(x:Int, y:Int):Tile {
        return _tiles[y][x];
    }

    public function get_tilesheet():Tilesheet {
        return _tilesheet;
    }

}
