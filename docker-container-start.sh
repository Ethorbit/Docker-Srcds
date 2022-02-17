#!/bin/sh
DIR=$(dirname -- $0)

if [ ! -f "$DIR/server/update.sh" ]; then
	echo -e "#!/bin/sh\n" >> $DIR/server/update.sh
	echo "steamcmd +force_install_dir \"$DIR/server\" +login anonymous +app_update $SRCDS_APPID validate +exit" >> $DIR/server/update.sh
	chmod +x "$DIR/server/update.sh"
fi

if [ ! -f "$DIR/server/start.sh" ]; then
	echo -e "#!/bin/sh\n" >> $DIR/server/start.sh
	echo "\"$DIR/server/srcds_run\" $SRCDS_RUN_ARGS" >> $DIR/server/start.sh
	chmod +x "$DIR/server/start.sh"
fi

$DIR/server/update.sh
$DIR/server/start.sh
