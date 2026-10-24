# Bonito (WGLMakie's server) detects code-server's proxy via VSCODE_PROXY_URI but not Codespaces;
# without this, figure pages reference http://localhost:9384, unreachable from the user's browser.
if haskey(ENV, "CODESPACE_NAME") && !haskey(ENV, "VSCODE_PROXY_URI")
    ENV["VSCODE_PROXY_URI"] = "https://$(ENV["CODESPACE_NAME"])-{{port}}.$(ENV["GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN"])/"
end
