proc raindrops {number} {
    set sound ""
    if {!($number % 3)} {append sound Pling}
    if {!($number % 5)} {append sound Plang}
    if {!($number % 7)} {append sound Plong}
    return [expr {$sound eq "" ? $number : $sound}]
}

# proc raindrops {number} {
#     set sound ""
#     foreach {factor s} {3 Pling 5 Plang 7 Plong} {
#         if {![expr $number % $factor]} {
#             append sound $s
#         }
#     }
#     return [expr {$sound eq "" ? $number : $sound}]
# }
