#!/bin/sh

function build() {
    if [ ! -d $1 ]; then
        git clone https://github.com/openam-jp/$1
        if [ $? -ne 0 ] ; then
            exit 1;
        fi
    fi

    mvn install -f $@
    if [ $? -ne 0 ] ; then
        exit 1;
    fi
}

source /etc/profile.d/enable-maven33.sh

if [ ! -d source ]; then
    mkdir source
fi
cd source

build forgerock-parent
build forgerock-bom
build forgerock-build-tools
build forgerock-i18n-framework
build forgerock-guice -DskipTests
build forgerock-guava
build forgerock-ui
build forgerock-commons -DskipTests
build opendj-sdk -DskipTests
build forgerock-persistit -DskipTests
build opendj
build forgerock-bloomfilter
build openam

