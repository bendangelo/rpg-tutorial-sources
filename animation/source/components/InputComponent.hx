package components;

import structs.Orientation;
import flash.ui.Keyboard;
import structs.KeyState;

class InputComponent extends Component {

    private var _moveComp:MoveComponent;

    public function new(moveComp:MoveComponent){
        super();
        _moveComp = moveComp;
    }

    public function update(){
        if(KeyState.isDown(Keyboard.RIGHT) && !_moveComp.isMoving){
            _moveComp.moveRight();
            gameObject.orientation = Orientation.RIGHT;
        }

        if(KeyState.isDown(Keyboard.LEFT) && !_moveComp.isMoving){
            _moveComp.moveLeft();
            gameObject.orientation = Orientation.LEFT;
        }

        if(KeyState.isDown(Keyboard.DOWN) && !_moveComp.isMoving){
            _moveComp.moveDown();
            gameObject.orientation = Orientation.DOWN;
        }

        if(KeyState.isDown(Keyboard.UP) && !_moveComp.isMoving){
            _moveComp.moveUp();
            gameObject.orientation = Orientation.UP;
        }
    }
}
