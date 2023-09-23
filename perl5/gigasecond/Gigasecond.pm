package Gigasecond;

use v5.32;

use Exporter qw<import>;
our @EXPORT_OK = qw<add_gigasecond>;

use strict;
use Time::Local;

sub add_gigasecond {
    # Capture the input time string
    my ($time_str) = @_;
    
    # Variables to store the extracted date and time components
    my ($year, $month, $day, $hour, $min, $sec);
    
    # Check if the input string matches the full "YYYY-MM-DDTHH:MM:SS" format
    if ($time_str =~ /(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})/) {
        ($year, $month, $day, $hour, $min, $sec) = ($1, $2, $3, $4, $5, $6);
    }
    # Check if the input string matches the "YYYY-MM-DD" format
    elsif ($time_str =~ /(\d{4})-(\d{2})-(\d{2})/) {
        ($year, $month, $day) = ($1, $2, $3);
    } else {
        die "Invalid date format provided.\n";
    }
    
    # Convert the date and time to epoch seconds in GMT
    # This ensures consistent calculations regardless of local time zones
    my $epoch_time = timegm($sec, $min, $hour, $day, $month-1, $year);
    
    # Add a gigasecond (1 billion seconds) to the epoch time
    $epoch_time += 10**9;
    
    # Convert the updated epoch time back to date and time components in GMT
    ($sec, $min, $hour, $day, $month, $year) = gmtime($epoch_time);
    $year += 1900;
    $month += 1;
    
    # Return the updated date and time in the desired format
    return sprintf("%04d-%02d-%02dT%02d:%02d:%02d", $year, $month, $day, $hour, $min, $sec);
}
