package stores;

import datas.TileData;
import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.geom.Point;

class Tilesheet {

    public static var TILE_SIZE:Int = 40;

    public var tilesheetData:BitmapData;

    private var _tileDatas:Array<TileData>;

    public function new() {

    }

    public function init(tilesheetData:BitmapData){
        _tileDatas = new Array<TileData>();
        this.tilesheetData = tilesheetData;

        var totalXTiles:Int = Math.floor(tilesheetData.width / TILE_SIZE);
        var totalYTiles:Int = Math.floor(tilesheetData.height / TILE_SIZE);

        for(y in 0...totalYTiles){
          for(x in 0...totalXTiles){
            var tileData:TileData = new TileData();
            tileData.id = _tileDatas.length;

            tileData.bitmapData = new BitmapData(TILE_SIZE, TILE_SIZE);

            var rect:Rectangle = new Rectangle(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE);
            var point:Point = new Point(0, 0);

            tileData.bitmapData.copyPixels(tilesheetData, rect, point);

            _tileDatas.push(tileData);
          }
        }
    }

    public function getTileData(id:Int):TileData {
        return _tileDatas[id];
    }

}