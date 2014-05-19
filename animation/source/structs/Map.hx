package structs;

import datas.MapData;
import stores.Tilesheet;
import events.SimpleEvent;
import stores.EntityStore;
import flash.events.EventDispatcher;

class Map extends EventDispatcher {

    public static var ADD_ENTITY:String = "addEntity";
    public static var REMOVE_ENTITY:String = "removeEntity";

    public var bottomLayer(default, null):TileLayer;
    public var middleLayer(default, null):TileLayer;
    public var topLayer(default, null):TileLayer;

    public var tilesheet:Tilesheet;
    public var entityStore:EntityStore;

    public var game(default, null):Game;
    public var width(default, null):Int;
    public var height(default, null):Int;

    public var entities(default, null):List<Entity>;

    public function new(game:Game, tilesheet:Tilesheet, entityStore:EntityStore){
        super();
        this.game = game;
        this.tilesheet = tilesheet;
        this.entityStore = entityStore;
    }

    public function load(mapData:MapData) {
        entities = new List<Entity>();

        width = mapData.bottomMap[0].length;
        height = mapData.bottomMap.length;

        bottomLayer = new TileLayer(tilesheet);
        bottomLayer.setMap(mapData.bottomMap);

        middleLayer = new TileLayer(tilesheet);
        middleLayer.setMap(mapData.middleMap);

        topLayer = new TileLayer(tilesheet);
        topLayer.setMap(mapData.topMap);
    }

    public function isWithin(xt:Int, yt:Int):Bool {
        return xt >= 0 && yt >= 0 && yt < height && xt < width;
    }

    public function isWalkable(xt:Int, yt:Int):Bool {
        if(!isWithin(xt, yt)){
            return false;
        }
        return bottomLayer.getTile(xt, yt).walkable && middleLayer.getTile(xt, yt).walkable;
    }

    public function addEntity(entity:Entity){
        entity.map = this;
        entities.push(entity);

        dispatchEvent(new SimpleEvent<Entity>(ADD_ENTITY, entity));
    }

    public function removeEntity(entity:Entity):Bool{
        entity.map = null;
        var removed =  entities.remove(entity);

        if(removed){
            dispatchEvent(new SimpleEvent<Entity>(REMOVE_ENTITY, entity));
        }

        return removed;
    }

    public function destroy() {

    }

}
