# This is for rebuilding packages
my_packages = [
"SimpleWorld",
"SimpleTools",
"SimpleGraphs",
"SimpleGraphAlgorithms",
"SimpleGraphDrawings",
"SimpleGraphRepresentations",
"SimplePosets",
"SimplePosetAlgorithms",
"SimplePosetRepresentations",
"SimplePosetDrawings",
"SimpleCombinatorics",
"SimpleGF2",
"SimplePartitions",
"SimpleRandom",
"SimpleTropical",
"RiemannComplexNumbers",
"Bijections",
"ClosedIntervals",
"LatexPrint",
"ShowSet",
"Mods",
"Lifts"
]

julia_packages=[
"Graphs",
"DataStructures",
"GraphLayout",
"Iterators",
"JuMP",
"LightXML",
"MathProgBase",
"Memoize",
"Optim",
"GLPK",
"GLPKMathProgInterface",
"ProgressMeter",
"PyPlot",
"PyCall",
"LaTeXStrings",
"Plots",
"Polynomials",
"Homebrew",
"Permutations",
"IJulia"
]

function load_julia_pkgs()
  for pkg in julia_packages
    println("Adding: ", pkg)
    Pkg.add(pkg)
  end
  nothing
end


function load_mine(pkg_name::String)
  pre = "https://github.com/scheinerman/"
  post = ".jl.git"
  Pkg.clone(pre*pkg_name*post)
  nothing
end

function load_my_pkgs()
  for pkg in my_packages
    println(pkg)
    try
      load_mine(pkg)
    end
  end
  nothing
end

function load_all()
  load_julia_pkgs()
  load_my_pkgs()
  nothing
end
