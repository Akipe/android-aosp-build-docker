FROM docker.io/library/archlinux:base-devel

LABEL org.opencontainers.image.title="Android AOSP build image"
LABEL org.opencontainers.image.description="Android AOSP container for build system"
LABEL org.opencontainers.image.url=https://github.com/Akipe/android-aosp-build-docker
LABEL org.opencontainers.image.authors="Julien Milletre Akipe <code.julien@milletre.fr>"
LABEL org.opencontainers.image.licenses=MIT
# LABEL org.opencontainers.image.created=$BUILD_DATE
LABEL org.opencontainers.image.source=https://github.com/Akipe/android-aosp-build-docker
# LABEL org.opencontainers.image.version=archlinux-$BUILD_DATE
# LABEL org.opencontainers.image.revision=$BUILD_SOURCE_CONTROL_REVISION

ENV \
    # user
    UID=1000 \
    GID=1000 \
    # ccache specifics
    CCACHE_SIZE=50G \
    CCACHE_DIR=/android/ccache \
    USE_CCACHE=1 \
    CCACHE_COMPRESS=1 \
    # java
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk \
    ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G" \
    # other
    LC_ALL=C

# Init Archlinux

# Enable Multilib repository
#RUN sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
#RUN sed -i 's/[community]/[community]\\nInclude = /etc/pacman.d/mirrorlist\\n[multilib]"/g' /etc/pacman.conf \
#RUN echo "[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" > /etc/pacman.conf
COPY ./assets/pacman.conf /etc/pacman.conf

RUN cat /etc/pacman.conf

# Install packages
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
        jdk8-openjdk \
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
        sudo \
        ttf-dejavu \
        unzip \
        vim \
        zip \
        zlib

# Create user

RUN groupadd --gid $GID --force build \
    && useradd --gid $GID --uid $UID --non-unique build \
    && mkdir /home/build \
    && chown -R build:build /home/build \
    && echo "build ALL=NOPASSWD: ALL" > /etc/sudoers.d/build

# AUR

# Use all possible cores for subsequent package builds &&
#   don't compress the packages built here
RUN sed -i 's,#MAKEFLAGS="-j2",MAKEFLAGS="-j$(nproc)",g' /etc/makepkg.conf
    #&& sed -i "s,PKGEXT='.pkg.tar.xz',PKGEXT='.pkg.tar',g" /etc/makepkg.conf

USER build

# Install yay
RUN git clone https://aur.archlinux.org/yay.git /tmp/yay \
    && (cd /tmp/yay && makepkg) \
    && sudo pacman -U /tmp/yay/*.pkg.tar.zst --noprogressbar --noconfirm \
    && rm -rf /tmp/yay

# Android build tools

# Install dependecies for building Android
RUN yay -S --noprogressbar --needed --noconfirm \
        lib32-ncurses5-compat-libs \
        ncurses5-compat-libs \
        xml2 \
        aosp-devel \
        lineageos-devel

# Create working directory
RUN sudo mkdir /android \
    && sudo chown -R build:build /android

WORKDIR /android

# Configure Python version
#RUN sudo ln -s /usr/bin/python2 /usr/bin/python \
#    && virtualenv2 --system-site-packages venv \
#    && ln -s /usr/lib/python2.7/* /android/venv/lib/python2.7/ \
#    && source venv/bin/activate

RUN sudo archlinux-java set java-8-openjdk

COPY ./assets/entrypoint.sh /

RUN sudo chmod +x /entrypoint.sh \
    && sudo chown -R build:build /entrypoint.sh

CMD /entrypoint.sh
