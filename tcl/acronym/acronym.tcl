proc abbreviate {phrase} {
    # replace everything except letters and apostrophe with whitespace:
    regsub -all {[^[:alpha:]']} $phrase " " phrase
    # take the first letter of each word in phrase and append to acronym:
    set acronym ""
    foreach word $phrase {
        append acronym [string index $word 0]
    }
    # return the acronym in uppercase:
    return [string toupper $acronym]
}
