#!/usr/bin/env perl

# My snow leopard MAC server runs out of memory at >1.1 billion bytes.  How
# can this be when I have 32 GB of memory installed?  Allocating up to 4
# billion bytes works on a Dell Win7 12GB RAM machine.

# perl -v
# This is perl, v5.10.0 built for darwin-thread-multi-2level
# (with 2 registered patches, see perl -V for more detail)

use strict;
use warnings;

my $s;
#print "Trying 1.1 GB...";
#$s = "a" x 1100000000;   # ok
#print "OK\n\n";

print "Trying 1.2 GB...";
#$s = '';
$s = "a" x 1200000000;   # fails
print "..OK\n";




