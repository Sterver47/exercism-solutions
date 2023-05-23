proc age {seconds orbital_period} {
    return [expr {$seconds / 31557600.0 / $orbital_period}]
}
proc onEarth {seconds} {
    return [age $seconds 1.0]
}
proc onMercury {seconds} {
    return [age $seconds 0.2408467]
}
proc onVenus {seconds} {
    return [age $seconds 0.61519726]
}
proc onMars {seconds} {
    return [age $seconds 1.8808158]
}
proc onJupiter {seconds} {
    return [age $seconds 11.862615]
}
proc onSaturn {seconds} {
    return [age $seconds 29.447498]
}
proc onUranus {seconds} {
    return [age $seconds 84.016846]
}
proc onNeptune {seconds} {
    return [age $seconds 164.79132]
}
proc onSun {seconds} {
    return -code error "not a planet"
}
