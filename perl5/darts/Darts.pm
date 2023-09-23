package Darts;

use v5.32;

use Exporter qw<import>;
our @EXPORT_OK = qw<score_dart>;

sub score_dart {
    my $distance = sqrt( @_[0]**2 + @_[1]**2 );
    return 10 if $distance <= 1;
    return 5  if $distance <= 5;
    return 1  if $distance <= 10;
    return 0;
}
