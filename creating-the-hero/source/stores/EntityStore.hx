package stores;

import datas.EntityData;
import openfl.Assets;

class EntityStore {

    private var _entityDatas:Array<EntityData>;

    public function new(){
        _entityDatas = new Array<EntityData>();
    }

    public function loadEntityDatas(){
        _entityDatas.push(new EntityData());

        var cloth:EntityData = new EntityData();
        cloth.name = "Cloth";

        _entityDatas.push(cloth);
    }

    public function getEntityData(value:Int):EntityData {
        return _entityDatas[value];
    }

}