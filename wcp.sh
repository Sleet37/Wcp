#/bin/bash

usage="Usage: wcp [-w<seconds>] [-R] [-X] [-P] [--one-page] [--windows] URL DIRECTORY"
src=$1
dst="-P $2"
mflag="-m"
kflag="-k"
cflag="-c"
pflag="-p"
lflag=""
tflag="-t 1"
cokflag="--no-cookies"
uaflag='--user-agent="Mozilla/5.0\"'
eflag="-e robots=off"
wflag="-w 1"
rwaitflag="--random-wait"
Eflag="-E"
npflag="-np"
xflag=""
Rflag=""
Xflag=""
ctdflag="--content-disposition"
ndflag=""

if [ $# -lt 2 ];
then
	echo $usage
	exit 1
elif [ $# -gt 2 ];
then
	opt=($@)
	for i in $@
	do
		if [ $i = ${opt[-2]} ]
		then
			src=$i
		elif [ $i = ${opt[-1]} ]
		then
			dst="-P $i"
		else
			echo $i
			case $i in
				-w[0-9]*)
					wflag=$i
					;;
				-nd)
					ndflag="-nd"
					;;
				-x)
					xflag="-x"
					;;
				-R)
					"${EDITOR:-vi}" reject
					Rflag="-R reject"
					;;
				--user-agent*)
					uaflag=$i
					;;
				--one-page)
					mflag=""
					;;
				--windows)
					winflag="-e restrict_file_names=windows"
					;;
				-X)
					"${EDITOR:-vi}" notdirs
					Xflag="--exclude-directories notdirs"
					;;
				-P)
					Pflag="-P $i"
					;;
				-h)
					echo $usage
					exit 0
					;;
				*)
					echo $usage
					exit 1
					;;
			esac
		fi
	done
fi
wget $mflag $kflag $cflag $pflag $lflag $tflag $cokflag $uaflag $eflag $wflag $rwaitflag $Eflag $npflag $xflag $Rflag $winflag $Xflag $ctdflag $ndflag $dst $src
exit 0
