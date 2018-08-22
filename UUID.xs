#include <boost/uuid/uuid.hpp>            // uuid class
#include <boost/uuid/uuid_generators.hpp> // generators
#include <boost/uuid/uuid_io.hpp>         // streaming operators etc.
#include <xs/xs.h>

MODULE = Boost::UUID                PACKAGE = Boost::UUID
PROTOTYPES: DISABLE

std::string random_uuid(){
    boost::uuids::uuid uuid = boost::uuids::random_generator()();
    RETVAL =  boost::uuids::to_string(uuid);
}

std::string nil_uuid(){
    boost::uuids::uuid uuid = boost::uuids::nil_generator()();
    RETVAL =  boost::uuids::to_string(uuid);
}

std::string string_uuid(std::string input_str ){
    if ( input_str.empty() ) {
        RETVAL = std::string();
        return;
     }

    boost::uuids::string_generator gen;
    boost::uuids::uuid u1;

    try {
        u1 = gen(input_str);
    }catch (const boost::exception& ex) {

    };

    RETVAL =  boost::uuids::to_string(u1);
}

std::string name_uuid(std::string dns_name ){
    boost::uuids::uuid uuid = boost::uuids::name_generator(boost::uuids::uuid())(dns_name);
    RETVAL =  boost::uuids::to_string(uuid);
}
