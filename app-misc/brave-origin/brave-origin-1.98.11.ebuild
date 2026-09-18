EAPI=8

DESCRIPTION="Brave Origin Nightly Browser"
HOMEPAGE="https://github.com/brave/brave-browser"

SRC_URI="
    https://github.com/brave/brave-browser/releases/download/v${PV}/brave-browser-nightly-${PV}-linux-amd64.zip
    https://github.com/kayrakrh/brave-origin-gentoo/releases/download/Source/source.tar.gz
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="strip"

src_unpack() {
    default

    mkdir "${WORKDIR}/gentoo-source" || die
    unpack "${DISTDIR}/source.tar.gz"
    mv "${WORKDIR}/opt" \
       "${WORKDIR}/usr" \
       "${WORKDIR}/gentoo-source/" || die
}

src_install() {
    insinto /opt/brave.com/brave-origin-nightly
    doins -r "${WORKDIR}/brave-browser-nightly-"*/*

    fperms +x /opt/brave.com/brave-origin-nightly/brave

    # Kendi /usr dosyaların
    insinto /usr
    doins -r "${WORKDIR}/gentoo-source/usr/"*
}
