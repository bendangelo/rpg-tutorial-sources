package components;

import structs.GameObject;
import structs.Game;
import structs.Map;

class Component {

    public var gameObject:GameObject;

    public function new(){

    }

    private function map():Map {
        return gameObject.map;
    }

    private function game():Game {
        return gameObject.map.game;
    }

}
