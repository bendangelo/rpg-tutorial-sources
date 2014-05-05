package structs;

import flash.display.Bitmap;
import datas.EntityData;

class Entity extends GameObject {

    public var bitmap:Bitmap;

    private var _entityData:EntityData;

    public var entityData(get, set):EntityData;

    public function new(){
        super();
        bitmap = new Bitmap();
    }

    public function set_entityData(entityData:EntityData) {
        _entityData = entityData;

        bitmap.bitmapData = entityData.bitmapData;

        return _entityData;
    }

    public function get_entityData(){
        return _entityData;
    }

    override private function yChange(value:Float){
        // position bitmap so it stays on its tile
        bitmap.y = value - bitmap.height + GameObject.tileSize;
    }

    override private function xChange(value:Float){
        bitmap.x = value;
    }

}