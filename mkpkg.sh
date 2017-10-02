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
mkdir -p pkg/lib/systemd/system/
cp src/oxy/target/release/oxy pkg/usr/bin
cp oxy.service pkg/lib/systemd/system
mkdir pkg/DEBIAN
cat >pkg/DEBIAN/control <<EOF
Package: oxy
Version: 0.1.0
Maintainer: Jenna Magius
Architecture: amd64
Description: Oxy, A Secure Remote Access Server
EOF

cat >pkg/DEBIAN/postinst <<EOF
systemctl daemon-reload
systemctl enable oxy
systemctl start oxy
EOF

chmod +x pkg/DEBIAN/postinst

dpkg-deb --build pkg
