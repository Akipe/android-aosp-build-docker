FROM docker.io/library/archlinux:base-devel

LABEL org.opencontainers.image.description="Android AOSP container for build system"
LABEL org.opencontainers.image.licenses=MIT

# user
ARG USERNAME=builder
ENV UID=1000
ENV GID=1000

# git
ENV GIT_USERNAME 'My Username'
ENV GIT_MAIL 'myemail@todefine.com'

# ccache specifics
ENV USE_CCACHE=1
ENV CCACHE_SIZE=50G
ENV CCACHE_DIR=/ccache
ENV CCACHE_COMPRESS=1
ENV CCACHE_EXEC /usr/bin/ccache

# for Android build process
ENV LC_ALL=C

# Enable Multilib repository
COPY ./assets/pacman.conf /etc/pacman.conf

# Install and upgrades packages
RUN pacman -Syyu --noprogressbar --noconfirm --needed \
        base-devel \
        bc \
        bison \
        ccache \
        curl \
        flex \
        gcc \
        gcc-multilib \
        git \
        gnupg \
        go \
        gperf \
        gradle \
        imagemagick \
        inetutils \
        lib32-gcc-libs \
        lib32-ncurses \
        lib32-readline \
        lib32-zlib \
        libxslt \
        lzop \
        maven \
        multilib-devel \
        ncurses \
        perl-switch \
        pngcrush \
        repo \
        rsync \
        schedtool \
        sdl \
        squashfs-tools \
        ttf-dejavu \
        unzip \
        vim \
        zip \
        zlib \
        python \
        python-pip \
        python-virtualenv \
        # for users
        sudo \
        wget \
        bash-completion \
        nano \
        vim \
        emacs \
    && pacman -Scc

# Create user
RUN groupadd --gid $GID --force $USERNAME \
    && useradd --uid $UID --gid $GID --non-unique --create-home $USERNAME \
    && echo "${USERNAME} ALL=NOPASSWD: ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 "/etc/sudoers.d/${USERNAME}"

ENV USER=$USERNAME
ENV HOME="/home/${USERNAME}"

# Configure package building
# Use all possible cores and don't compress the packages
RUN sed -i 's,#MAKEFLAGS="-j2",MAKEFLAGS="-j$(nproc)",g' /etc/makepkg.conf

USER $USERNAME

# Install yay for AUR packages
RUN git clone https://aur.archlinux.org/yay.git /tmp/yay \
    && (cd /tmp/yay && makepkg) \
    && sudo pacman -U /tmp/yay/*.pkg.tar.zst --noprogressbar --noconfirm \
    && rm -rf /tmp/yay

# Install AUR dependencies
RUN yay -Syy --noprogressbar --needed --noconfirm \
        lib32-ncurses5-compat-libs \
        ncurses5-compat-libs \
        xml2 \
        aosp-devel \
        lineageos-devel \
        wxgtk2-dev \
        python2 \
        # python2-pyopenssl \
        # python2-pip \
    && sudo pacman -Scc

USER root

# Create peristance bash history
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && mkdir /commandhistory \
    && touch /commandhistory/.bash_history \
    && chown -R ${USERNAME}:${GID} /commandhistory \
    && echo "$SNIPPET" >> "/home/${USERNAME}/.bashrc"

# Create ccache directory
RUN mkdir $CCACHE_DIR \
    && chown -R ${USERNAME}:${GID} $CCACHE_DIR

# Create the working directory
RUN mkdir /workspace \
    && chown -R ${USERNAME}:${GID} /workspace

WORKDIR /workspace

# Add possibility to switch different Python version
RUN mkdir /python \
    && cd /python \
    && virtualenv /python/2 --python=/usr/bin/python2 \
    && virtualenv /python/3 --python=/usr/bin/python3

# Set the entrypoint command
COPY ./assets/entrypoint.sh /

RUN chmod +x /entrypoint.sh \
    && chown -R ${USERNAME}:${GID} /entrypoint.sh

USER $USERNAME

# Install Oh My BASH
RUN bash \
    -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" \
    --unattended

ENTRYPOINT ["/entrypoint.sh"]
