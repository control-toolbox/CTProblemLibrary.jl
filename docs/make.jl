using Documenter
using CTProblemLibrary
using Plots

makedocs(
    sitename = "CTProblemLibrary.jl",
    format = Documenter.HTML(prettyurls = false),
    strict = [
        :doctest,
        :linkcheck,
        :parse_error,
        :example_block,
        # Other available options are
        # :autodocs_block, :cross_references, :docs_block, :eval_block, :example_block, :footnote, :meta_block, :missing_docs, :setup_block
    ],
    pages = [
        "Introduction" => "index.md",
        "Examples" => Any["double_integrator_energy.md"],
        "API" => "api.md"
    ]
)

#deploydocs(
#    repo = "CTProblemLibrary.jl.git",
#    devbranch = "main"
#)