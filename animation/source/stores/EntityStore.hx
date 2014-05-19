package stores;

import spritesheet.importers.BitmapImporter;
import spritesheet.data.BehaviorData;
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
        var columns:Int = 2;
        var tileHeight:Int = Math.floor(clothBitmapData.height / yTiles);
        var frameRate:Int = 2;

        cloth.spritesheet = BitmapImporter.create(clothBitmapData, columns, yTiles, GameObject.tileSize, tileHeight);

        cloth.spritesheet.addBehavior(new BehaviorData("idle_down", [0, 1], true, frameRate));
        cloth.spritesheet.addBehavior(new BehaviorData("idle_up", [2, 3], true, frameRate));
        cloth.spritesheet.addBehavior(new BehaviorData("idle_right", [4, 5], true, frameRate));
        cloth.spritesheet.addBehavior(new BehaviorData("idle_left", [6, 7], true, frameRate));

        frameRate = 10;
        cloth.spritesheet.addBehavior(new BehaviorData("move_down", [8, 9], true, frameRate));
        cloth.spritesheet.addBehavior(new BehaviorData("move_up", [10, 11], true, frameRate));
        cloth.spritesheet.addBehavior(new BehaviorData("move_right", [12, 13], true, frameRate));
        cloth.spritesheet.addBehavior(new BehaviorData("move_left", [14, 15], true, frameRate));

        _entityDatas.push(cloth);
    }

    public function getEntityData(id:Int):EntityData {
        return _entityDatas[id];
    }

}
