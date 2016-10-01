#!/bin/bash

# Default parameters
USERNAME=""
PASSWORD=""
DOWNLOAD_PATH="$HOME/packt"
DOWNLOAD_FORMATS="epub pdf" 

# Load config
CONFIG_FILE="$HOME/.packt.conf"
EXAMPLE_CONFIG_FILE="$CONFIG_FILE.example"
EXAMPLE_CONFIG=$(cat << EOF
USERNAME=""
\nPASSWORD=""\
\nDOWNLOAD_PATH="$HOME/packt"
\nDOWNLOAD_FORMATS="epub pdf"	# epub mobi pdf
EOF
)

if [ ! -f $CONFIG_FILE ]
then
    echo "Cannot find config file $CONFIG_FILE"
    echo -e $EXAMPLE_CONFIG > $EXAMPLE_CONFIG_FILE
    echo "Copy and adapt the example file at $EXAMPLE_CONFIG_FILE"
    exit 1
fi
chmod 400 $CONFIG_FILE
source $CONFIG_FILE

if [ -z "$USERNAME" ] || [ -z $PASSWORD ]
then
    echo "Please set USERNAME and PASSWORD in the config file"
    exit 1
fi

# Claim and download the books
echo "Date: $(date)"

TMP_FILE="/tmp/free-learning.txt"
URL_LOGIN="https://www.packtpub.com"
COMMAND_LOGIN="curl -s -i -X POST -d email=$USERNAME&password=$PASSWORD&op=Login&form_id=packt_user_login_form $URL_LOGIN"

URL_FREE_LEARNING="https://www.packtpub.com/packt/offers/free-learning"
COMMAND_FREE_LEARNING="curl -s -X GET $URL_FREE_LEARNING"

response_login=$($COMMAND_LOGIN > $TMP_FILE)
login_cookie=$(cat $TMP_FILE | grep Set-Cookie | tail -1 | grep -Po "Set-Cookie: (SESS_live=*\w*)" | cut -d\  -f2)
if [[ -z "$login_cookie" ]]; then
        login_cookie=$(cat $TMP_FILE | grep Set-Cookie | tail -2 | grep -Po "Set-Cookie: (SESS_live=*\w*)" | cut -d\  -f2)
fi

response_freelearning=$($COMMAND_FREE_LEARNING)
book_title=$(echo $response_freelearning | grep -Po "(?<=<div class=\"dotd-title\"> <h2> )[\w .-]+(?= <\/h2> <\/div>)")
book_href=$(echo $response_freelearning | grep -Po "(?<=<a href=\")[\w \/-]+(?=\" class=\"twelve-days-claim\")")
book_number=$(echo $book_href | cut -d/ -f3)
book_url=$URL_LOGIN$book_href

echo "Today's free book: $book_title"
echo "Claim url: $book_url"
COMMAND_CLAIM_FREE_BOOK="curl -i -s --cookie $login_cookie $book_url"

$COMMAND_CLAIM_FREE_BOOK > /dev/null 2>&1

mkdir -p $DOWNLOAD_PATH
for format in $DOWNLOAD_FORMATS
do
    URL_DOWNLOAD_BOOK="https://www.packtpub.com/ebook_download/$book_number/$format"
    BOOK_LOCATION="$DOWNLOAD_PATH"/"$book_title"."$format"
    COMMAND_DOWNLOAD_BOOK="curl -s -L --cookie $login_cookie $URL_DOWNLOAD_BOOK"
    echo "Downloading to $BOOK_LOCATION..."
    $COMMAND_DOWNLOAD_BOOK > "$BOOK_LOCATION"
    echo "Downloaded to $BOOK_LOCATION"
done
