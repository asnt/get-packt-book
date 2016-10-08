# Maintainer: asnt <snt.alex@gmail.com>
pkgname=get-packt-book-git
pkgver=latest
pkgrel=1
pkgdesc="Get today's Packt free learning book"
arch=('any')
url="http://github.com/asnt/${pkgname%-git}.git"
license=('MIT')
depends=("curl")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+http://github.com/asnt/${pkgname%-git}.git")
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
                    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

