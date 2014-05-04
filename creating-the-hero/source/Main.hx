package;

import displays.TileLayer;
import flash.display.BitmapData;
import flash.display.Sprite;
import stores.Tilesheet;
import stores.EntityStore;
import datas.Portal;
import displays.Map;
import openfl.Assets;

class Main extends Sprite {

    private var tilesheet:Tilesheet;
    private var entityStore:EntityStore;

    private var mapData:MapData;

    private var map:Map;

    private var heroPortal:Portal;

    private var heroEntity:Entity;

	public function new () {

		super ();

        setupMaps();

        entityStore = new EntityStore();
        entityStore.loadEntityDatas();

        var tilesheetData:BitmapData = Assets.getBitmapData("assets/images/tilesheet.png");

        tilesheet = new Tilesheet();
        tilesheet.init(tilesheetData);

        map = new Map(tilesheet, entityStore);
        map.load(mapData);

        addChild(map);

        // place hero
        heroEntity = new Entity();
        heroEntity.entityData = entityStore.getEntityData(heroPortal.id);

        map.addEntity(heroEntity.bitmap);
    }

    public function setupMaps(){
        heroPortal = new Portal(1, 2, 2);

        mapData = new MapData();
        mapData.name = "Home";

        mapData.bottomMap = new Array<Array<Int>>();
        mapData.bottomMap[0] = [18, 18, 18, 18, 18, 18, 18, 18];
        mapData.bottomMap[1] = [18, 18, 18, 18, 18, 18, 18, 18];
        mapData.bottomMap[2] = [18, 18, 18, 18, 24, 24, 24, 18];
        mapData.bottomMap[3] = [18, 18, 18, 18, 24, 24, 24, 18];
        mapData.bottomMap[4] = [18, 18, 18, 18, 18, 18, 18, 18];
        mapData.bottomMap[5] = [18, 18, 18, 18, 18, 18, 18, 18];

        mapData.middleMap = new Array<Array<Int>>();
        mapData.middleMap[0] = [0, 67, 0, 0, 0, 51, 0, 0];
        mapData.middleMap[1] = [0, 0, 0, 0, 0, 0, 0, 0];
        mapData.middleMap[2] = [0, 16, 0, 80, 50, 0, 0, 0];
        mapData.middleMap[3] = [0, 0, 67, 0, 0, 66, 0, 0];
        mapData.middleMap[4] = [0, 64, 65, 0, 0, 0, 0, 0];
        mapData.middleMap[5] = [0, 0, 0, 0, 0, 32, 0, 0];

        mapData.topMap = new Array<Array<Int>>();
        mapData.topMap[0] = [0, 0, 0, 0, 0, 0, 0, 0];
        mapData.topMap[1] = [0, 0, 0, 0, 0, 0, 0, 0];
        mapData.topMap[2] = [0, 0, 0, 0, 0, 0, 0, 0];
        mapData.topMap[3] = [0, 48, 49, 0, 0, 0, 0, 0];
        mapData.topMap[4] = [0, 0, 0, 0, 0, 0, 0, 0];
        mapData.topMap[5] = [0, 0, 0, 0, 0, 0, 0, 0];
    }
}