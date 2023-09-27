package Series;

use v5.32;

use Exporter qw<import>;
our @EXPORT_OK = qw<slices>;

sub slices {
    my ($series, $slice_length) = @_;
    my $series_length = length $series;
    
    die "slice length cannot be zero" if $slice_length == 0;
    die "series cannot be empty" if $series_length == 0;
    die "slice length cannot be negative" if $slice_length < 0;
    die "slice length cannot be greater than series length"
        if $slice_length > $series_length;
    
    my @slices = ();
    for my $i (0 .. $series_length - $slice_length) {
        push @slices, substr $series, $i, $slice_length;
    }
    return \@slices;
}
