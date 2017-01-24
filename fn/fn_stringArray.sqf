/*
    File: fn_stringArray.sqf (Part of SPFP-Fix library)
    Author: Daniel Stuart

    Description:
    Using integers we can only go up to 7 digits without loosing precision.
    This script converts strings to arrays or arrays to strings.

    TODO:
    Support negative numbers: Ex: "-1" (Not major for AltisLife currency)

    Parameter(s):
        0: STRING || ARRAY - Will convert one to the other.

    Ex:
        "123456" will return [1,2,3,4,5,6]
        [1,2,3,4,5,6] will return "123456"

    Returns:
    ARRAY || STRING
*/
private "_return";
params [
    ["_value","1",["",[]]]
];

if (_value isEqualType []) then {
    _return = "";
    for "_i" from 0 to ((count _value) - 1) step 1 do {
        _return = _return + str(_value select _i);
    };
} else {
    _return = [];
    for "_i" from 0 to ((count _value) - 1) step 1 do {
        _return pushBack parseNumber(_value select [_i,1]);
    };
};

_return;
