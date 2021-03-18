![Article](https://github.com/timtroendle/signature-layout/actions/workflows/article.yaml/badge.svg)

# Signature Layout

The signature layout of my articles.

## Test the layout

You need [conda](https://conda.io/docs/index.html) to test the layout. Using conda, you can create a conda environment from within you can run it:

    conda env create -f tests/environment.yaml

Then you can create HTML and PDF test articles using Snakemake:

    snakemake -s tests/test.smk

## License

The code in this repo is MIT licensed, see `./LICENSE.md`. This excludes the KlinicSlab font family (all files in `./layout/fonts/`) which is copyright Lost Type.
