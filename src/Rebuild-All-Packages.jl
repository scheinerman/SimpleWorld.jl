# This is for rebuilding packages
using Pkg

my_registered = [
    "BigCombinatorics",
    "ClosedIntervals",
    "Counters",
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
    "DrawSimpleGraphs",   # soon to be registered
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
    println("Adding: ", pkg)
    Pkg.add(pkg)
  end
  nothing
end

function load_julia_favorites()
  for pkg in julia_packages
    println("Adding: ", pkg)
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

function load_my_unregistered()
  for pkg in my_unregistered
    println(pkg)
    try
      load_unreg(pkg)
    catch
      println("Unable to load $pkg")
    end
  end
  nothing
end

function load_all()
  load_julia_favorites()
  load_my_registered()
  load_my_unregistered()
  nothing
end
