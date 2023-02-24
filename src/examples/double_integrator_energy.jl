EXAMPLE=(:integrator, :dim2, :energy)

@eval function OptimalControlProblem{EXAMPLE}()
    # should return an OptimalControlProblem{example} with a message, a model and a solution

    # 
    msg = "Double integrator - energy min"

    # the model
    n=2
    m=1
    t0=0.0
    tf=1.0
    x0=[-1.0, 0.0]
    xf=[0.0, 0.0]
    ocp = Model{:autonomous}()
    state!(ocp, n)   # dimension of the state
    control!(ocp, m) # dimension of the control
    time!(ocp, [t0, tf])
    constraint!(ocp, :initial, x0)
    constraint!(ocp, :final,   xf)
    A = [ 0.0 1.0
        0.0 0.0 ]
    B = [ 0.0
        1.0 ]
    constraint!(ocp, :dynamics, (x, u) -> A*x + B*u[1])
    objective!(ocp, :lagrange, (x, u) -> 0.5u[1]^2) # default is to minimise

    # the solution
    x(t, a, b, α, β) = [a+b*(t-t0)+β*(t-t0)^2/2.0-α*(t-t0)^3/6.0, b+β*(t-t0)-α*(t-t0)^2/2.0]
    p(t, a, b, α, β) = [α, -α*(t-t0)+β]
    u(t, a, b, α, β) = [p(t, a, b, α, β)[2]]
    a = x0[1]
    b = x0[2]
    C = [-(tf-t0)^3/6.0 (tf-t0)^2/2.0
         -(tf-t0)^2/2.0 (tf-t0)]
    D = [-a-b*(tf-t0), -b]+xf
    p0 = C\D
    α = p0[1]
    β = p0[2]
    #
    N=201
    times = range(0.0, tf, N)
    #
    sol = OptimalControlSolution(n, m, times, t->x(t, a, b, α, β), t->p(t, a, b, α, β), t->u(t, a, b, α, β))

    #
    return OptimalControlProblem{EXAMPLE}(msg, ocp, sol)

end