function saddlepoints(M)
    saddlepoints = Tuple{Int,Int}[]
    for i in axes(M, 1), j in axes(M, 2)
        if M[i, j] == maximum(M[i, :]) && M[i, j] == minimum(view(M, :, j))
            push!(saddlepoints, (i, j))
        end
    end
    return saddlepoints
end