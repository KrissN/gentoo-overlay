EAPI=7

inherit git-r3 multilib

GITHUB_USER=ralight
GITHUB_REPO=sqlite3-pcre
EGIT_REPO_URI="https://github.com/${GITHUB_USER}/${GITHUB_REPO}.git"
EGIT_BRANCH="master"
EGIT_COMMIT=c98da412b431edb4db22d3245c99e6c198d49f7a

DESCRIPTION="An extension for sqlite3 that uses libpcre to provide the REGEXP() function"
HOMEPAGE="https://github.com/ralight/sqlite3-pcre/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

PATCHES=(
        "${FILESDIR}"/${PN}-libdir.patch
)

DEPEND="
	dev-db/sqlite
	dev-libs/libpcre
"

BDEPEND="virtual/pkgconfig"

RDEPEND="${DEPEND}"

src_install() {
        emake DESTDIR="${D}" LIBDIR="$(get_libdir)" install
}
