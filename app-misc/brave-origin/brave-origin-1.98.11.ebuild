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
    # Brave Origin Nightly
    insinto /opt/brave.com/brave-origin-nightly

    # ZIP'in tamamı WORKDIR köküne açılıyor.
    # source.tar.gz'nin opt/ ve usr/ dizinlerini hariç tut.
    find "${WORKDIR}" -mindepth 1 -maxdepth 1 \
        ! -name opt \
        ! -name usr \
        ! -name 'source.tar.gz' \
        -exec cp -a {} "${D}/opt/brave.com/brave-origin-nightly/" \; \
        || die

    # Gentoo entegrasyon dosyaları
    if [[ -d "${WORKDIR}/usr" ]]; then
        insinto /usr
        doins -r "${WORKDIR}/usr/." || die
    fi

    # Brave executable
    fperms +x /opt/brave.com/brave-origin-nightly/brave-browser-nightly
}
