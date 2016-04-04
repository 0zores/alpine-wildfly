#!/bin/sh

if [ -z "$WILDFLY_MODE" ]; then
	export WILDFLY_MODE="standalone"
fi

if [ -z "$ADMIN_USER" ]; then
	export ADMIN_USER="admin"
fi

if [ -z "$ADMIN_PASS" ]; then
	export ADMIN_PASS="wildfly"
fi

export JBOSS_HOME=$WILDFLY_HOME

$WILDFLY_HOME/bin/add-user.sh $ADMIN_USER $ADMIN_PASS

case $WILDFLY_MODE in
	standalone)
		$WILDFLY_HOME/bin/standalone.sh -b 0.0.0.0 -bmanagement=0.0.0.0;;
	standalone-ha|standalone-full|standalone-full-ha)
		$WILDFLY_HOME/bin/standalone.sh -b 0.0.0.0 -bmanagement=0.0.0.0 -c $WILDFLY_MODE.xml;;
	*)
		echo "Invalid mode. Modes available: standalone|standalone-ha|standalone-full|standalone-full-ha"
		exit 1;;
esac