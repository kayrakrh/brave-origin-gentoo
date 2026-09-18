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

S="${WORKDIR}"

src_unpack() {
    unpack "brave-browser-nightly-${PV}-linux-amd64.zip"
    unpack "source.tar.gz"

    mkdir "${WORKDIR}/gentoo-source" || die

    tar -xf "${WORKDIR}/source.tar.gz" \
        -C "${WORKDIR}/gentoo-source" || die
}

src_install() {
    insinto /opt/brave.com/brave-origin-nightly
    doins -r "${WORKDIR}/brave-browser-nightly-"*/*

    fperms +x /opt/brave.com/brave-origin-nightly/brave

    if [[ -d "${WORKDIR}/gentoo-source/usr" ]]; then
        insinto /usr
        doins -r "${WORKDIR}/gentoo-source/usr/"*
    fi
}
