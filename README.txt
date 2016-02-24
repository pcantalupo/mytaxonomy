I'm trying to make a repo with my taxonomy scripts.

# Download taxonomy

```bash
installtaxonomy.pl &
```

# Make BIN files

## In order to use the gi_taxid.dmp files with Bio::LITE::Taxonomy::NCBI::Gi2taxid
## you need to make BIN files (aka dictionary files) with the following


```bash
qsub -l advres=genomics ~/local/lib/mytaxonomy/bin/makebin.job
```

