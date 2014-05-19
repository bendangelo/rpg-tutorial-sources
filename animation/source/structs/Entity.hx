package structs;

import spritesheet.AnimatedSprite;
import structs.Orientation;
import datas.EntityData;
import components.InputComponent;
import components.GraphicsComponent;
import components.MoveComponent;

class Entity extends GameObject {

    public var sprite(default, null):AnimatedSprite;

    private var _entityData:EntityData;

    public var entityData(default, set):EntityData;

    public var input:InputComponent;
    public var move:MoveComponent;
    public var graphics:GraphicsComponent;

    public function new(input:InputComponent, move:MoveComponent, graphics:GraphicsComponent){
        super();

        sprite = new AnimatedSprite(null);
        this.input = input;
        input.gameObject = this;

        this.move = move;
        move.gameObject = this;

        this.graphics = graphics;
        graphics.gameObject = this;
        graphics.sprite = sprite;
    }

    override public function update(time:Int){
        input.update();
        move.update();
        graphics.update(time);
    }

    public function set_entityData(entityData:EntityData) {
        _entityData = entityData;

        sprite.spritesheet = entityData.spritesheet;

        return _entityData;
    }

    override private function yChange(value:Float){
        // position bitmap so it stays on its tile
        sprite.y = value - sprite.height + GameObject.tileSize;
    }

    override private function xChange(value:Float){
        sprite.x = value;
    }

}
