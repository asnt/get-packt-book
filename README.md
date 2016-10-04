# get-packt-book.sh

Download today's free ebook from Packt Publishing.

## Credits

Based on [ch33hau](https://github.com/ch33hau/packt_free_learning)'s work.

## Install

### Manually

```
$ sudo make install DESTDIR=/custom/root PREFIX=/usr
```
with `DESTDIR=` and `PREFIX=/usr/local` by default.

A systemd unit and a timer are installed in `$(DESTDIR)/usr/lib/systemd/user`.

### Arch Linux

Make an Arch Linux package from the latest master git repository.

```
$ export BUILD_DIR=/my/build/dir
$ cd $BUILD_DIR
$ wget https://raw.githubusercontent.com/asnt/get-packt-book/master/PKGBUILD
$ makepkg
$ sudo pacman -U get-packt-book-git-VERSION.tar.xz
```
Replace `VERSION` with the generated value.

## Configuration

The configuration file `$HOME/.packt.conf` is sourced by the shell script.
It contains:
```
USERNAME=""
PASSWORD=""
DOWNLOAD_PATH="$HOME/packt"
DOWNLOAD_FORMATS="epub mobi pdf"
```
Set at least your `USERNAME` and `PASSWORD`.

If `$HOME/.packt.conf` does not exist, run the `get-packt-book.sh` script once
to generate an example configuration file in `$HOME/.packt.conf.example`.

## Usage

Run `get-packt-book.sh` manually or schedule a daily execution (see below).

## Schedule daily execution

Use a systemd timer to execute the script daily.

Install the package (see above) or copy the systemd unit and timer manually to
`$HOME/.config/systemd/user`.

Refresh systemd and activate the timer:
```
$ systemctl --user daemon-reload
$ systemctl --user enable packt.timer
```
