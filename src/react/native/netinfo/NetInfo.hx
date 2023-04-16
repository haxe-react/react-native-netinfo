package react.native.netinfo;

@:jsRequire('@react-native-community/netinfo', 'default')
extern class NetInfo {
    static function fetch():js.Promise<NetInfoState>;
    static function addEventListener(handler:NetInfoState->Void):Unsubscribe;
    static function useNetInfo():NetInfoState;
}

typedef Unsubscribe = Void->Void;

typedef NetInfoState = {
    type:NetInfoStateType,
    isConnected:Bool,
    isInternetReachable:Bool,
    ?details:NetInfoStateDetails
}
typedef NetInfoStateDetailsOther = {
    isConnectionExpensive:Bool
}
typedef NetInfoStateDetailsCellular = {
    isConnectionExpensive:Bool,
    cellularGeneration:NetInfoCellularGeneration,
    carrier:String
}
typedef NetInfoStateDetailsWifi = {
    isConnectionExpensive:Bool,
    ssid:String,
    strength:Int,
    ipAddress:String,
    subnet:String,
}
abstract NetInfoStateDetails(Dynamic)
    from NetInfoStateDetailsWifi to NetInfoStateDetailsWifi
    from NetInfoStateDetailsOther to NetInfoStateDetailsOther
    from NetInfoStateDetailsCellular to NetInfoStateDetailsCellular
{}
@:enum
abstract NetInfoStateType(String) {
    var None = "none";
    var Unknown = "unknown";
    var Cellular = "cellular";
    var Wifi = "wifi";
#if android
    var Bluetooth = "bluetooth";
    var Ethernet = "ethernet";
    var Wimax = "wimax";
    var Vpn = "vpn";
#end
    var Other = "other"; //
}
@:enum
abstract NetInfoCellularGeneration(String) {
    var Gen2g = "2g";
    var Gen3g = "3g";
    var Gen4g = "4g";
}
