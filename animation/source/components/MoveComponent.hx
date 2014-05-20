package components;

import structs.Orientation;
import structs.GameObject;

class MoveComponent extends Component {

    public var isMoving(default, null):Bool;

    public var direction(default, null):Int;

    public var speed:Int;

    public function new(){
        super();
        isMoving = false;
        direction = Orientation.DOWN;
        speed = Math.floor(GameObject.tileSize / 7);
    }

    override public function update(time:Int){
        if(isMoving){
            switch(direction){
                case Orientation.DOWN:
                    gameObject.y += speed;
                case Orientation.UP:
                    gameObject.y -= speed;
                case Orientation.LEFT:
                    gameObject.x -= speed;
                case Orientation.RIGHT:
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
            direction = Orientation.UP;
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
            direction = Orientation.DOWN;
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
            direction = Orientation.RIGHT;
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
            direction = Orientation.LEFT;
            isMoving = true;
            return true;
        }
        return false;
    }
}
