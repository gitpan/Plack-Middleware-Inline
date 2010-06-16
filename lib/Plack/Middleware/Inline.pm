package Plack::Middleware::Inline;
BEGIN {
  $Plack::Middleware::Inline::VERSION = '0.01';
}

use warnings;
use strict;

use base qw(Plack::Middleware);

sub call { goto &{ $_[0]->{code} } }

1;

=head1 NAME

Plack::Middleware::Inline - Anonymous Plack::Middlewares

=head1 VERSION

version 0.01

=head1 SYNOPSIS

    use Plack::Builder;
    builder {
        enable Inline => code => sub {
            my ($self, $env) = @_;
            ...
            $self->app->($env);
        };
        $app
    }

=cut