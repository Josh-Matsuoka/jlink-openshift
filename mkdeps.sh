#!/bin/bash
set -euo pipefail
shopt -s globstar

project="${project-spring-boot-sample-simple}"
jarfile="${jarfile-$project/target/spring-boot-sample-simple-1.5.0.BUILD-SNAPSHOT.jar}"
libdir="${libdir-$project/target/lib}"

test -f "$jarfile"
test -d "$libdir"

$JAVA_HOME/bin/jdeps --multi-release 11 -R -s \
    "$jarfile" \
    "$libdir"/**/*.jar \
> deps.txt
