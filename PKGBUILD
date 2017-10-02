pkgname=oxy-git
pkgdesc='Oxy, a secure remote access tool'
license=('zlib')
url='https://github.com/RiskSense-Ops/oxy/'
pkgver=0.1.0
pkgver() {
  echo "0.1.0"
}
pkgrel=1
arch=('x86_64')
depends=()
makedepends=()
conflicts=()
source=(
  'git+https://github.com/RiskSense-Ops/oxy.git'
)
md5sums=('SKIP')
install=oxy.install

build() {
  cd oxy
  cargo build --release
  cd ..
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp -r "$srcdir/oxy/target/release/oxy" "$pkgdir/usr/bin/"
}
