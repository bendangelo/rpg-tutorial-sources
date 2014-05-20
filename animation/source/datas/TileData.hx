package datas;

import spritesheet.Spritesheet;
import flash.display.BitmapData;

class TileData {

    public var id:Int;

    public var spritesheet:Spritesheet;

    public var animated:Bool;
    public var walkable:Bool;

    public var bitmapData(get, null):BitmapData;

    public function new(){
        walkable = true;
    }

    public function get_bitmapData():BitmapData {
        return spritesheet.getFrame(id).bitmapData;
    }

}
