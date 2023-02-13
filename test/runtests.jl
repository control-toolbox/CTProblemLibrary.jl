using CTProblemLibrary
using Test

@testset verbose = true showtiming = true "CTProblemLibrary" begin
    for name in (
        "problem", 
        )
        @testset "$name" begin
            include("test_$name.jl")
        end
    end
end