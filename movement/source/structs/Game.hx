package structs;

import stores.Tilesheet;
import stores.EntityStore;
import displays.Map;
import datas.GameData;
import datas.Portal;

class Game {
    
    private var _map:Map;
    private var _gameData:GameData;

    private var _hero:Entity;

    public var map(get, null):Map;
    public var hero(get, null):Entity;

    public var entityStore:EntityStore;
    public var tilesheet:Tilesheet;

    public function new(entityStore:EntityStore, tilesheet:Tilesheet){
        this.entityStore = entityStore;
        this.tilesheet = tilesheet;
    }

    public function load(gameData:GameData){
        _gameData = gameData;

        _map = new Map(tilesheet, entityStore);
        _map.load(_gameData.startingMap);

        // place hero
        var heroPortal:Portal = _gameData.heroPortal;
        _hero = new Entity();
        _hero.entityData = entityStore.getEntityData(heroPortal.id);
        _hero.xt = heroPortal.xt;
        _hero.yt = heroPortal.yt;

        _map.entityLayer.addChild(_hero.bitmap);
    }
    
    public function get_map():Map {
        return _map;
    }

    public function get_hero():Entity {
        return _hero;
    }
}
