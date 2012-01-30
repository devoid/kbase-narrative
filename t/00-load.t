#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Kbase::Narrative' ) || print "Bail out!\n";
}

diag( "Testing Kbase::Narrative $Kbase::Narrative::VERSION, Perl $], $^X" );
