# get-packt-book.sh

Download today's free ebook from Packt Publishing.

## Credits

Based on [ch33hau](https://github.com/ch33hau/packt_free_learning)'s work.

## Install (optional)

```sudo DESTDIR=/custom/root/dir make PREFIX=/usr install```

The default directories are
```
DESTDIR=
PREFIX=/usr/local
```

## Configuration

The configuration file `$HOME/.packt.conf` is sourced by the shell script.
It contains:
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

Run `get-packt-book.sh`.
