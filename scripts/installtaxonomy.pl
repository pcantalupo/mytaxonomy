#!/usr/bin/env perl
use strict;
use warnings;
use Getopt::Long;

my $base  = "ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/";

my $acc2taxid = 0;
my $force = 0;
my $verbose = 0;
GetOptions("a|accession2taxid" => \$acc2taxid,
           "f|force" => \$force,
           "v|verbose" => \$verbose);

my %files = ('gi_taxid_nucl.dmp.gz' => 'gi_taxid_nucl.dmp',
             'gi_taxid_prot.dmp.gz' => 'gi_taxid_prot.dmp',
             'taxdump.tar.gz' => 'readme.txt',
             'taxcat.tar.gz'=> 'categories.dmp');

if ($acc2taxid) {
  $files{'accession2taxid/nucl_gb.accession2taxid.gz'} = 'nucl_gb.accession2taxid';
  $files{'accession2taxid/prot.accession2taxid.gz'}    = 'prot.accession2taxid';
}

#foreach my $file (keys %files) {
#  print join("\t", $file, $files{$file}), $/;
#}
 
foreach my $file (keys %files) {
  if ($force || !-e $files{$file}) {
    print $files{$file}, " will be downloaded because either it does not exist or force in effect\n" if ($verbose);

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
  else {
    print $files{$file}, " exists, so skipping download\n" if ($verbose);
  }
}
