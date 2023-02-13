module CTProblemLibrary

#
using ControlToolboxTools
using OptimalControl
using MacroTools
#
using Plots
import Plots: plot, plot! # import instead of using to overload the plot and plot! functions


# Types
const MyNumber, MyVector, Time, Times, TimesDisc, States, 
    Adjoints, Controls, State, Adjoint, Dimension = OptimalControl.CTBase.types()

#
include("macros.jl")
include("exceptions.jl")
include("solution.jl")
include("problem.jl")
include("plot.jl")
#
include("examples/double_integrator_energy.jl")

# list of examples
examples = ()
examples = add(examples, (:integrator, :dim2, :energy))

Problems() = examples

#
export Problems, Problem
export plot, plot!

end # module CTProblemLibrary
