# One stop shop to install SimpleWorld in DEVELOPMENT mode. Can be
# run from the command line:
# julia install.jl

using Pkg
LOC = "https://github.com/scheinerman/SimpleWorld.jl.git"
Pkg.develop(PackageSpec(url=LOC))
