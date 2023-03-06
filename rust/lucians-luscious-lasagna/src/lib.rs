//! # Lucian's Luscious Lasagna
//! 
//! This is a collection of functions to help you cook the perfect lasagna
//! from your favorite cooking book. :)

/// The number of minutes the lasagna should be in the oven.
const OVEN_MINUTES: i32 = 40;
/// The number of minutes needed for preparation per layer.
const MINUTES_PER_LAYER: i32 = 2;

/// Returns the number of minutes the lasagna should be in the oven.
/// 
/// # Examples
/// 
/// ```	
/// use lucians_luscious_lasagna::expected_minutes_in_oven;
/// 
/// assert_eq!(40, expected_minutes_in_oven()); // The lasagna should be in the oven for 40 minutes.
/// ```
/// 
pub fn expected_minutes_in_oven() -> i32 {
    OVEN_MINUTES
}

/// Calculates the remaining number of minutes the lasagna should be in the oven
/// based on the number of minutes it has been in the oven.
/// 
/// # Examples
/// 
/// ```
/// use lucians_luscious_lasagna::remaining_minutes_in_oven;
/// 
/// assert_eq!(30, remaining_minutes_in_oven(10)); // The lasagna should be in the oven for 30 more minutes (40-10=30).
/// ```
/// 
pub fn remaining_minutes_in_oven(actual_minutes_in_oven: i32) -> i32 {
    OVEN_MINUTES - actual_minutes_in_oven
}

/// Calculates the number of minutes the lasagna should be in the oven
/// based on the number of layers.
/// 
/// # Examples
/// 
/// ```
/// use lucians_luscious_lasagna::preparation_time_in_minutes;
/// 
/// assert_eq!(8, preparation_time_in_minutes(4)); // The lasagna preparation should take 8 minutes (4 layers * 2 minutes per layer).
/// ```
/// 
pub fn preparation_time_in_minutes(number_of_layers: i32) -> i32 {
    number_of_layers * MINUTES_PER_LAYER
}

/// Calculates the elapsed time in minutes based on the number of layers
/// and the number of minutes the lasagna has been in the oven.
/// 
/// # Examples
/// 
/// ```
/// use lucians_luscious_lasagna::elapsed_time_in_minutes;
/// 
/// assert_eq!(32, elapsed_time_in_minutes(1, 30)); // Elapsed time should be 32 minutes (30 minutes in the oven + 2 minutes for 1 layer).
/// ```
/// 
pub fn elapsed_time_in_minutes(number_of_layers: i32, actual_minutes_in_oven: i32) -> i32 {
    actual_minutes_in_oven + preparation_time_in_minutes(number_of_layers)
}
