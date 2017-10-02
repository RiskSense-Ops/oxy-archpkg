#!/bin/bash
rm -rf pkg
mkdir src
mkdir pkg
cd src
git clone "https://github.com/RiskSense-Ops/oxy.git"
cd oxy
cargo build --release
cd ..
cd ..
mkdir -p pkg/usr/bin/
cp src/oxy/target/release/oxy pkg/usr/bin
mkdir pkg/DEBIAN
cat >pkg/DEBIAN/control <<EOF
Package: oxy
Version: 0.1.0
Maintainer: Jenna Magius
Architecture: amd64
Description: Oxy, A Secure Remote Access Server
EOF

dpkg-deb --build pkg
