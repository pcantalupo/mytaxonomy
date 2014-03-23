#!/usr/bin/env perl

my $base="ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/";
my $nucl="gi_taxid_nucl.dmp.gz";
my $prot="gi_taxid_prot.dmp.gz";

my $nuclftp=$base . "/" . $nucl;
my $protftp=$base . "/" . $prot;

print "Getting $nucl\n";
#system ("wget", $nuclftp);
print "Extracting $nucl\n";
#system ("gunzip", "-f", $nucl);

print "Getting $prot\n";
system ("wget", $protftp);
print "Extracting $prot\n";
system ("gunzip", "-f", $prot);

