package displays;

import flash.display.Bitmap;
import structs.Entity;
import flash.display.Sprite;
import datas.MapData;
import stores.Tilesheet;
import stores.EntityStore;

class Map extends Sprite {

    private var bottomLayer:TileLayer;
    private var middleLayer:TileLayer;
    private var topLayer:TileLayer;

    private var bitmaps:Array<Bitmap>;

    public var tilesheet:Tilesheet;
    public var entityStore:EntityStore;

    public function new(tilesheet:Tilesheet, entityStore:EntityStore){
        super();
        this.tilesheet = tilesheet;
        this.entityStore = entityStore;
    }

    public function load(mapData:MapData) {
        bitmaps = new Array<Bitmap>();

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

    public function destroy() {

    }

}