package Kbase::Narrative;
use Dancer ':syntax';
use Kbase::Narrative::NarrativeObject;
use Mongoose;
use Data::Dumper;
our $VERSION = '0.1';
Mongoose->db('mydb');
set serializer => 'JSON';

warn Kbase::Narrative::NarrativeObject->query({})->each(sub { print Dumper $_[0] }));
get '/' => sub {
    template 'index';
};

get '/narrative/' => sub {
    my $limit = (defined(param('limit'))) ? param('limit') : 10;
    my $skip = (defined(param('skip'))) ? param('skip') : 10;
    my $narratives = Kbase::Narrative::NarrativeObject->query({},
        { limit => $limit, skip => $skip })->each(sub {
            my $narrative = shift;
            print $narrative;
        });
    return $narratives;	
};

get '/narrative/:id' => sub {
    my $id = param('id');
    my $narrative = Kbase::Narrative::NarrativeObject->find_one({ _id => $id});
    send_error("Not Found", 404) unless(defined($narrative));
    return $narrative;
};


put '/narrative/:id' => sub {
    my $id = param('id');
    my $narrative = Kbase::Narrative::NarrativeObject->find_one({ _id => $id});
    send_error("Not Found", 404) unless(defined($narrative));
    my $params = params;
    foreach my $param (keys %{$params}) {
            $narrative->$param = params->{$param};
    }
    $narrative->save();
    return $narrative;
};
	
true;
