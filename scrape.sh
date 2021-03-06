#!/bin/bash

[[ $# -eq 0 ]] && { echo "Usage: FILE=filename TOKEN=some-token [FORMAT=epub] [DIR=out] ./scrape.sh"; exit 1;}

[[ -f ./env.sh ]] && source ./env.sh

[[ -z $TOKEN ]] && echo "missing TOKEN" && exit 1

[[ -z $FILE ]] && echo "missing FILE" && exit 1

[[ -n $FORMAT ]] && FORMAT=$FORMAT || FORMAT=epub

[[ -n $DIR ]] && DIR=$DIR || DIR=out

wget -O $DIR/$FILE.$FORMAT https://www.oreilly.com/programming/free/files/$FILE.$FORMAT\?mkt_tok\=$TOKEN && exit 0
