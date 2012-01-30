package Kbase::Narrative::NarrativeObject;

use strict;
use warnings;
use Moose;
use Kbase::Narrative::Node;
with 'Mongoose::Document' => {
    -collection_name => 'narratives'
};

has 'nodes' => ( is => 'rw', isa => 'ArrayRef[Kbase::Narrative::Node]', default => sub { return [] });

1;
