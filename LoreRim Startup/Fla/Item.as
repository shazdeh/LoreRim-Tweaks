class Item extends MovieClip {

    public var Title_tf:TextField;
    public var Desc_tf:TextField;
    public var Bullet_mc:MovieClip;

    private var margin:Number = 5;

    function SetIndex(n:Number) {
        Desc_tf.verticalAutoSize = 'top';
        Title_tf.SetText('$RIMSTART_T' + n);
        Desc_tf.SetText('$RIMSTART_D' + n);
    }

    function SetActive(is:Boolean) {
        Desc_tf._visible = is;
        Desc_tf._y = Title_tf._y + (is ? Title_tf._height + margin : 0);
        Bullet_mc._alpha = is ? 100 : 50;
        Title_tf._alpha = is ? 100 : 50;
    }
}