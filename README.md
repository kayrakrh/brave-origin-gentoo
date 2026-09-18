# brave-origin-gentoo
```bash
emerge --ask app-eselect/eselect-repository
```
eselect repository add kayrakrh-overlay https://github.com/kayrakrh/brave-origin-gentoo.git
```
```
emaint sync -r kayrakrh-overlay
```

## Manually
`touch /etc/portage/repos.conf/`:
```conf
[kayrakrh-overlay]
location = /var/db/repos/kayrakrh-overlay
sync-type = git
sync-uri = https://github.com/kayrakrh/brave-origin-gentoo.git
priority = 50
masters = gentoo
```
then, `emaint sync -r kayrakrh-overlay`

## Installing
```bash
emerge -av brave-origin
```
