#
abstract type AbstractCTProblem end

struct OptimalControlProblem{example} <: AbstractCTProblem
    message::String
    model::OptimalControlModel
    solution::OptimalControlSolution
    #OptimalControlProblem{example}(m::String) where {example} = new{example}(m, nothing, nothing)
end

function OptimalControlProblem{example}() where {example}
    throw(MethodNotImplemented("Problem", example))
end

#function get_example_description(ocp::OptimalControlProblem{example}) where example
#    return example
#end

#function OptimalControlProblem{example}(args...; kwargs...) where {example}
#    throw(MethodNotImplemented("problem", example))
#end

function Problem(description...) 
    example = getFullDescription(makeDescription(description...), Problems())
    return OptimalControlProblem{example}()
end