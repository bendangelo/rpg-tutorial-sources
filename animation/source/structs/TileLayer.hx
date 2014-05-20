package structs;

import stores.Tilesheet;
import structs.Tile;
import datas.TileData;

class TileLayer {

    private var _tilesheet:Tilesheet;

    private var _tiles:Array<Array<Tile>>;

    public var tilesheet(get, never):Tilesheet;

    private var _updateTiles:Array<Tile>;

    public function new(tilesheet:Tilesheet){
        _tilesheet = tilesheet;
    }

    public function setMap(map:Array<Array<Int>>) {
        _tiles = new Array<Array<Tile>>();
        _updateTiles = new Array<Tile>();

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

    public function update(time:Int){
        for(t in _updateTiles){
            t.update(time);
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

        var tile = getTile(x, y);
        tile.tileData = tileData;

        if(tile.needsUpdate){
            addToUpdates(tile);
        } else {
            removeFromUpdates(tile);
        }
    }

    private function addToUpdates(tile:Tile) {
        if(_updateTiles.indexOf(tile) == -1){
            _updateTiles.push(tile);
        }
    }

    private function removeFromUpdates(tile:Tile){
        for(i in 0..._updateTiles.length){
            if(_updateTiles[i] == tile){
                _updateTiles.splice(i, 1);
            }
        }
    }

    public function getTile(x:Int, y:Int):Tile {
        return _tiles[y][x];
    }

    public function get_tilesheet():Tilesheet {
        return _tilesheet;
    }

}
