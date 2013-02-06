<?php
$dayOfMonth = @date( 'j' );
$words = array();

$words[1]  = 'first';
$words[2]  = 'second';
$words[3]  = 'third';
$words[4]  = 'fourth';
$words[5]  = 'fifth';
$words[6]  = 'sixth';
$words[7]  = 'seventh';
$words[8]  = 'eighth';
$words[9]  = 'ninth';
$words[10] = 'tenth';
$words[11] = 'eleventh';
$words[12] = 'twelfth';
$words[13] = 'thirteenth';
$words[14] = 'fourteenth';
$words[15] = 'fifteenth';
$words[16] = 'sixteenth';
$words[17] = 'seventeenth';
$words[18] = 'eighteenth';
$words[19] = 'nineteenth';
$words[20] = 'twentieth';
$words[21] = 'twenty-first';
$words[22] = 'twenty-second';
$words[23] = 'twenty-third';
$words[24] = 'twenty-fourth';
$words[25] = 'twenty-fifth';
$words[26] = 'twenty-sixth';
$words[27] = 'twenty-seventh';
$words[28] = 'twenty-eighth';
$words[29] = 'twenty-ninth';
$words[30] = 'thirtieth';
$words[31] = 'thirty-first';

echo $words[$dayOfMonth];