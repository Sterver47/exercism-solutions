package Luhn;

use v5.32;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;

sub is_luhn_valid {
    my ($number) = @_;
    # delete whitespaces from $number:
    $number =~ s/\s//g;
    # check if only numbers are in $number or length of $number is less than 2:
    if ($number =~ /\D/ or length($number) < 2) {
        return 0;
    }
    # reverse $number:
    $number = reverse($number);
    # split $number into an array:
    my @number_array = split(//, $number);
    my $sum = 0;
    # iterate over @number_array:
    for (my $i = 0; $i < scalar(@number_array); $i++) {
        # check if $i is an even number:
        if ($i % 2 == 0) {
            # multiply the number at index $i by 2:
            @number_array[$i+1] *= 2;
            # check if the number at index $i is greater than 9:
            if (@number_array[$i+1] > 9) {
                # subtract 9 from the number at index $i:
                @number_array[$i+1] -= 9;
            }
        }
        $sum += @number_array[$i];
    }
    return 1 if ($sum % 10 == 0);
    return 0;
}
