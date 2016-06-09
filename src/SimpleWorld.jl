"""
`SimplePackageLoader(pkg_name,verbose=false)`:
This is a function form of the `using` command in Julia.
Instead of `using SomePackage` we can instead call
`SimplePackageLoader("SomePackage")`. With `verbose` set to
`true` each `using` command is printed.

This can also be called with a list of package names.
"""
function SimplePackageLoader(pkg_name::ASCIIString,
        verbose::Bool=false)
  command = "using $pkg_name"
  if verbose
    println(command)
  end
  eval(parse(command))
  nothing
end

function SimplePackageLoader(pkgs::Array{ASCIIString,1},
  verbose::Bool=false)
  for p in pkgs
    SimplePackageLoader(p,verbose)
  end
end

"""
`SimpleFavorites(verbose::Bool=true)` will load my favorite
`Simple` graph theory packages, namely:

* `SimpleGraphs`
* `SimpleGraphAlgorithms`
* `SimpleGraphDrawings`
* `SimpleGraphRepresentations`

as well as `ShowSet` and `PyPlot`.
"""
function SimpleFavorites(verbose::Bool=true)
  packages = [
  "SimpleGraphs"
  "SimpleGraphRepresentations"
  "SimpleGraphDrawings"
  "SimpleGraphAlgorithms"
  "SimpleGF2"
  "SimplePosets"
  "SimplePosetAlgorithms"
  "ShowSet"
  "PyPlot"
  ]
  SimplePackageLoader(packages,verbose)
end
