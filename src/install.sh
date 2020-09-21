#!/bin/bash
if ! test -e ~/.julia/config
then
  mkdir ~/.julia/config
fi
cp ~/.julia/dev/SimpleWorld/src/startup.jl ~/.julia/config/startup.jl
