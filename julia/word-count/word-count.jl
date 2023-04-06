"""
    wordcount(sentence)

Count the number of times each word appears in a sentence.

# Examples
```julia-repl
julia> wordcount("olly olly in come free")
Dict("olly" => 2, "in" => 1, "come" => 1, "free" => 1)
```
"""
function wordcount(sentence)
    count = Dict()
    sentence = replace(lowercase(sentence), r"'(?=\B)|\B'|[^a-z0-9\s']" => " ") 
    words = split(sentence) 
    for word in words
        if word in keys(count)
            count[word] += 1
        else
            count[word] = 1
        end
    end
    return count
end
