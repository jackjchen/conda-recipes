#/bin/bash -eu

# Download APR
mkdir -p $SRC_DIR/srclib/apr
curl https://archive.apache.org/dist/apr/apr-1.6.5.tar.gz | tar -xz -C $SRC_DIR/srclib/apr --strip-components=1
mkdir -p $SRC_DIR/srclib/apr-util
curl https://archive.apache.org/dist/apr/apr-util-1.6.1.tar.gz | tar -xz -C $SRC_DIR/srclib/apr-util --strip-components=1

./configure --help

./configure \
    --prefix=$PREFIX \
    --enable-cache \
    --enable-cache-disk \
    --enable-cgi \
    --enable-dir \
    --enable-disk-cache \
    --enable-deflate \
    --enable-env \
    --enable-expires \
    --enable-ext-filter \
    --enable-file-cache \
    --enable-headers \
    --enable-http \
    --enable-info \
    --enable-mem-cache \
    --enable-mime \
    --enable-mime-magic \
    --enable-rewrite \
    --enable-ssl \
    --enable-suexec \
    --enable-vhost-alias \
    --enable-unixd \
    --with-mpm=worker \
    --with-ssl=$PREFIX \
    --with-z=$PREFIX \
    --with-included-apr \
    --enable-mods-shared=all

make -j $CPU_COUNT
make install
