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
  nothing
end

"""
`list_of_favorite_packages()` returns a list of the
packages to be loaded when `SimpleFavorites()` is called.
"""
function list_of_favorite_packages()
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
  return packages
end

"""
`SimpleFavorites(verbose::Bool=true)` will load my favorite
`Simple` packages. The list can be obtained using
`list_of_simnple_packages()`.
"""
function SimpleFavorites(verbose::Bool=true)
  SimplePackageLoader(list_of_favorite_packages(),verbose)
end
