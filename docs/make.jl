# Use
#
#     DOCUMENTER_DEBUG=true julia --color=yes make.jl local [nonstrict] [fixdoctests]
#
# for local builds.

using Documenter
using DocumenterCodeBlocks
using UltraNest

# Doctest setup
DocMeta.setdocmeta!(
    UltraNest,
    :DocTestSetup,
    :(using UltraNest);
    recursive = true
)

makedocs(
    sitename = "UltraNest.jl",
    repo = Documenter.Remotes.GitHub("JuliaBayes", "UltraNest.jl"),
    modules = [UltraNest],
    format = Documenter.HTML(
        prettyurls = !("local" in ARGS),
        canonical = "https://juliabayes.org/UltraNest.jl/stable/",
        edit_link = :commit,
    ),
    pages = [
        "Home" => "index.md",
        "API" => "api.md",
        "LICENSE" => "LICENSE.md"
    ],
    doctest = ("fixdoctests" in ARGS) ? :fix : true,
    linkcheck = !("nonstrict" in ARGS),
    warnonly = ("nonstrict" in ARGS),
    plugins = [CodeBlocks()],
)

deploydocs(
    repo = "github.com/JuliaBayes/UltraNest.jl.git",
    forcepush = true,
    push_preview = true
)
