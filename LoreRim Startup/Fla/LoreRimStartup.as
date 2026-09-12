import skse;
import Shared.GlobalFunc;

class LoreRimStartup extends MovieClip {

    private var current:Number = 1;
    private var total:Number = 6;

    // layout
    private var itemGap:Number = 10;
    private var marginLeft:Number = 30;
    private var marginTop:Number = 100;

    private var items:Array;

    function onLoad() {
        _visible = false;
        var root_mc = _parent._parent;
        _x = root_mc.TopLeftRefInstance._x + marginLeft;
        _y = root_mc.TopLeftRefInstance._y + marginTop;
        items = new Array();

        for (var i = 0; i < total; i++) {
            var mc = attachMovie('Item', 'item_' + i, getNextHighestDepth());
            mc.SetIndex(i);
            items.push(mc);
        }
    }

    function setCurrent(n:Number) {
        current = n;
        var y = 0;
        for (var i = 0; i < items.length; i++) {
            items[i].SetActive(i === current);
            items[i]._y = y;
            var itemHeight = i === current ? items[i]._height : items[i].Title_tf._height; // this is annoying, invisible items still count towards _height so here I just get the height of Title_tf instead
            y += itemHeight + itemGap;
        }
        _visible = true;
    }

    function done() {
        _parent.removeMovieClip(this);
    }
}