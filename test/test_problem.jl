#
prob = Problem(:integrator, :dim2)

@test prob isa CTProblemLibrary.OptimalControlProblem