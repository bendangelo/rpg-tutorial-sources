package structs;

import flash.display.Bitmap;
import datas.EntityData;
import components.InputComponent;
import components.MoveComponent;

class Entity extends GameObject {

    public var bitmap:Bitmap;

    private var _entityData:EntityData;

    public var entityData(default, set):EntityData;

    private var _input:InputComponent;
    private var _move:MoveComponent;

    public function new(input:InputComponent, move:MoveComponent){
        super();
        bitmap = new Bitmap();
        _input = input;
        _input.gameObject = this;

        _move = move;
        _move.gameObject = this;
    }

    public function update(){
        _input.update();
        _move.update();
    }

    public function set_entityData(entityData:EntityData) {
        _entityData = entityData;

        bitmap.bitmapData = entityData.bitmapData;

        return _entityData;
    }

    override private function yChange(value:Float){
        // position bitmap so it stays on its tile
        bitmap.y = value - bitmap.height + GameObject.tileSize;
    }

    override private function xChange(value:Float){
        bitmap.x = value;
    }

}
