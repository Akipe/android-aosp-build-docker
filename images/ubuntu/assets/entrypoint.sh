#!/bin/sh

# Set correct user settings
sudo usermod --uid $UID --gid $GID $USERNAME
sudo groupmod --gid $GID $USERNAME

sudo chown -R $USERNAME:$GID \
	/home/$USERNAME \
	${CCACHE_DIR} \
	/commandhistory \
	/entrypoint.sh \
	/workspace

# Set git configuration
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_MAIL"

# Initialize ccache if needed
if [ "$USE_CCACHE" = 1 -a  ! -f ${CCACHE_DIR}/ccache.conf ]; then
	echo "Initializing ccache in /build/ccache..."
	ccache -M "$CCACHE_SIZE" 2>&1
fi

tail -f /dev/null
