package;

import datas.MapData;
import displays.TileLayer;
import flash.display.BitmapData;
import flash.display.Sprite;
import structs.Tilesheet;
import openfl.Assets;

class Main extends Sprite {

  private var tilesheet:Tilesheet;

  private var mapData:MapData;

  private var bottomLayer:TileLayer;
  private var middleLayer:TileLayer;
  private var topLayer:TileLayer;

	public function new () {

		super ();

    var map:Array<Array<Int>> = new Array<Array<Int>>();
    map[0] = [18, 18, 18, 18, 18, 18];
    map[1] = [18, 18, 18, 18, 18, 18];
    map[2] = [18, 18, 18, 18, 18, 18];
    map[3] = [18, 18, 18, 18, 18, 18];
    map[4] = [18, 18, 18, 18, 18, 18];
    map[5] = [18, 18, 18, 18, 18, 18];

    var tilesheetData:BitmapData = Assets.getBitmapData("assets/images/tilesheet.png");

    tilesheet = new Tilesheet();
    tilesheet.init(tilesheetData);

    loadMap(map);
	}

  private function loadMap(map:Array<Array<Int>>) {
    bottomLayer = new TileLayer(tilesheet);
    bottomLayer.setMap(map);

    addChild(bottomLayer);
  }

}