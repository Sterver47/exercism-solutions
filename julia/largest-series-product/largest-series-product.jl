function largest_product(str, span)
    if span == 0 return 1 end

    if span > length(str) throw(ArgumentError("span longer than string length")) end

    if span < 0 throw(ArgumentError("negative span")) end

    if length(str) == 0 throw(ArgumentError("empty string and nonzero span")) end

    if !all(isdigit, str) throw(ArgumentError("invalid character in digits")) end

    maximum(
        [
            prod(
                [
                    parse(Int, s) for s in str[i:i+span-1]
                ]
            ) for i in 1:length(str)-span+1
        ]
    )
end
