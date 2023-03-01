#!/bin/sh

# https://github.com/stucki/docker-lineageos/blob/master/startup.sh
# https://github.com/stucki/docker-lineageos/blob/master/run.sh

# Initialize ccache if needed
if [ ! -f ${CCACHE_DIR}/ccache.conf ]; then
	echo "Initializing ccache in /build/ccache..."
	ccache -M ${CCACHE_SIZE}
fi

# in Docker, the USER variable is unset by default
# but some programs (like jack toolchain) rely on it
export USER="$(whoami)"

tail -f /dev/null
