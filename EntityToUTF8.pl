#!/usr/bin/perl
use strict;
use warnings;
use Encode;

sub EntityToUTF8{
    my $str=shift;
    $str =~ s/&#X([0-9a-fA-F]{4})[;]/pack("U",hex($1))/eg;
    $str = encode("UTF8",$str);
    return $str;    
}

while(<>){
    print EntityToUTF8($_);
}
