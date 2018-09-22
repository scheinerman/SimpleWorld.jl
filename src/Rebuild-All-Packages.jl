# This is for rebuilding packages
using Pkg

my_registered = [
    "AbstractLattices",
    "BigCombinatorics",
    "ClosedIntervals",
    "Counters",
    "DrawSimpleGraphs",
    "Mods",
    "Multisets",
    "Permutations",
    "RiemannComplexNumbers",
    "ShowSet",
    "SimpleGF2",
    "SimpleGraphs",
    "SimplePartitions",
    "SimpleRandom",
    "SimpleTools",
    "SimpleTropical"
]

my_unregistered=[
    "Bijections",
    "Diodes",
    "IntPrint",
    "LatexPrint",
    "Lifts",
    "SetOps",
    "SimpleGraphAlgorithms",
    "SimpleGraphRepresentations",
    "SimplePosetAlgorithms",
    "SimplePosetDrawings",
    "SimplePosetRepresentations",
    "SimplePosets"
]

my_dev = ["SimpleWorld"]


julia_packages=[
    "LinearAlgebra",
    "Random",
    "Distributions",
    "Combinatorics",
    "DataStructures",
    "Iterators",
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
    @info "Adding: $pkg"
    Pkg.add(pkg)
  end
  nothing
end

function load_julia_favorites()
  for pkg in julia_packages
    @info "Adding: $pkg"
    Pkg.add(pkg)
  end
  nothing
end





function load_unreg(pkg_name::String)
  pre = "https://github.com/scheinerman/"
  post = ".jl.git"
  full_name = pre*pkg_name*post
  Pkg.add(PackageSpec(url=full_name))
  nothing
end

function load_dev(pkg_name::String)
  pre = "https://github.com/scheinerman/"
  post = ".jl.git"
  full_name = pre*pkg_name*post
  Pkg.develop(PackageSpec(url=full_name))
  nothing
end

function load_my_dev()
    for pkg in my_dev
        @info "Loading $pkg for development"
        try
            load_dev(pkg)
        catch
            @info "Unable to load $pkg"
        end
    end
    nothing
end

function load_my_unregistered()
  for pkg in my_unregistered
    @info "Loading $pkg"
    try
      load_unreg(pkg)
    catch
      @info ("Unable to load $pkg")
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
