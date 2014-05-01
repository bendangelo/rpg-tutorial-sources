package displays;

import structs.Tilesheet;
import structs.Tile;
import flash.display.Sprite;
import datas.TileData;

class TileLayer extends Sprite {

    private var _tilesheet:Tilesheet;

    private var _tiles:Array<Array<Tile>>;

    public function new(tilesheet:Tilesheet){
        super();
        _tilesheet = tilesheet;
    }

    public function setMap(map:Array<Array<Int>>) {
        _tiles = new Array<Array<Tile>>();

        // create drawlist based on map
        for(y in 0...map.length){
            _tiles[y] = new Array<Tile>();

            for(x in 0...map[0].length){
                var tile:Tile = new Tile();
                tile.bitmap.x = x * Tilesheet.TILE_SIZE;
                tile.bitmap.y = y * Tilesheet.TILE_SIZE;

                _tiles[y][x] = tile;

                setTile(x, y, map[y][x]);
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