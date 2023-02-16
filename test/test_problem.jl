#
prob = Problem(:integrator, :dim2)
@test prob isa CTProblemLibrary.OptimalControlProblem

#
prob = Problem(:goddard)
@test prob isa CTProblemLibrary.OptimalControlProblem