# Stop all mobile device sessions
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
SLEEP=10

DISPLAYOPTS="--video-scaling=100 --desktop-fullscreen=true --pixel-depth=16 --desktop-scalin$

echo "Terminating any existing live view sessions"
$DIR/terminateLiveViewSessions.sh 

echo "Restart VirtualHere connection to devices"
$DIR/restartVhClient.sh

echo "Print VirtualHere Server Log"
cat $DIR/vhserver.log

echo "Starting Live View"

# Mi 3
xpra start --bind-tcp=0.0.0.0:14500 --html=on --start="scrcpy -s MYSERIALNUMBER -m 768" $DISPLAYOPTS --daemon=no :100 &
sleep $SLEEP

# Mi A1
xpra start --bind-tcp=0.0.0.0:14501 --html=on --start="scrcpy -s MYSERIALNUMBER2 -m 768" $DISPLAYOPTS --daemon=no :101 &
sleep $SLEEP


