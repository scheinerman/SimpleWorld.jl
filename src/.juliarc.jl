# This is a sample .juliarc.jl file that will automatically define the
# functions defined in SimpleWorld.jl and print out a message when
# Julia starts up.

include(".julia/v0.4/SimpleWorld/src/SimpleWorld.jl")

println("$(Char(9484))" * "$(Char(9472))"^47 * "$(Char(9488))")
println("$(Char(9474))" * " Load favorite packages with SimpleFavorites() " *
  "$(Char(9474))")
println("$(Char(9492))" * "$(Char(9472))"^47 * "$(Char(9496))")

#
# println("+"*"-"^47*"+")
# println("| Load favorite packages with SimpleFavorites() |")
# println("+"*"-"^47*"+")
