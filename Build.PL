use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Kbase::Narrative',
    license             => 'perl',
    dist_author         => q{Scott Devoid <devoid@ci.uchicago.edu>},
    dist_version_from   => 'lib/Kbase/Narrative.pm',
    build_requires => {
        'Test::More' => 0,
	'Dancer'     => 0,
	'YAML'       => 0,
	'MongoDB'    => 0,
	'Moose'      => 0,
        'Mongoose'   => 0,
	'carton'     => 0,
	'cpanm'      => 0,
    },
    requires => {
        'perl' => 0,
    },
    add_to_cleanup      => [ 'Kbase-Narrative-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
