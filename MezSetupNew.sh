#!/bin/bash
#bash -c "$(curl -H 'Cache-Control: no-cache' -fsSL https://raw.githubusercontent.com/PaulMez/mezfigs/master/MezSetupNew.sh)" 


MezBack='\e[46;30m'
reset='\e[0m'


MezPrint () {
echo -e "${MezBack}\n[$1]${reset}\n"
}