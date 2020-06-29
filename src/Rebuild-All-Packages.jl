# This is for rebuilding packages
using Pkg

my_registered = [
    "Permutations",
    "AbstractLattices",
    "BigCombinatorics",
    "HyperbolicPlane",
    "LinearFractionalTransformations",
    "Mods",
    "SimplePartitions",
    "SimpleRandom",
    "SimpleTools",
    "SimplePartitions",
    "SimpleRandom",
    "SimpleTools",
    "SimpleTropical",
    "RiemannComplexNumbers",
    "ShowSet",
    "SimpleDrawing",
    "SimpleGF2",
    "LatexPrint",
    "SimpleLife",
]

my_unregistered = [
    "ClosedIntervals",
    "Counters",
    "DrawSimpleGraphs",
    "FlexLinearAlgebra",
    "ChooseOptimizer",
    "LatinSquares",
    "Multisets",
    "SimpleGraphs",
    "SimpleGraphAlgorithms",
    "SimplePosets",
    "SimplePosetAlgorithms",
    "BalancedIncompleteBlockDesigns",
    "Bijections",
    "DiscreteFunctions",
    "Diodes",
    "IntPrint",
    "HalfSine",
    "HyperbolicDrawSimpleGraphs",
    "SetOps",
    "SimpleGraphRepresentations",
    "SimplePosetDrawings",
    "SimplePosetRepresentations",
    "SimpleWorld",
    "Sudoku",
    "Mazes"
]



julia_packages=[
    "LinearAlgebra",
    "Random",
    "Distributions",
    "Combinatorics",
    "DataStructures",
    "IterTools",
    "JuMP",
    "LightXML",
    "MathProgBase",
    "Memoize",
    "Optim",
    "Cbc",
    "Clp",
    "GLPK",
    "FFTW",
    "ProgressMeter",
    "Plots",
    "GR",
    "PyPlot",
    "LaTeXStrings",
    "Polynomials",
    "Primes",
    "IJulia",
    "Gurobi"
]




#
# function load_my_pkgs()
#   for pkg in my_packages
#     @info "Adding: $pkg"
#     #Pkg.add(pkg)
#     #Pkg.develop(pkg)
#     load_unreg(pkg)
#   end
#   nothing
# end

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
    full_name = pre*pkg_name*post
    try
        Pkg.develop(PackageSpec(url=full_name))
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

function status_report()
    println("Status of my registered packages")
    for pkg in sort(my_registered)
        Pkg.status(pkg)
    end
    println("=================================")
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
