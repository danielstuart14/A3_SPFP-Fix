/*
    File: fn_stringCompare.sqf (Part of SPFP-Fix library)
    Author: Daniel Stuart

    Description:
    Using integers we can only go up to 7 digits without loosing precision.
    This script compares two strings.

    TODO:
    Support negative numbers: Ex: "-1","-2" (Not major for AltisLife currency)

    Parameter(s):
        0: STRING - Should only contain numbers
        1: STRING - Should only contain numbers

    Ex:
        ["1","2"] will return "<" (Less-than)
        ["1","1"] will return "=" (Equal)
        ["2","1"] will return ">" (Greater-than)

    Returns:
    STRING
*/
private "_return";
params [
    ["_value1","1",[""]],
    ["_value2","1",[""]]
];
_return = "";

if (_value1 isEqualTo _value2) then {
    _return = "=";
} else {
    if (!(count(_value1) isEqualTo count(_value2))) then {
        if (count(_value1) > count(_value2)) then {
            _return = ">";
        } else {
            _return = "<";
        };
    } else {
        _value1 = [_value1] call life_fnc_stringArray;
        _value2 = [_value2] call life_fnc_stringArray;

        _return = "<";
        for "_i" from 0 to (count(_value1) - 1) step 1 do {
            if ((_value1 select _i) > (_value2 select _i)) exitWith {
                _return = ">";
            };
        };
    };
};

_return;
