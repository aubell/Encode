#!/usr/bin/perl
use strict;
use warnings;
use Encode;

sub UTF8ToEntity{
    my $re="";
    my $str = shift;
    $str = decode("UTF8",$str);
    my @array = unpack("U*",$str);
    foreach my $v(@array){
	if($v>255){
	    $re.= "&#X";
	    $re.= sprintf("%X",$v);
	    $re.=";";	    
	}
	else{
	    $re.=chr($v);
	}
    }
    return $re;
}

while(<>){
    print UTF8ToEntity($_);
}

