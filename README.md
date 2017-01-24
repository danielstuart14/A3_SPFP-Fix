# A3_SPFP-Fix
SPFP (Single Point Precision Floating Fix) for Arma 3 (Optimized for AL)
</br></br>
&nbsp;&nbsp;Since Arma 3 can't return reliable integers after 7 digits, I wrote this SQF library for solving that.</br>
&nbsp;&nbsp;I took the idea from [KilzoneKid] (http://killzonekid.com/arma-scripting-tutorials-arithmetic-library/), but instead using his functions (which work very well), I decided to write my own from scratch.</br>
&nbsp;&nbsp;I did that most because of the readability. Kilzone's functions are very complex and hard to simplify. Also, it didn't meet the code-style used in Altis Life.</br>
</br>

### How it works:
&nbsp;&nbsp;It uses strings instead integers for decimals, this way we can go up to 9,999,999 digits (Since that's how much an array is limited) without loosing precision. (Instead the max 7 digits when using integer)</br>
&nbsp;&nbsp;Of course, this method takes more cpu cycles (and so, time) than using simple integers (It's aprox 10x slower) and so, this should be only used where it's needed (Where you might have more than 7 digits and it can't round numbers)</br>
</br>
&nbsp;&nbsp;The problem is when doing arithmetics, you just can't do that with strings without converting them. So, the process is based in converting strings to arrays (Where each element corresponds to one digit) and then, using the provided functions for the operations. After that, you can convert the array to a string again.</br>
</br>

### How use it:
- SUM: <b>life_fnc_stringAdd</b>:</br>
&nbsp;&nbsp;```["1","1"] call life_fnc_stringAdd;``` -- RESULT: "2"
</br>
- Subtraction: <b>life_fnc_stringSub</b>:</br>
&nbsp;&nbsp;```["1","1"] call life_fnc_stringSub;``` -- RESULT: "0"
</br>
- Comparison: <b>life_fnc_stringCompare</b>:</br>
&nbsp;&nbsp;```["1","1"] call life_fnc_stringCompare;``` -- RESULT: "="
&nbsp;&nbsp;```["2","1"] call life_fnc_stringCompare;``` -- RESULT: ">"
&nbsp;&nbsp;```["1","2"] call life_fnc_stringCompare;``` -- RESULT: "<"
</br>

### Current issues:
- <b>Any function</b>: Negative numbers aren't supported. (Ex: "-1")  (Not a major issue for AltisLife currency)
- <b>life_fnc_stringSub</b>: Negative results aren't supported. (Ex: "1" - "2")  (Not a major issue for AltisLife currency)
