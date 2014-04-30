package;

import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import openfl.Assets;
import flash.geom.Rectangle;
import openfl.display.Tilesheet;
import flash.events.MouseEvent;

class Main extends Sprite {

  public static var TILE_SIZE:Int = 40;

  private var tileX:Float;
  private var tileY:Float;

  private var tilesheet:Tilesheet;

  private var map:Array<Array<Int>>;

  private var groundLayer:TileLayer;

	public function new () {

		super ();

    map = new Array<Array<Int>>();
    map[0] = [18, 18, 18, 18, 18, 18];
    map[1] = [18, 18, 18, 18, 18, 18];
    map[2] = [18, 18, 18, 18, 18, 18];
    map[3] = [18, 18, 18, 18, 18, 18];
    map[4] = [18, 18, 18, 18, 18, 18];
    map[5] = [18, 18, 18, 18, 18, 18];

    loadTiles();
    loadMap();
	}

  private function loadTiles() {
    var tilesheetData:BitmapData = Assets.getBitmapData("assets/images/tilesheet.png");
    var totalYTiles:Int = Math.floor(tilesheetData.height / TILE_SIZE);
    var totalXTiles:Int = Math.floor(tilesheetData.width / TILE_SIZE);

    tilesheet = new Tilesheet(tilesheetData);

    for(y in 0...totalYTiles){
      for(x in 0...totalXTiles){
        tilesheet.addTileRect(new Rectangle(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE));
      }
    }
  }

  private function loadMap() {
    groundLayer = new TileLayer(tilesheet);

    groundLayer.setMap(map);

    groundLayer.draw();
    addChild(groundLayer);

  }


}