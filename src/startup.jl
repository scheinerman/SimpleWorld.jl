# This is the startup.jl file that should reside in
# ~/.julia/config/startup.jl
# A simple way to install it is to run the ./install.sh script
# in this directory.



"""
    box_my_text(line)

prints out a single line of text embedded in a
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
    println(UL * HOR^(n + 2) * UR)
    println(VER * SPA * line * SPA * VER)
    println(LL * HOR^(n + 2) * LR)
    nothing
end

# When the "east" servers are not updating right, do this:

"""
    change_package_server(server::String = "us-west.pkg.julialang.org")

Sometimes the default package server doesn't get updated, so this is a way to 
specify a different one that seems to be more reliable. 
"""
function change_package_server(server::String = "us-west.pkg.julialang.org")
    Base.ENV["JULIA_PKG_SERVER"] = server
    println("Julia package server set to $server")
    nothing
end



using OhMyREPL

box_my_text("Ready")
