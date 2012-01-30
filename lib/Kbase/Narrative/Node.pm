use strict;
use warnings;
use Moose;
with 'Mongoose::EmbeddedDocument';

has 'type' => ( is => 'rw', isa => 'Str', required => 1 );
has 'script' => ( is => 'rw', isa => 'Str', required => 1);
has 'data' => ( is => 'rw', isa => 'HashRef', default => { return {} });

1;
