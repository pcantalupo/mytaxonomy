#!/usr/bin/env perl
use strict;
use warnings;

my $base  = "ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/";

my @files = ('gi_taxid_nucl.dmp.gz',
             'gi_taxid_prot.dmp.gz',
             'taxdump.tar.gz',
             'taxcat.tar.gz',
             'accession2taxid/nucl_gb.accession2taxid.gz',
             'accession2taxid/prot.accession2taxid.gz',
             );

                
foreach my $file (@files) {
  my $ftpfile = $base . $file;
  print "Getting $file ($ftpfile)\n";
  system ("wget", $ftpfile);
  
  $file =~ s/\w+\///;   # get the basename
  print "Extracting $file\n";
  if ($file =~ /tar.gz$/) {
    system("tar","xvzf", $file);
  }
  else {
    system ("gunzip", "-f", $file);
  } 
}


