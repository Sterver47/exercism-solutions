//! # Binary Search
//!
//! This is a simple implementation of binary search in Rust.

/// Returns the index of the given key in the given array, or None if the key is not present.
///
/// # Arguments
/// 
/// * `array` - A sorted array of i32 values.
/// * `key` - The key to search for.
/// 
/// # Examples
///
/// ```
/// use binary_search::find;
///
/// let array = [1, 2, 3, 4, 5];
/// assert_eq!(find(&array, 3), Some(2));
/// assert_eq!(find(&array, 6), None);
/// ```
///
pub fn find(array: &[i32], key: i32) -> Option<usize> {
    let mut low: usize = 0;
    let mut high: usize = array.len();
    let mut mid: usize;
    while low < high {
        mid = (low + high) >> 1;
        if array[mid] == key {
            return Some(mid);
        } else if array[mid] < key {
            low = mid + 1;
        } else {
            high = mid;
        }
    }
    None
}
