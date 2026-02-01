publish:
    quarto preview
    quarto publish gh-pages

bonito:
    quarto render tutorials/_BonitoBook.qmd --no-execute --to ipynb  