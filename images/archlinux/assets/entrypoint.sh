#!/bin/sh

trap "exit" TERM

# Set correct user settings
sudo usermod --uid $UID --gid $GID $USERNAME
sudo groupmod --gid $GID $USERNAME

sudo chown -R $USERNAME:$GID \
	/home/$USERNAME \
	${CCACHE_DIR} \
	/commandhistory \
	/entrypoint.sh \
	/workspace

# Use all possible cores for subsequent package builds
sudo sed -i 's,#MAKEFLAGS="-j2",MAKEFLAGS="-j$(nproc)",g' /etc/makepkg.conf

# Set git configuration
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_MAIL"

# Initialize ccache if needed
if [ "$USE_CCACHE" = 1 -a  ! -f ${CCACHE_DIR}/ccache.conf ]; then
	echo "Initializing ccache in /build/ccache..."
	ccache -M "$CCACHE_SIZE" 2>&1
fi

# in Docker, the USER variable is unset by default
# but some programs (like jack toolchain) rely on it
export USER="$(whoami)"

while true
do
    echo "Hi, I'm bash !"
    sleep 1
done
