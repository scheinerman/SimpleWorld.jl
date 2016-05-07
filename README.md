# SimpleWorld

This repository provides the function `SimpleFavorites` that loads
all my favorite graph theory packages.

When Julia starts up, we just have to give the command `SimpleFavorites()`
and we see this:
```julia
julia> SimpleFavorites()
using SimpleGraphs
using SimpleGraphRepresentations
using SimpleGraphDrawings
using SimpleGraphAlgorithms
using ShowSet
WARNING: Method definition show(Base.IO, Base.Set) in module Base at set.jl:16 overwritten in module ShowSet at /home/ers/.julia/v0.4/ShowSet/src/ShowSet.jl:25.
WARNING: Method definition show(Base.IO, Base.IntSet) in module Base at intset.jl:16 overwritten in module ShowSet at /home/ers/.julia/v0.4/ShowSet/src/ShowSet.jl:26.
using PyPlot
```

## Installation

Clone this package from my GitHub repository:
```julia
julia> Pkg.clone("https://github.com/scheinerman/SimpleWorld.jl.git")
```
and add the following line to `~/.juliarc.jl`:
```julia
include(".julia/v0.4/SimpleWorld/src/SimpleWorld.jl")
```
