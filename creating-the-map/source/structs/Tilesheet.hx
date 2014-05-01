package structs;

import datas.TileData;
import flash.display.BitmapData;
import flash.geom.Rectangle;

class Tilesheet {

    public static var TILE_SIZE:Int = 40;

    public var tilesheetData:BitmapData;

    private var _tileDatas:Array<TileData>;

    public function new() {

    }

    public function init(tilesheetData:BitmapData){
        _tileDatas = new Array<TileData>();
        this.tilesheetData = tilesheetData;

        var totalYTiles:Int = Math.floor(tilesheetData.height / TILE_SIZE);
        var totalXTiles:Int = Math.floor(tilesheetData.width / TILE_SIZE);

        for(y in 0...totalYTiles){
          for(x in 0...totalXTiles){
            var tileData:TileData = new TileData();

            tileData.bitmapData = new BitmapData(TILE_SIZE, TILE_SIZE);

            var rect:Rectangle = new Rectangle(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE);

            // bitmapData.copyPixels();

            _tileDatas.push(tileData);
          }
        }
    }

    public function getTileData(value:Int):TileData {
        return _tileDatas[value];
    }

}