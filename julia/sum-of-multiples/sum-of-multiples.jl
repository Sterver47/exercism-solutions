# Ultra-minified one line version :D
sum_of_multiples(l,f)=sum(Set(vcat(0,[i for a=f if a>0 for i=a:a:l-1])))

# Normal version :)
#function sum_of_multiples(limit, factors)
#    multiples = Set(vcat(0, [i for factor in factors if factor != 0 for i in factor:factor:limit-1]))
#    return sum(multiples)
#end
