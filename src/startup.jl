# This is the startup.jl file that should reside in
# ~/.julia/config/startup.jl
# A simple way to install it is to run the ./install.sh script
# in this directory.

"""
`SimplePackageLoader(pkg_name,verbose=false)`:
This is a function form of the `using` command in Julia.
Instead of `using SomePackage` we can instead call
`SimplePackageLoader("SomePackage")`. With `verbose` set to
`true` each `using` command is printed.

This can also be called with a list of package names.
"""
function SimplePackageLoader(pkg_name::String, verbose::Bool = false)
    command = "using $pkg_name"
    if verbose
        @info command
    end
    eval(Meta.parse(command))
    nothing
end

function SimplePackageLoader(pkgs, verbose::Bool = false)
    for p in pkgs
        SimplePackageLoader(p, verbose)
    end
    nothing
end

"""
`list_of_favorites()` returns a list of the
packages to be loaded when `SimpleFavorites()` is called.
"""
function list_of_favorites()
    packages = [
        "Permutations"
        "SimplePartitions"
        "SimpleGraphs"
        "BigCombinatorics"
        "SimpleTools"
        "LinearAlgebra"
        "ShowSet"
        "Primes"
        "SimpleRandom"
    ]
    return packages
end

"""
`list_of_graph_theory()` are the packages to use when focused on 
graph computing.
"""
function list_of_graph_theory()
    packages = [
        "SimpleGraphs"
        "SimplePlanarGraphs"
        "SimpleGraphAlgorithms"
        "SimplePlanarGraphs"
        "DrawSimpleGraphs"
        "Plots"
        "ChooseOptimizer"
        "Gurobi"
        "ShowSet"
    ]
    return packages
end

"""
`SimpleFavorites(verbose::Bool=true)` will load my favorite
`Simple` packages. The list can be obtained using
`list_of_favorite_packages()`.
"""
SimpleFavorites(verbose::Bool = true) =
    SimplePackageLoader(list_of_favorites(), verbose)

"""
`GraphTheory(verbose::Bool=true)` load my packages for working on graphs
and sets the optmizer to be `Gurobi` (non-verbose).
"""
function GraphTheory(verbose::Bool = true)
    SimplePackageLoader(list_of_graph_theory(), verbose)
    eval(Meta.parse("use_Gurobi()"))
end
"""
`box_my_text(line)` prints out a single line of text embedded in a
box consisting of corner and connector characters.

```
julia> box_my_text("Hello")
┌───────┐
│ Hello │
└───────┘
```
"""
function box_my_text(line::String)
    UL = "$(Char(9484))"
    UR = "$(Char(9488))"
    LL = "$(Char(9492))"
    LR = "$(Char(9496))"
    HOR = "$(Char(9472))"
    VER = "$(Char(9474))"
    SPA = " "

    n = length(line)
    println(UL * HOR^(n + 2) * UR)
    println(VER * SPA * line * SPA * VER)
    println(LL * HOR^(n + 2) * LR)
    nothing
end

# box_my_text("Use SimpleFavorites() to load standard packages")
box_my_text("New! Use GraphTheory() to load graph theory packages")