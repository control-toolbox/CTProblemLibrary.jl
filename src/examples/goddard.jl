EXAMPLE=(:goddard, :state_constraint)

@eval_example function OptimalControlProblem{EXAMPLE}()
    # should return an OptimalControlProblem{example} with a message, a model and a solution

    # 
    msg = "Goddard problem with state constraint - maximize altitude"

    # the model
    n = 3
    m = 1
    #
    Cd = 310.
    Tmax = 3.5
    β = 500.
    b = 2.
    N = 100
    t0 = 0.
    r0 = 1.
    v0 = 0.
    vmax = 0.1
    m0 = 1.
    mf = 0.6
    x0 = [ r0, v0, m0 ]

    ocp = Model()

    time!(ocp, :initial, t0) # if not provided, final time is free
    state!(ocp, n) # state dim
    control!(ocp, m) # control dim

    constraint!(ocp, :initial, x0) # vectorial equality
    constraint!(ocp, :control, u -> u[1], 0., 1.) # constraints can be labeled or not
    constraint!(ocp, :mixed, (x, u) -> x[1], r0, Inf, :state_con1)       # epsilon car sinon adjoint state at 0 false because the state is r0 touch the constraint at 0
    constraint!(ocp, :mixed, (x, u) -> x[2], 0., vmax, :state_con2)
    constraint!(ocp, :mixed, (x, u) -> x[3], mf, m0, :state_con3)        

    objective!(ocp, :mayer,  (t0, x0, tf, xf) -> xf[1], :max)

    function F0(x)
        r, v, m = x
        D = Cd * v^2 * exp(-β*(r-1.))
        F = [ v, -D/m-1.0/r^2, 0. ]
        return F
    end

    function F1(x)
        r, v, m = x
        F = [ 0., Tmax/m, -b*Tmax ]
        return F
    end

    function f(x, u)
        return F0(x) + u[1]*F1(x)
    end

    constraint!(ocp, :dynamics, f)

    # the solution
    x(t) = zeros(n)
    p(t) = zeros(n)
    u(t) = zeros(m)
    #
    N=201
    times = range(0.0, 1.0, N)
    #
    sol = OptimalControlSolution(n, m, times, x, p, u)

    #
    return OptimalControlProblem{EXAMPLE}(msg, ocp, sol)

end