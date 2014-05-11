package components;

import structs.Entity;
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
        }

        if(KeyState.isDown(Keyboard.LEFT) && !_moveComp.isMoving){
            _moveComp.moveLeft();
        }

        if(KeyState.isDown(Keyboard.DOWN) && !_moveComp.isMoving){
            _moveComp.moveDown();
        }

        if(KeyState.isDown(Keyboard.UP) && !_moveComp.isMoving){
            _moveComp.moveUp();
        }
    }
}
