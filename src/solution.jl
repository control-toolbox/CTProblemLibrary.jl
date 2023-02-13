#
abstract type AbstractCTSolution end

struct OptimalControlSolution <: AbstractCTSolution 
    state_dimension::Dimension
    control_dimension::Dimension
    times::TimesDisc
    state_function::Function
    adjoint_function::Function
    control_function::Function
end