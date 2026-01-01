import skse;
import Shared.GlobalFunc;

class RequiemLiteMenu extends MovieClip {

    public static var instance;

    public var Menu_mc:MovieClip;
    public var SystemPage_mc:MovieClip;
    public var SettingsList:MovieClip;
    public var OptionsListsPanel:MovieClip;
    public var Desc_tf:TextField;

    private var optionIndex:Number;
    private var options:Array;
    private var value:Number;

    function RequiemLiteMenu() {
        RequiemLiteMenu.instance = this;
    }

    function onLoad() {
        _visible = false;
        Shared.GlobalFunc.MaintainTextFormat();
        Menu_mc = _parent._parent.QuestJournalFader.Menu_mc;
        SystemPage_mc = Menu_mc.SystemFader.Page_mc;
        SettingsList = SystemPage_mc.SettingsList; /* SettingsCategoryList (BSScrollingList) */
        OptionsListsPanel = SystemPage_mc.OptionsListsPanel;
        var config:Array = _parent._name.split('_');
        setValue(parseInt(config[1]));

        setOptions();
        addEntry();
        SettingsList.addEventListener("itemPress", this, "onSettingsCategoryPress");

        // tabbing out of Accessibility section
        SystemPage_mc.REQLite_onCancelPress = SystemPage_mc.onCancelPress;
        SystemPage_mc.onCancelPress = onCancelPress;

        // handle switch to different tab while Accessibility menu is open
        Menu_mc.TabButtonGroup.addEventListener("itemClick", this, "onTabClick");
    }

    function get OptionsLists_mc() : MovieClip {
        return OptionsListsPanel.OptionsLists.List_mc;
    }

    function setOptions() {
        options = [
            {text: "$RLITE_OPTION_1", movieType: 2, value: value, ID : 'rlite_option_1'}
        ];
    }

    function addEntry() {
        optionIndex = SettingsList.iMaxItemsShown;
        var item = SettingsList.Entry0.duplicateMovieClip('Entry' + optionIndex, SettingsList.getNextHighestDepth());
        item.clipIndex = optionIndex;

        item.onRollOver = function () {
            if (!_parent.listAnimating && !_parent.bDisableInput) {
                _parent.doSetSelectedIndex(this.clipIndex, 0);
                _parent.bMouseDrivenNav = true;
            }
        };
        item.onPress = function (aiMouseIndex, aiKeyboardOrMouse) {
            _parent.onItemPress(aiKeyboardOrMouse);
            if (!_parent.bDisableInput && _parent.onMousePress != undefined)
                _parent.onMousePress();
        };
        item.onPressAux = function (aiMouseIndex, aiKeyboardOrMouse, aiButtonIndex) {
            _parent.onItemPressAux(aiKeyboardOrMouse, aiButtonIndex);
        }

        SettingsList.entryList.push( { text : '$RLITE_MENU' } );
        SettingsList.border._height += item._height;
        SettingsList.iMaxItemsShown += 1;
        SettingsList.InvalidateData();
    }

    function onSettingsCategoryPress(): Void {
		if ( SettingsList.selectedIndex === optionIndex ) {
            loadFile();
            reposition();
            _visible = true;
            OptionsLists_mc.entryList = options;
            OptionsLists_mc.InvalidateData();
            prepareUI();
        } else {
            _visible = false;
        }
    }

    /* runs after our options are injected into OptionsLists_mc */
    function prepareUI() {
        var mc = OptionsLists_mc.GetClipByIndex(0);
        mc.movieType = options[0].movieType;
        /* prevent the game from saving our custom options */
        mc.REQLite_DoOptionChange = mc.DoOptionChange;
        mc.DoOptionChange = function() {}
    }

    /* runs after we exit out of our options, restore UI behavior */
    function restoreUI() {
        var mc = OptionsLists_mc.GetClipByIndex(0);
        mc.DoOptionChange = mc.REQLite_DoOptionChange;
    }

    function onCancelPress() : Boolean {
        this = RequiemLiteMenu.instance;
        if ( _visible ) {
            _visible = false;
            updateOptions();
            restoreUI();
        }
        return SystemPage_mc.REQLite_onCancelPress();
    }

    function updateOptions() {
        value = parseInt(OptionsLists_mc.GetClipByIndex(0).value);
        skse.SendModEvent('RequiemLite_UpdateOptions', value.toString());
    }

    function onTabClick(event: Object): Void {
		if (Menu_mc.bTabsDisabled) {
			return;
		}

		if ( event.item == Menu_mc.SystemTab && SettingsList.selectedIndex === optionIndex ) {
			// return to the Settings sublist menu
            onCancelPress();
        } else {
            _visible = false;
        }
    }

    function loadFile() {
        var loader:LoadVars = new LoadVars();
		loader.onData = onConfigLoaded;
		loader.load( 'Req_Lite.txt' );
    }

    function onConfigLoaded(theData:String) {
        this = RequiemLiteMenu.instance;
        if ( theData !== undefined && theData !== '' ) {
            Desc_tf.SetText( theData, true );
        }
    }

    function reposition() {
        var mc = OptionsLists_mc.GetClipByIndex(0);
        var points = { x: mc._x, y: mc._y };
        mc._parent.localToGlobal( points );
        _x = points.x;
        _y = points.y;
    }

    // @api
    function setValue(a_value:Number) {
        value = a_value;
        options[0].value = value;
    }
}