package components;

import structs.Orientation;
import flash.ui.Keyboard;
import structs.KeyState;

class InputComponent extends Component {

    public function new(){
        super();
    }

    override public function update(time:Int){
        if(KeyState.isDown(Keyboard.RIGHT) && !gameObject.move.isMoving){
            gameObject.move.moveRight();
            gameObject.orientation = Orientation.RIGHT;
        }

        if(KeyState.isDown(Keyboard.LEFT) && !gameObject.move.isMoving){
            gameObject.move.moveLeft();
            gameObject.orientation = Orientation.LEFT;
        }

        if(KeyState.isDown(Keyboard.DOWN) && !gameObject.move.isMoving){
            gameObject.move.moveDown();
            gameObject.orientation = Orientation.DOWN;
        }

        if(KeyState.isDown(Keyboard.UP) && !gameObject.move.isMoving){
            gameObject.move.moveUp();
            gameObject.orientation = Orientation.UP;
        }
    }
}
