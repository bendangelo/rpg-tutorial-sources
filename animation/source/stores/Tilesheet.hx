package stores;

import datas.TileData;
import spritesheet.data.BehaviorData;
import spritesheet.importers.BitmapImporter;
import spritesheet.Spritesheet;
import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.geom.Point;

class Tilesheet {

    public static var TILE_SIZE:Int = 40;

    public var tilesheetData:BitmapData;

    public var spritesheet:Spritesheet;

    private var _tileDatas:Array<TileData>;

    public function new() {

    }

    public function init(tilesheetData:BitmapData){
        _tileDatas = new Array<TileData>();

        var totalXTiles:Int = Math.floor(tilesheetData.width / TILE_SIZE);
        var totalYTiles:Int = Math.floor(tilesheetData.height / TILE_SIZE);

        spritesheet = BitmapImporter.create(tilesheetData, totalXTiles, totalYTiles, TILE_SIZE, TILE_SIZE);
        this.tilesheetData = tilesheetData;

        for(y in 0...totalYTiles){
          for(x in 0...totalXTiles){
            var tileData:TileData = new TileData();
            tileData.id = _tileDatas.length;

            tileData.spritesheet = spritesheet;

            _tileDatas.push(tileData);
          }
        }

        _tileDatas[16].walkable = false;
        _tileDatas[32].walkable = false;
        _tileDatas[64].walkable = false;
        _tileDatas[65].walkable = false;
        _tileDatas[80].walkable = false;

        _tileDatas[52].animated = true;
        _tileDatas[52].walkable = false;
        spritesheet.addBehavior(new BehaviorData("52", [52, 53, 54], true, 5));
    }

    public function getTileData(id:Int):TileData {
        return _tileDatas[id];
    }

}
