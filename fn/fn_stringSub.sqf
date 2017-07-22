/*
    File: fn_stringSub.sqf (Part of SPFP-Fix library)
    Author: Daniel Stuart

    Description:
    Using integers we can only go up to 6 digits without loosing precision.
    This script does subtraction with two strings.

    TODO:
    Support negative numbers: Ex: "-1" - "-1" (Not a major issue for AltisLife currency)
    Support negative results. Ex: "1" - "2" (Not a major issue for AltisLife currency)

    Parameter(s):
        0: STRING - Should only contain numbers
        1: STRING - Should only contain numbers

    Ex:
        ["1","1"] will return "0"

    Returns:
    STRING
*/
private ["_count1","_count2","_tmp","_return"];
params [
    ["_value1","1",[""]],
    ["_value2","1",[""]]
];
_value1 = _value1 splitString "";
reverse _value1;
_count1 = count(_value1);
_value2 = _value2 splitString "";
reverse _value2;
_count2 = count(_value2);

_tmp = 0;
_return = [];
for "_i" from 0 to (if (_count1 >= _count2) then {_count1 - 1} else {_count2 - 1}) step 1 do {
    if (_count1 > _i) then {
        if (_count2 > _i) then {
            _tmp = parseNumber(_value1 select _i) - parseNumber(_value2 select _i) - _tmp;
        } else {
            _tmp = parseNumber(_value1 select _i) - _tmp;
        };
    } else {
        if (_count2 > _i) then {
            _tmp = parseNumber(_value2 select _i) - _tmp;
        };
    };

    if (_tmp < 0) then {
        _return pushBack (_tmp + 10);
        _tmp = 1;
    } else {
        if (!((_count1 - 1) isEqualTo _i && {(_count2 - 1) isEqualTo _i} && {_tmp isEqualTo 0} && {((_count1 + _count2) / 2) > 1})) then {
            _return pushBack _tmp;
            _tmp = 0;
        };
    };
};

reverse _return;
//Hack for zeros before number
for "_i" from 0 to (count(_return) - 2) step 1 do {
    if (!((_return select 0) isEqualTo 0)) exitWith {};
    _return deleteAt 0;
};

_return = _return joinString "";
_return;
