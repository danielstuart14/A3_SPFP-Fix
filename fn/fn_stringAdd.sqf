/*
    File: fn_stringAdd.sqf (Part of SPFP-Fix library)
    Author: Daniel Stuart

    Description:
    Using integers we can only go up to 7 digits without loosing precision.
    This script does SUM with two strings.

    TODO:
    Support negative numbers: Ex: "-1" + "-1" (Not major for AltisLife currency)

    Parameter(s):
        0: STRING - Should only contain numbers
        1: STRING - Should only contain numbers

    Ex:
        ["1","1"] will return "2"

    Returns:
    STRING
*/
private ["_count1","_count2","_tmp","_return"];
params [
    ["_value1","1",[""]],
    ["_value2","1",[""]]
];

_value1 = [_value1] call life_fnc_stringArray;
reverse _value1;
_count1 = count(_value1);
_value2 = [_value2] call life_fnc_stringArray;
reverse _value2;
_count2 = count(_value2);

_tmp = 0;
_return = [];
for "_i" from 0 to (if (_count1 >= _count2) then {_count1} else {_count2}) step 1 do {
    if (_count1 > _i) then {
        if (_count2 > _i) then {
            _tmp = _tmp + (_value1 select _i) + (_value2 select _i);
        } else {
            _tmp = _tmp + (_value1 select _i);
        };
    } else {
        if (_count2 > _i) then {
            _tmp = _tmp + (_value2 select _i);
        };
    };

    if (_tmp > 9) then {
        _return pushBack (_tmp - 10);
        _tmp = 1;
    } else {
        if (!(_count1 <= _i && {_count2 <= _i} && {_tmp isEqualTo 0})) then {
            _return pushBack _tmp;
            _tmp = 0;
        };
    };
};

reverse _return;
_return = [_return] call life_fnc_stringArray;
_return;
