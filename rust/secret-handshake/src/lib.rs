//! # Secret Handshake
//! 
//! This library provides a function to decode a secret handshake.

/// Decodes a secret handshake.
/// 
/// # Examples
/// 
/// ```
/// use secret_handshake::actions;
/// 
/// assert_eq!(actions(1), vec!["wink"]);
/// assert_eq!(actions(3), vec!["wink", "double blink"]);
/// assert_eq!(actions(19), vec!["double blink", "wink"]);
/// assert_eq!(actions(31), vec!["jump", "close your eyes", "double blink", "wink"]);
/// ```
/// 
pub fn actions(n: u8) -> Vec<&'static str> {
    let mut handshake = vec!["wink", "double blink", "close your eyes", "jump"];
    for i in 0..4 {
        if n & (1 << i) == 0 {
            handshake[i] = "";
        }
    }
    if n & (1 << 4) != 0 {
        handshake.reverse();
    }
    handshake.retain(|&x| x != "");
    handshake
}
