package components;

import structs.Direction;
import structs.GameObject;

class MoveComponent extends Component {

    public var isMoving(default, null):Bool;

    public var direction(default, null):Int;

    public var speed:Int;

    public function new(){
        super();
        isMoving = false;
        direction = Direction.NORTH;
        speed = Math.floor(GameObject.tileSize / 7);
    }

    public function update(){
        if(isMoving){
            switch(direction){
                case Direction.SOUTH:
                    gameObject.y += speed;
                case Direction.NORTH:
                    gameObject.y -= speed;
                case Direction.WEST:
                    gameObject.x -= speed;
                case Direction.EAST:
                    gameObject.x += speed;
            }

            // Stop moving once the entity reached the next tile
            if(gameObject.isOnTile()){
                isMoving = false;
            }
        }
    }

    public function moveUp() {
        if(isMoving){
            throw "Already moving";
        }
        direction = Direction.NORTH;
        isMoving = true;
    }

    public function moveDown() {
        if(isMoving){
            throw "Already moving";
        }
        direction = Direction.SOUTH;
        isMoving = true;
    }

    public function moveRight() {
        if(isMoving){
            throw "Already moving";
        }
        direction = Direction.EAST;
        isMoving = true;
    }

    public function moveLeft() {
        if(isMoving){
            throw "Already moving";
        }
        direction = Direction.WEST;
        isMoving = true;
    }
}
