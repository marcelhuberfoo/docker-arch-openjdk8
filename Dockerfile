FROM marcelhuberfoo/arch
MAINTAINER Marcel Huber <marcelhuberfoo@gmail.com>

USER root

RUN echo -e '[infinality-bundle]\nServer = http://bohoomil.com/repo/$arch\n[infinality-bundle-fonts]\nServer = http://bohoomil.com/repo/fonts' >> /etc/pacman.conf
RUN pacman-key --recv-keys 962DDE58 && pacman-key --lsign-key 962DDE58
RUN pacman -Syy --noconfirm jre8-openjdk-headless java-rhino jdk8-openjdk p7zip \
    fontconfig-infinality-ultimate ibfonts-meta-base && \ 
    printf "y\\ny\\n" | pacman -Scc
RUN sed -ri -e '/infinality-bundle/,$ {d}' /etc/pacman.conf

# Add support for extra strength cryptographic ciphers
RUN curl -L --cookie "oraclelicense=accept-securebackup-cookie;" http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip -O && 7z e -y -o/usr/lib/jvm/$(archlinux-java get)/jre/lib/security /jce_policy-8.zip

