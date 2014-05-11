package;

import flash.display.BitmapData;
import flash.events.KeyboardEvent;
import structs.KeyState;
import flash.display.Sprite;
import structs.GameObject;
import stores.Tilesheet;
import stores.EntityStore;
import datas.Portal;
import flash.events.Event;
import datas.MapData;
import structs.Entity;
import openfl.Assets;
import structs.Game;
import datas.GameData;

class Main extends Sprite {

    private var _tilesheet:Tilesheet;
    private var _entityStore:EntityStore;

    private var _gameData:GameData;

    private var heroPortal:Portal;

    private var _game:Game;

	public function new () {
		super ();

        GameObject.tileSize = Tilesheet.TILE_SIZE;

        setupGameData();

        _entityStore = new EntityStore();
        _entityStore.loadEntityDatas();

        var tilesheetData:BitmapData = Assets.getBitmapData("assets/images/tilesheet.png");

        _tilesheet = new Tilesheet();
        _tilesheet.init(tilesheetData);

        _game = new Game(_entityStore, _tilesheet);
        _game.load(_gameData);

        stage.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
        stage.addEventListener(KeyboardEvent.KEY_UP, this.onKeyUp);

        addChild(_game.mapView);
    }

    public function setupGameData(){
        _gameData = new GameData();
        _gameData.heroPortal = new Portal(EntityStore.CLOTH, 2, 2);

        var mapData:MapData = new MapData();

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

        _gameData.startingMap = mapData;
    }

    public function onEnterFrame(e:Event) {
        _game.update();
    }

    public function onKeyUp(e:KeyboardEvent) {
        KeyState.keysDown.set(e.keyCode, false);
    }

    public function onKeyDown(e:KeyboardEvent) {
        KeyState.keysDown.set(e.keyCode, true);
    }
}
