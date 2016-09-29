# get-packt-book.sh

Download today's free ebook from Packt Publishing.

## Install (optional)

To make the script available globally or for packaging, use `make install` with
your preferred locations, e.g.

```sudo DESTDIR=/custom/root/dir make PREFIX=/usr install```

The default directories are
```
DESTDIR=
PREFIX=/usr/local
```

## Configuration

The configuration file `$HOME/.packt.conf` is sourced by the shell script.
It has the following content:
```
USERNAME=""
PASSWORD=""
DOWNLOAD_PATH="$HOME/packt"
DOWNLOAD_FORMATS="epub pdf" # epub, mobi, pdf 
```
Set at least your `USERNAME` and `PASSWORD`.

If `$HOME/.packt.conf` does not exist, run the `get-packt-book.sh` script once
to generate an example configuration file in `$HOME/.packt.conf.example`.

## Usage

Run `get-packt-book.sh` installed globally or from the repository directly.
