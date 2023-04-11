function transform(input::AbstractDict)
    Dict{Char, Int}(
        lowercase(letter) => points
        for (points, letters) in input
        for letter in letters
    )
end
