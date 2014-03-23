#!/bin/bash

FTP=ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/

TAX=taxdump.tar.gz
rm -vf $TAX
wget ${FTP}$TAX
tar xvzf $TAX

TAXCAT=taxcat.tar.gz
rm -vf $TAXCAT
wget ${FTP}$TAXCAT
tar xvzf $TAXCAT

