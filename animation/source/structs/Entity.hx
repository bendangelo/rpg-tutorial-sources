package structs;

import spritesheet.AnimatedSprite;
import structs.Orientation;
import datas.EntityData;
import components.InputComponent;
import components.GraphicsComponent;
import components.MoveComponent;

class Entity extends GameObject {

    private var _entityData:EntityData;

    public var entityData(default, set):EntityData;

    public function new(input:InputComponent, move:MoveComponent, graphics:GraphicsComponent){
        super();

        this.input = input;
        this.move = move;
        this.graphics = graphics;
    }

    public function set_entityData(entityData:EntityData) {
        _entityData = entityData;

        graphics.sprite.spritesheet = entityData.spritesheet;

        return _entityData;
    }

}
