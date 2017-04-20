# A3_SPFP-Fix
SPFP (Single-Precision Floating-Point) Fix for Arma 3 (AltisLife)
</br></br>
&nbsp;&nbsp;Since Arma 3 can't return reliable integers with more than 6 digits, I wrote this SQF library that solves this problem.</br>
&nbsp;&nbsp;I took the idea from [KilzoneKid] (http://killzonekid.com/arma-scripting-tutorials-arithmetic-library/) (The idea is the same, but the process is completely different. One ex: his functions uses toArray|toString, while mine uses parseNumber + str), but instead using his functions (which work very well), I decided to write my own from scratch.</br>
&nbsp;&nbsp;I did it mostly because of the readability. Kilzone's functions are very complex and hard to simplify. Also, it didn't meet the code-style used in Altis Life.</br>
</br>

### How it works:
&nbsp;&nbsp;It uses strings instead integers for decimals, this way we can go up to 9,999,999 digits (Since that's how much elements an array is limited to have) without loosing precision. (Instead the max 6 digits when using integer)</br>
&nbsp;&nbsp;Of course, this method takes more cpu cycles (and so, more time) than using simple integers (It's aprox 10x slower), having that in mind, this should be only used where it's needed (When you might have more than 6 digits and it needs to be precise)</br>
</br>
&nbsp;&nbsp;The problem with strings is when doing arithmetics, you just can't do operations with strings without converting them. So, the process is based in the string being converted to an array (where each element corresponds to one digit), and then, using the provided functions for the operations. After that, the array is converted to a string again and then, the final value is returned.</br>
</br>

### How use it:
- SUM: <b>life_fnc_stringAdd</b>:</br>
&nbsp;&nbsp;```["1","1"] call life_fnc_stringAdd;``` -- RESULT: "2"</br>

- Subtraction: <b>life_fnc_stringSub</b>:</br>
&nbsp;&nbsp;```["1","1"] call life_fnc_stringSub;``` -- RESULT: "0"</br>

- Comparison: <b>life_fnc_stringCompare</b>:</br>
&nbsp;&nbsp;```["1","1"] call life_fnc_stringCompare;``` -- RESULT: "="</br>
&nbsp;&nbsp;```["2","1"] call life_fnc_stringCompare;``` -- RESULT: ">"</br>
&nbsp;&nbsp;```["1","2"] call life_fnc_stringCompare;``` -- RESULT: "<"</br>

### Current issues:
- <b>Any function</b>: Negative number input isn't supported. (Ex: "-1")  (Not a major issue for AltisLife currency)
- <b>life_fnc_stringSub</b>: Negative results aren't supported. (Ex: "1" - "2")  (Not a major issue for AltisLife currency)
