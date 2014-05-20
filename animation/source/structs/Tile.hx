package structs;

import flash.display.Bitmap;
import datas.TileData;
import spritesheet.AnimatedSprite;

class Tile extends GameObject {

    public var sprite:AnimatedSprite;

    public var walkable:Bool;

    public var needsUpdate(get, null):Bool;

    public var tileData(default, set):TileData;

    public function new() {
        super();
        sprite = new AnimatedSprite(null);
    }

    override public function update(time:Int){
        sprite.update(time);
    }

    public function get_needsUpdate():Bool{
        return tileData.animated;
    }

    public function set_tileData(tileData:TileData) {
        this.tileData = tileData;

        walkable = tileData.walkable;
        sprite.bitmap.bitmapData = tileData.bitmapData;
        sprite.x = x;
        sprite.y = y;

        if(tileData.animated){
            sprite.spritesheet = tileData.spritesheet;
            sprite.showBehavior(Std.string(tileData.id));
        }

        return tileData;
    }

}
