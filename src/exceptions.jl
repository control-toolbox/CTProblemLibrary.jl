#
abstract type CTTestProbemsException <: Exception end

# not implemented
struct MethodNotImplemented <: CTTestProbemsException
    method::String
    example::Description
end

function Base.showerror(io::IO, e::MethodNotImplemented) 
    print(io, "the method ", e.method, " is not implemented for example ", e.example)
end