#!/bin/sh
#
# Download and build lua lib
set -euo pipefail

version=5.3.2
sha1=7a47adef554fdca7d0c5536148de34579134a973

src=$PWD/liblua
out=$PWD/out

mkdir -p ${src}
curl -OL http://www.lua.org/ftp/lua-${version}.tar.gz
echo "${sha1}  lua-${version}.tar.gz" | sha1sum -c
tar -C ${src} --strip-components 1 -xf lua-${version}.tar.gz


cd ${src}
make linux
make install INSTALL_TOP=${out}
