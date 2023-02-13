macro eval_example(expr)
    #dump(expr)
    new_expr = MacroTools.postwalk(ex -> ex==:EXAMPLE ? eval(ex) : ex, expr)
    vv = quote
        $(new_expr)
    end
    #@show vv
    return esc(vv)
end

#struct OptimalControlProblem{example} end

#EXAMPLE=(:integrator, :dim2, :energy)
#@eval_example function OptimalControlProblem{EXAMPLE}()
#    println("hello example = ", EXAMPLE)
#end

#OptimalControlProblem{(:integrator, :dim2, :energy)}()