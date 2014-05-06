package stores;

import datas.EntityData;
import flash.display.BitmapData;
import openfl.Assets;
import flash.geom.Rectangle;
import flash.geom.Point;
import structs.GameObject;

class EntityStore {

    public static var CLOTH:Int = 1;

    private var _entityDatas:Array<EntityData>;

    public function new(){
        _entityDatas = new Array<EntityData>();
    }

    public function loadEntityDatas(){
        _entityDatas.push(new EntityData());

        var cloth:EntityData = new EntityData();
        cloth.name = "Cloth";

        var clothBitmapData = Assets.getBitmapData("assets/images/entities/cloth.png");
        var yTiles:Int = 12;
        var tileHeight:Int = Math.floor(clothBitmapData.height / yTiles);

        var point:Point = new Point(0, 0);
        var rect:Rectangle = new Rectangle(0, 0, GameObject.tileSize, tileHeight);

        cloth.bitmapData = new BitmapData(GameObject.tileSize, tileHeight);
        cloth.bitmapData.copyPixels(clothBitmapData, rect, point);

        _entityDatas.push(cloth);
    }

    public function getEntityData(id:Int):EntityData {
        return _entityDatas[id];
    }

}
