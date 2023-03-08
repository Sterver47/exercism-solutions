//! # Pangram
//!
//! This is a collection that contains only one function to determine whether
//! a string is a pangram.
use std::collections::HashSet;

/// Determines whether a string is a pangram.
///
/// # Examples
///
/// ```
/// use pangram::is_pangram;
///
/// assert!(is_pangram("the quick brown fox jumps over the lazy dog")); // The string is a pangram.
/// assert!(!is_pangram("the quick brown fox jumps over the lazy")); // The string is not a pangram.
/// ```
///
pub fn is_pangram(sentence: &str) -> bool {
    let mut letters = HashSet::with_capacity(26);
    for c in sentence.to_lowercase().chars() {
        if c.is_ascii_alphabetic() {
            letters.insert(c);
            if letters.len() == 26 {
                return true;
            }
        }
    }
    false
}
