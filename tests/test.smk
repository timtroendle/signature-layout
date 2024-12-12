PANDOC = "pandoc --filter pantable --filter pandoc-crossref --citeproc -f markdown+mark"


rule test:
    message: "Build the test article."
    input:
        "build/article.html",
        "build/article.pdf"


def pandoc_options(wildcards):
    suffix = wildcards["suffix"]
    if suffix == "html":
        return "--embed-resources --standalone --to html5"
    elif suffix == "pdf":
        return "--pdf-engine weasyprint"
    elif suffix == "docx":
        return []
    else:
        raise ValueError(f"Cannot create article with suffix {suffix}.")


rule article:
    message: "Compile article.{wildcards.suffix}."
    input:
        "tests/literature.yaml",
        "tests/article.md",
        "tests/apa.csl",
        "layout/reset.css",
        "layout/article.css",
        "layout/fonts/KlinicSlabBook.otf",
        "layout/fonts/KlinicSlabBookIt.otf",
        "layout/fonts/KlinicSlabMedium.otf",
        "layout/fonts/KlinicSlabMediumIt.otf"
    params: options = pandoc_options
    output: "build/article.{suffix}"
    wildcard_constraints:
        suffix = "((html)|(pdf)|(docx))"
    shadow: "minimal"
    shell:
        """
        cd tests
        {PANDOC} article.md {params.options} -o ../build/article.{wildcards.suffix}
        """


rule clean:
    shell:
        """
        rm -r ./build/*
        """
