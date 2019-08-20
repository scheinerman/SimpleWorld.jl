# This is for rebuilding packages
using Pkg

my_registered = [
    "AbstractLattices",
    "BigCombinatorics",
    "ClosedIntervals",
    "Counters",
    "DrawSimpleGraphs",
    "FlexLinearAlgebra",
    "HyperbolicPlane",
    "LatinSquares",
    "LinearFractionalTransformations",
    "Mods",
    "Multisets",
    "Permutations",
    "RiemannComplexNumbers",
    "ShowSet",
    "SimpleDrawing",
    "SimpleGF2",
    "SimpleGraphs",
    "SimpleGraphAlgorithms",
    "SimplePosets",
    "SimplePosetAlgorithms",
    "SimplePartitions",
    "SimpleRandom",
    "SimpleTools",
    "SimpleTropical"
]

my_unregistered=[
    "BalancedIncompleteBlockDesigns",
    "Bijections",
    "DiscreteFunctions",
    "Diodes",
    "IntPrint",
    "HalfSine",
    "HyperbolicDrawSimpleGraphs",
    "LatexPrint",
    "SetOps",
    "SimpleGraphRepresentations",
    "SimplePosetDrawings",
    "SimplePosetRepresentations",
    "SimpleWorld",
    "Sudoku"
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
    "ProgressMeter",
    "Plots",
    "GR",
    "LaTeXStrings",
    "Polynomials",
    "Primes",
    "IJulia",
    "Gurobi"
]

function load_my_registered()
  for pkg in my_registered
    @info "Adding scheinerman registered: $pkg"
    #Pkg.add(pkg)
    Pkg.develop(pkg)
  end
  nothing
end

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





function load_unreg(pkg_name::String)
  pre = "https://github.com/scheinerman/"
  post = ".jl.git"
  full_name = pre*pkg_name*post
  Pkg.develop(PackageSpec(url=full_name))
  nothing
end

function load_my_unregistered()
  for pkg in my_unregistered
    @info "Loading $pkg into development"
    try
      load_unreg(pkg)
    catch
      @warn "FAILED to load $pkg"
    end
  end
  nothing
end

"""
`load_all()`: This is the master command to including into
the `.julia` directory all the functions I like to use.
"""
function load_all()
  load_julia_favorites()
  load_my_registered()
  load_my_unregistered()
  nothing
end
