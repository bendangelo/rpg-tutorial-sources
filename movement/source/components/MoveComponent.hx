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

    public function moveUp():Bool {
        if(isMoving){
            throw "Already moving";
        }

        if(map.isWalkable(gameObject.xt, gameObject.yt - 1)){
            direction = Direction.NORTH;
            isMoving = true;
            return true;
        }

        return false;
    }

    public function moveDown():Bool {
        if(isMoving){
            throw "Already moving";
        }

        if(map.isWalkable(gameObject.xt, gameObject.yt + 1)){
            direction = Direction.SOUTH;
            isMoving = true;
            return true;
        }

        return false;
    }

    public function moveRight():Bool {
        if(isMoving){
            throw "Already moving";
        }
        if(map.isWalkable(gameObject.xt + 1, gameObject.yt)){
            direction = Direction.EAST;
            isMoving = true;
            return true;
        }
        return false;
    }

    public function moveLeft():Bool {
        if(isMoving){
            throw "Already moving";
        }
        if(map.isWalkable(gameObject.xt - 1, gameObject.yt)){
            direction = Direction.WEST;
            isMoving = true;
            return true;
        }
        return false;
    }
}
