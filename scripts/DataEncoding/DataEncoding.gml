function dec_to_hex(dec)
{
	var len = (argument_count > 1) ? argument[1] : 1,
		hex = "";
     
	if (dec < 0) {
		len = max(len, ceil(logn(16, 2*abs(dec))));
	}
     
	var dig = "0123456789ABCDEF";
	while (len-- || dec) {
		hex = string_char_at(dig, (dec & $F) + 1) + hex;
		dec = dec >> 4;
	}
     
	return hex;

	//other method
	var hex, h, byte, hi, lo;
    if (dec) hex = "" else hex="00";
    h = "0123456789ABCDEF";
    while (dec) {
        byte = dec & 255;
        hi = string_char_at(h, byte div 16 + 1);
        lo = string_char_at(h, byte mod 16 + 1);
        hex = hi + lo + hex;
        dec = dec >> 8;
    }
    return hex;
}

function hex_int(hex) {
	return (byte_hex(hex[0])) * 16 + (byte_hex(hex[1]));
}

function byte_hex(ch) {
	ch = string_char_at(ch, 1)+string_char_at(ch,2)
    var num = 0;
    if(ch >= 0 && ch <= 9){
        num = ch - 0x30;
    }else{
        switch(ch){
            case "A": case "a": num = 10; break;
            case "B": case "b": num = 11; break;
            case "C": case "c": num = 12; break;
            case "D": case "d": num = 13; break;
            case "E": case "e": num = 14; break;
            case "F": case "f": num = 15; break;
            default: num = 0;
        }
    }
    return num;
}

function bytes_to_hex(str)
{
	var hex, h, l, p, byte;

	hex = "";
	h = "0123456789ABCDEF";
	l = string_length(str);
	for (p=1; p<=l; p+=1) {
	    byte = ord(string_copy(str, p, 1));
	    hex += string_copy(h,byte div 16 + 1, 1);
	    hex += string_copy(h,byte mod 16 + 1, 1);
	}
	return hex;
	
}


function hex_to_bytes(hex) {
	var str, h, l, p, hi, lo;
	hex = string_upper(hex);
	str = "";
	h = "0123456789ABCDEF";
	l = string_length(hex);
	if (l mod 2) hex = "0" + hex;
	for (p=1; p<=l; p+=2) {
		hi = string_pos(string_char_at(hex, p) ,h) - 1;
		lo = string_pos(string_char_at(hex, p+1) ,h) - 1;
		str += chr(hi << 4 | lo);
	}
	return str;
}


function hex_to_dec(hex)
{
	var dec = 0;
	var dig = "0123456789ABCDEF";
	var len = string_length(hex);
	for (var pos=1; pos<=len; pos+=1) {
		dec = dec << 4 | (string_pos(string_char_at(hex, pos), dig) - 1);
	}
     
	return dec;
}

function str_to_bin(str)
{
	var output = "";
	for(var i = 0; i < string_length(str); i++){
	    if(string_char_at(str, i + 1) == "0")
	        output += "0";
	    else
	        output += "1";
	}
	return real(output);
}

function dec_to_bin(dec)
{
    var len = (argument_count > 1) ? argument[1] : 1,
        bin = "";
 
    if (dec < 0) {
        len = max(len, ceil(logn(2, 2*abs(dec))));
    }
 
    while (len-- || dec) {
        bin = ((dec & 1) ? "1" : "0") + bin;
        dec = dec >> 1;
    }
 
    return bin;
}

function bin_to_bytes(bin)
{
    var str, p, byte;
    str = "";
    p = string_length(bin);
    repeat (ceil(p / 8)) {
        byte = 0;
        repeat (8) {
            byte = byte >> 1;
            if (p) if (string_char_at(bin, p) == "1") byte = byte | 128;
            p -= 1;
        }
        str = chr(byte) + str;
    }
    return str;
}


function bytes_to_bin(str)
{
    var bin, p, byte;
    bin = "";
    p = string_length(str);
    repeat (p) {
        byte = ord(string_char_at(str,p));
        repeat (8) {
            if (byte & 1) bin = "1" + bin else bin = "0" + bin;
            byte = byte >> 1;
        }
        p -= 1;
    }
    return bin;
}

function bin_to_dec(bin)
{
    var dec = 0;

    var len = string_length(bin);
    for (var pos=1; pos<=len; pos+=1) {
        dec = dec << 1;
        if (string_char_at(bin, pos) == "1") dec |= 1;
    }
 
    return dec;
}

function hex(str)
{
	var result=0,
		ZERO=ord("0"),
		NINE=ord("9"),
		A=ord("A"),
		F=ord("F");

	for (var i=1; i<=string_length(str); i++){
	    var c=ord(string_char_at(string_upper(str), i));
	    result=result<<4;
	    if (c>=ZERO&&c<=NINE){
	        result=result+(c-ZERO);
	    } else if (c>=A&&c<=F){
	        result=result+(c-A+10);
	    } else {
	        //show_error("bad input for hex(str)", true);
	    }
	}
	return result;

}
