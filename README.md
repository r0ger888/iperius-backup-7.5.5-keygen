Yep, just concatenate the computer code string with the bytes you have extracted from the app (mainly from the algo itself), 
calculate the total length of these two strings, compute the SHA-1 hash on it, encode the digest to hexadecimal chars with 32 chars (since the length of serial is 40 chars), 
then build the final serial with lstrcpyn & lstrcat.
:)
