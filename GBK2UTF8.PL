#!/usr/bin/perl

use utf8;
use strict;
use warnings;
use Encode qw(encode decode);

while(<>){
    my $line= decode("gbk",$_);
    print encode("utf8",$line);
}
