#!/bin/bash
if ! test -e ~/.julia/config
then
  mkdir ~/.julia/config
fi
cp startup.jl ~/.julia/config/startup.jl
