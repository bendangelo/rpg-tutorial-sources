package components;

import structs.GameObject;
import structs.Game;
import structs.Map;

class Component {

    public var gameObject:GameObject;

    public var map(get, never):Map;
    public var game(get, never):Game;

    public function new(){

    }

    private function get_map():Map {
        return gameObject.map;
    }

    private function get_game():Game {
        return gameObject.map.game;
    }

}
