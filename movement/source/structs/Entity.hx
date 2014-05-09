package structs;

import flash.display.Bitmap;
import datas.EntityData;
import components.InputComponent;

class Entity extends GameObject {

    public var bitmap:Bitmap;

    private var _entityData:EntityData;

    public var entityData(get, set):EntityData;
    public var game(get, null):Game;

    public var moving:Boolean;

    private var _game:Game;

    private var _input:InputComponent;

    public function new(game:Game, input:InputComponent){
        super();
        bitmap = new Bitmap();
        _input = input;
    }
    
    public function update(){
        _input.update(this);
    }

    public function set_entityData(entityData:EntityData) {
        _entityData = entityData;

        bitmap.bitmapData = entityData.bitmapData;

        return _entityData;
    }

    public function get_entityData():EntityData {
        return _entityData;
    }

    public function get_game():Game {
        return _game;
    }

    override private function yChange(value:Float){
        // position bitmap so it stays on its tile
        bitmap.y = value - bitmap.height + GameObject.tileSize;
    }

    override private function xChange(value:Float){
        bitmap.x = value;
    }

}
