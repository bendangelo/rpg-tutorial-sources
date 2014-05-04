package displays;

import structs.Entity;
import flash.display.Sprite;
import datas.MapData;
import stores.Tilesheet;
import stores.EntityStore;

class Map extends Sprite {

    private var bottomLayer:TileLayer;
    private var middleLayer:TileLayer;
    private var topLayer:TileLayer;

    public function new(tilesheet:Tilesheet, entityStore:EntityStore){
        this.tilesheet = tilesheet;
        this.entityStore = entityStore;
    }

    public function load(mapData:MapData) {
        bottomLayer = new TileLayer(tilesheet);
        bottomLayer.setMap(mapData.bottomMap);

        middleLayer = new TileLayer(tilesheet);
        middleLayer.setMap(mapData.middleMap);

        topLayer = new TileLayer(tilesheet);
        topLayer.setMap(mapData.topMap);

        addChild(bottomLayer);
        addChild(middleLayer);
        addChild(topLayer);
    }

    public function addEntity(entity:Bitmap) {

    }

}