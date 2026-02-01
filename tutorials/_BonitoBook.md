# Julia native Notebook

Here we demonstrate how to use BonitoBook on Google Colab.

First, download the corresponding qmd file.

```{julia}
;wget "https://raw.githubusercontent.com/JuliaSpacePhysics/juliaspacephysics.github.io/refs/heads/main/tutorials/demo_interactive.qmd" -P .
```

Then we install BonitoBook and run the book. This will start a server that hosts the notebook.

```{julia}
using Pkg
Pkg.add(url="https://github.com/SimonDanisch/BonitoBook.jl/")
using BonitoBook
using BonitoBook.Bonito
server = BonitoBook.book("demo_interactive.qmd"; openbrowser=false, url="0.0.0.0", proxy_url=".")

HTML("""
<div id="js-output"></div>
<script>(async (port, element) => {
    var outputDiv = document.getElementById('js-output');
    const url = await google.colab.kernel.proxyPort(port);
    const anchor = document.createElement('a');
    anchor.href = new URL('/demo_interactive', url).toString();
    anchor.target = '_blank';
    anchor.setAttribute('data-href', url + '/');
    anchor.textContent = 'https://localhost:' + port + "/demo_interactive";
    outputDiv.appendChild(anchor);
}) ($(server.port), window.element)
</script>""")
```