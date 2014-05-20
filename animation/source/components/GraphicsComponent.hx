package components;

import structs.Orientation;
import structs.GameObject;
import spritesheet.AnimatedSprite;

class GraphicsComponent extends Component {

    public var sprite:AnimatedSprite;

    public function new(){
        super();
        sprite = new AnimatedSprite(null);
    }

    override public function update(time:Int){
        if(gameObject.orientation == Orientation.LEFT){
            if(gameObject.move.isMoving){
                sprite.showBehavior("move_left", false);
            } else {
                sprite.showBehavior("idle_left", false);
            }
        }

        if(gameObject.orientation == Orientation.DOWN){
            if(gameObject.move.isMoving){
                sprite.showBehavior("move_down", false);
            } else {
                sprite.showBehavior("idle_down", false);
            }
        }

        if(gameObject.orientation == Orientation.UP){
            if(gameObject.move.isMoving){
                sprite.showBehavior("move_up", false);
            } else {
                sprite.showBehavior("idle_up", false);
            }
        }

        if(gameObject.orientation == Orientation.RIGHT){
            if(gameObject.move.isMoving){
                sprite.showBehavior("move_right", false);
            } else {
                sprite.showBehavior("idle_right", false);
            }
        }

        sprite.x = gameObject.x;
        sprite.y = gameObject.y - sprite.height + GameObject.tileSize;
        sprite.update(time);
    }
}
