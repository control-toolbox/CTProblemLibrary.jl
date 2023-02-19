module CTProblemLibrary

#
#using ControlToolboxTools
using CTBase
using MacroTools
#
using Plots
import Plots: plot, plot! # import instead of using to overload the plot and plot! functions

#
include("macros.jl")
include("exceptions.jl")
include("solution.jl")
include("problem.jl")
include("plot.jl")
#
include("examples/double_integrator_energy.jl")
include("examples/goddard.jl")

# list of examples
examples = ()
examples = add(examples, (:integrator, :dim2, :energy))
examples = add(examples, (:goddard, :state_constraint))

Problems() = examples

#
export Problems, Problem
export plot, plot!

end # module CTProblemLibrary
