#!/usr/bin/env perl
use strict;
use warnings;
use Bio::LITE::Taxonomy::NCBI::Gi2taxid qw/new_dict/;
use Getopt::Long;

my $force = 0;
GetOptions ("force|f" => \$force) or exit;

print "Version of Gi2taxid module: ", $Bio::LITE::Taxonomy::NCBI::Gi2taxid::VERSION, $/;

my $prot = "gi_taxid_prot.bin";
if ( ! -e $prot || (-e $prot && $force)) {
   print "Making prot.bin...";
   new_dict (in => "gi_taxid_prot.dmp",
            out => "gi_taxid_prot.bin");
   print "done\n";
}

my $nucl = "gi_taxid_nucl.bin";
if ( ! -e $nucl || (-e $nucl && $force)) {
   print "Making nucl.bin...";
   new_dict (in => "gi_taxid_nucl.dmp",
            out => "gi_taxid_nucl.bin");
   print "done\n";
}

