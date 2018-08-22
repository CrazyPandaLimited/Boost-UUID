package Boost::UUID;
use 5.020;
use strict;
use warnings;
use XSLoader;

=head1 NAME

Boost::UUID - perl interface for boost::uuid

=cut

our $VERSION = '0.01';
XSLoader::load( 'Boost::UUID', $VERSION );


=head1 SYNOPSYS

    ### SHA-1 format ( example 25f9de77-a9a6-5816-b7cb-bafc0a203417 )
    use Boost::UUID;
    my $uuid = Boost::UUID->random_uuid();

    ### Generate nil uuid
    my $nil_uuid = Boost::UUID::nil_uuid(); ### 00000000-0000-0000-0000-000000000000

    ### convert string to uuid
    Boost::UUID::string_uuid("wrong_uuid_string"); ### 00000000-0000-0000-0000-000000000000 - nil uuid
    Boost::UUID::string_uuid("0123456789abcdef0123456789abcdef"); ### 01234567-89ab-cdef-0123-456789abcdef

    ### Generate UUID by name ( useful for DNS names )
    is Boost::UUID::name_uuid(""), 'e129f27c-5103-5c5c-844b-cdf0a15e160d';
    is Boost::UUID::name_uuid("crazypanda.ru"), '25f9de77-a9a6-5816-b7cb-bafc0a203417';

=cut
