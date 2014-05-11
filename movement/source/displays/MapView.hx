package displays;

import flash.display.Sprite;

class MapView extends Sprite {

    public var bottomLayer(default, null):Sprite;
    public var middleLayer(default, null):Sprite;
    public var topLayer(default, null):Sprite;

    public var entityLayer(default, null):Sprite;

    public function new(){
        super();
    }

    public function init() {
        bottomLayer = new Sprite();
        middleLayer = new Sprite();
        topLayer = new Sprite();
        entityLayer = new Sprite();

        addChild(bottomLayer);
        addChild(middleLayer);
        addChild(entityLayer);
        addChild(topLayer);
    }

    public function destroy() {
        removeChild(bottomLayer);
        removeChild(middleLayer);
        removeChild(entityLayer);
        removeChild(topLayer);

        bottomLayer = null;
        middleLayer = null;
        entityLayer = null;
        topLayer = null;
    }

}
