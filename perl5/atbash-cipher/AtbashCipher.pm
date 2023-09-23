package AtbashCipher;

use v5.32;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode_atbash decode_atbash>;

my $plain = join "", "a".."z", "0".."9";
my $cipher = join "", reverse("a".."z"), "0".."9";

sub convert {
    my ($phrase) = @_;
    $phrase = lc($phrase);
    my $converted_phrase = "";
    foreach my $phrase_char (split //, $phrase) {
        my $index = index($plain, $phrase_char);
        if ($index != -1) {
            $converted_phrase .= substr($cipher, $index, 1);
        }
    }
    return $converted_phrase;
}

sub encode_atbash {
    my ($phrase) = @_;
    my $encoded_phrase = convert($phrase);
    $encoded_phrase =~ s/(.{5})/$1 /g;
    $encoded_phrase =~ s/ $//;
    return $encoded_phrase;
}

sub decode_atbash {
    my ($phrase) = @_;
    my $decoded_phrase = convert($phrase);
    $decoded_phrase =~ s/ //g;
    return $decoded_phrase;
}
