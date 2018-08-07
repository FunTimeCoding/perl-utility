use strict;
use warnings;

package perl_utility::perl_utility;

sub main
{
    my $configuration_file = $ENV{"HOME"} . '/.perl-utility.pl';
    open CONFIGURATION, "$configuration_file" or die "Configuration missing: $configuration_file\n";
    my $configuration = join "", <CONFIGURATION>;
    close CONFIGURATION;
    eval $configuration;
    die "Configuration error: $@\n" if $@;
    print "Hello friend.\n";

    return(0);
}

1;
