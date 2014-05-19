package structs;

import haxe.ds.IntMap;

class KeyState {

    public static var keysDown:IntMap<Bool> = new IntMap<Bool>();

    public static function isDown(keyCode:UInt):Bool {
        return keysDown.get(keyCode);
    }

}
