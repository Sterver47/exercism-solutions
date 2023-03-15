//! # Sieve
//!
//! This library contains a function to generate a vector of primes.

/// Returns a vector of all primes up to and including the upper bound.
///
/// # Examples
///
/// ```
/// use sieve::primes_up_to;
///
/// assert_eq!(primes_up_to(10), vec![2, 3, 5, 7]);
/// ```
///
pub fn primes_up_to(upper_bound: u64) -> Vec<u64> {
    let mut sieve = vec![true; upper_bound as usize + 1];

    sieve[0] = false;
    sieve[1] = false;

    for i in 2..((upper_bound as f64).sqrt() as u64 + 1) {
        if sieve[i as usize] {
            for j in (i * i..upper_bound + 1).step_by(i as usize) {
                sieve[j as usize] = false;
            }
        }
    }

    /*
        position: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
        sieve:    F, F, T, T, F, T, F, T, F, F, F
        primes:         2, 3,    5,    7
    */

    sieve
        .iter()
        .enumerate()
        .filter(|(_, &is_prime)| is_prime)
        .map(|(i, _)| i as u64)
        .collect()
}
