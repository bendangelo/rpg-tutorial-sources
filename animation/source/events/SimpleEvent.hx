package events;

import flash.events.Event;

class SimpleEvent<T> extends Event {

    public var data(default, null):T;

    public function new( label:String, data:T, bubbles:Bool = false, cancelable:Bool = false ) {
        super( label, bubbles, cancelable);
        this.data = data;
    }

}
