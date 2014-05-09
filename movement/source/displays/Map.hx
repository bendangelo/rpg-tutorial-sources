package displays;

import flash.display.Bitmap;
import structs.Entity;
import flash.display.Sprite;
import datas.MapData;
import stores.Tilesheet;
import stores.EntityStore;

class Map extends Sprite {

    private var _bottomLayer:TileLayer;
    private var _middleLayer:TileLayer;
    private var _topLayer:TileLayer;
    private var _entityLayer:Sprite;

    public var entityLayer(get, null):Sprite;

    public var tilesheet:Tilesheet;
    public var entityStore:EntityStore;

    public function new(tilesheet:Tilesheet, entityStore:EntityStore){
        super();
        this.tilesheet = tilesheet;
        this.entityStore = entityStore;
    }

    public function load(mapData:MapData) {
        _bottomLayer = new TileLayer(tilesheet);
        _bottomLayer.setMap(mapData.bottomMap);

        _middleLayer = new TileLayer(tilesheet);
        _middleLayer.setMap(mapData.middleMap);

        _topLayer = new TileLayer(tilesheet);
        _topLayer.setMap(mapData.topMap);

        _entityLayer = new Sprite();

        addChild(_bottomLayer);
        addChild(_middleLayer);
        addChild(_entityLayer);
        addChild(_topLayer);
    }

    public function destroy() {

    }

    public function get_entityLayer():Sprite {
        return _entityLayer;
    }

}
