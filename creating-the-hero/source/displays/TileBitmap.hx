package displays;

import flash.displays.BitmapData;
import flash.displays.PixelSnapping;
import stores.Tilesheet;

class TileBitmap extends Bitmap {

    public var xt(get, set):Int;
    public var yt(get, set):Int;

    public function new(?bitmapData:BitmapData, ?pixelSnapping:PixelSnapping, ?smoothing:Bool){
        super(bitmapData, pixelSnapping, smoothing);
    }

    public function get_xt():Int {
        return x / Tilesheet.TILE_SIZE;
    }

    public function get_yt():Int {
        return y / Tilesheet.TILE_SIZE;
    }
}