package structs;

import events.SimpleEvent;
import stores.Tilesheet;
import stores.EntityStore;
import displays.MapView;
import datas.GameData;
import datas.Portal;
import components.InputComponent;
import components.MoveComponent;

class Game {

    private var _gameData:GameData;

    public var map(default, null):Map;
    public var mapView(default, null):MapView;
    public var hero(default, null):Entity;

    public var entityStore:EntityStore;
    public var tilesheet:Tilesheet;

    public function new(entityStore:EntityStore, tilesheet:Tilesheet){
        this.entityStore = entityStore;
        this.tilesheet = tilesheet;

        map = new Map(this, tilesheet, entityStore);

        mapView = new MapView();
        mapView.init();
    }

    public function load(gameData:GameData){
        _gameData = gameData;

        map.addEventListener(Map.ADD_ENTITY, onAddEntity);
        map.addEventListener(Map.REMOVE_ENTITY, onRemoveEntity);
        map.load(_gameData.startingMap);

        // add tiles to mapView
        map.bottomLayer.forEachTile(addBottomTiles);
        map.middleLayer.forEachTile(addMiddleTiles);
        map.topLayer.forEachTile(addTopTiles);

        // place hero
        var heroPortal:Portal = _gameData.heroPortal;

        var moveComponent:MoveComponent = new MoveComponent();
        hero = new Entity(new InputComponent(moveComponent), moveComponent);
        hero.entityData = entityStore.getEntityData(heroPortal.id);
        hero.xt = heroPortal.xt;
        hero.yt = heroPortal.yt;

        map.addEntity(hero);
    }

    public function update() {
        hero.update();
    }

    public function onAddEntity(e:SimpleEvent<Entity>){
        mapView.entityLayer.addChild(e.data.bitmap);
    }

    public function onRemoveEntity(e:SimpleEvent<Entity>){
        mapView.entityLayer.removeChild(e.data.bitmap);
    }

    public function addBottomTiles(tile:Tile){
        mapView.bottomLayer.addChild(tile.bitmap);
    }

    public function addTopTiles(tile:Tile){
        mapView.topLayer.addChild(tile.bitmap);
    }

    public function addMiddleTiles(tile:Tile){
        mapView.middleLayer.addChild(tile.bitmap);
    }
}
