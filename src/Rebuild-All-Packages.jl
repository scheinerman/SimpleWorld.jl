# This is for rebuilding packages
using Pkg

my_registered = [
    "AbstractLattices"
    "BigCombinatorics"
    "Bijections"
    "ClosedIntervals"
    "Counters"
    "Clines"
    "HyperbolicPlane"
    "LatexPrint"
    "LinearFractionalTransformations"
    "Mods"
    "Multisets"
    "Permutations"
    "RiemannComplexNumbers"
    "ShowSet"
    "SimpleDrawing"
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
    "DiscreteFunctions"
    "LatinSquares"
    "SimpleGraphAlgorithms"
    "SimplePosetAlgorithms"
    "SimplePolynomials"
    "LinearAlgebraX"
    "SimpleQuaternions"
    "RingLists"
    "SimplePadics"
    "Spirograph"
    "PlayingCards52"
    "ImplicitGraphs"
]

my_unregistered = [
    "Triangle"
    "SimplePlanarGraphs"
    "SimpleWorld"
    "IntPrint"
    "War"
    "SimpleGF2"
    "SimpleGraphRepresentations"
    "SimplePosetRepresentations"
]

other_packages = [
    "SimplePosetDrawings"
    "SemiIsomorphism"
    "BalancedIncompleteBlockDesigns"
    "HyperbolicDrawSimpleGraphs"
    "FreeCell"
    "Factorions"
    "Diodes"
    "HalfSine"
]


julia_packages = [
    "Cbc"
    "Crayons"
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
    "Nemo"
    "PkgTemplates"
    "Documenter"
    "BenchmarkTools"
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
    my_dev(pkg)
    try
        Pkg.free(pkg)
        @info "$pkg freed"
    catch
        @warn "Unable to add/free $pkg"
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
