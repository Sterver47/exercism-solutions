proc isIsogram {input} {
    foreach char [split $input ""] {
        set char [string tolower $char]
        if ![string is alpha $char] {
            continue
        }
        if [info exists chars($char)] {
            return false
        }
        incr chars($char)
    }
    return true
}
