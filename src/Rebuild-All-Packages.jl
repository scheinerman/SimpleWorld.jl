# This is for rebuilding packages
using Pkg

my_registered = [
    "AbstractLattices"
    "BigCombinatorics"
    "ClosedIntervals"
    "Counters"
    "HyperbolicPlane"
    "LatexPrint"
    "LinearFractionalTransformations"
    "Mods"
    "Multisets"
    "Permutations"
    "RiemannComplexNumbers"
    "ShowSet"
    "SimpleDrawing"
    "SimpleGF2"
    "SimpleLife"
    "SimplePartitions"
    "SimpleRandom"
    "SimpleTools"
    "SimpleTropical"
    "TwentyFour"
    "Mazes"
    "DrawSimpleGraphs"
    "ChooseOptimizer"
    "SimpleGraphs"
    "FlexLinearAlgebra"
    "SimplePosets"
    "Sudoku"
]

my_unregistered = [
    "BalancedIncompleteBlockDesigns"
    "Bijections"
    "Diodes"
    "DiscreteFunctions"
    "HalfSine"
    "HyperbolicDrawSimpleGraphs"
    "LatinSquares"
    "SetOps"
    "SimpleGraphAlgorithms"
    "SimpleGraphRepresentations"
    "SimplePosetAlgorithms"
    "SimplePosetDrawings"
    "SimplePosetRepresentations"
    "SimpleWorld"
    "IntPrint"
]


julia_packages = [
    "Cbc"
    "Clp"
    "Combinatorics"
    "DataStructures"
    "Distributions"
    "FFTW"
    "GLPK"
    "GR"
    "Gurobi"
    "IJulia"
    "IterTools"
    "JuMP"
    "JuliaFormatter"
    "LaTeXStrings"
    "LightXML"
    "LinearAlgebra"
    "MathProgBase"
    "Memoize"
    "Optim"
    "Plots"
    "Polynomials"
    "Primes"
    "ProgressMeter"
    "PyPlot"
    "Random"
]




function load_julia_favorites()
    for pkg in julia_packages
        @info "Adding Julia package: $pkg"
        try
            Pkg.add(pkg)
        catch
            @warn "Failed to add $pkg"
        end
    end
    nothing
end



function my_dev(pkg_name::String)
    pre = "https://github.com/scheinerman/"
    post = ".jl.git"
    full_name = pre * pkg_name * post
    try
        Pkg.develop(PackageSpec(url = full_name))
        @info "Added $pkg_name in development mode"
    catch
        @warn "Unable to add $pkg_name in development mode"
    end
    nothing
end

function my_add(pkg::String)
    try
        Pkg.add(pkg)
        @info "Added $pkg"
    catch
        @warn "Unable to add $pkg"
    end
    nothing
end

function load_my_unregistered()
    for pkg in sort(my_unregistered)
        my_dev(pkg)
    end
    nothing
end

function load_my_registered()
    for pkg in sort(my_registered)
        my_add(pkg)
    end
    nothing
end

"""
`status_report()` is a version of `Pkg.status()`
organized for my stuff.
"""
function status_report()
    println("Status of my registered packages")
    for pkg in sort(my_registered)
        Pkg.status(pkg)
    end
    println("================================="^2)
    println("Status of my development packages")
    for pkg in sort(my_unregistered)
        Pkg.status(pkg)
    end
    nothing
end

"""
`load_all()`: This is the master command to including into
the `.julia` directory all the packages I like to use.
"""
function load_all()
    load_julia_favorites()
    load_my_registered()
    load_my_unregistered()
    nothing
end
