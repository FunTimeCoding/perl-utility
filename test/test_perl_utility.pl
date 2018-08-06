use strict;
use warnings;
use Test::More tests => 4;
use lib 'module';
use perl_utility::perl_utility;

is(1, 1, "is() example");
ok(1 eq 1, "ok() example");
isnt(1, 2, "isnt() example");
is(perl_utility::perl_utility::main(), 0, "main() return value");
