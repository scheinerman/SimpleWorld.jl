

"""
`SimplePackageLoader(pkg_name,verbose=false)`:
This is a function form of the `using` command in Julia.
Instead of `using SomePackage` we can instead call
`SimplePackageLoader("SomePackage")`. With `verbose` set to
`true` each `using` command is printed.

This can also be called with a list of package names.
"""
function SimplePackageLoader(pkg_name::String,
        verbose::Bool=false)
  command = "using $pkg_name"
  if verbose
    @info command
  end
  eval(Meta.parse(command))
  nothing
end

function SimplePackageLoader(pkgs,verbose::Bool=false)
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
  "Permutations"
  "SimplePartitions"
  "SimpleGraphs"
  "DrawSimpleGraphs"
# "SimpleGraphRepresentations"
# "SimpleGraphAlgorithms"
  "BigCombinatorics"
  "Polynomials"
  "SimpleGF2"
  "ShowSet"
  "Primes"
  "SimpleRandom"
  "Multisets"
  "Counters"
  ]
  return packages
end

"""
`SimpleFavorites(verbose::Bool=true)` will load my favorite
`Simple` packages. The list can be obtained using
`list_of_favorite_packages()`.
"""
function SimpleFavorites(verbose::Bool=true)
  SimplePackageLoader(list_of_favorite_packages(),verbose)
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
  println(UL * HOR^(n+2) * UR)
  println(VER * SPA * line * SPA * VER)
  println(LL * HOR^(n+2) * LR)
  nothing
end
