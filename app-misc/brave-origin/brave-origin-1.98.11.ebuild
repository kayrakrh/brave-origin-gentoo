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
    default
}

src_install() {
    # Brave browser
    insinto /opt/brave.com/brave-origin-nightly
    doins -r "${WORKDIR}/brave-browser-nightly-${PV}/." || die

    # Gentoo-maintained integration files
    if [[ -d "${WORKDIR}/usr" ]]; then
        insinto /usr
        doins -r "${WORKDIR}/usr/." || die
    fi

    fperms +x /opt/brave.com/brave-origin-nightly/brave
}
