# Исходный образ, он будет использован как основа
FROM ubuntu
# Необязательная строка с указанием автора образа
MAINTAINER Sergey <sergeygr@ml1000.net>

ENV USERNAME user

RUN useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod -aG sudo $USERNAME && \
        mkdir /etc/sudoers.d && \
        echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
        chmod 0440 /etc/sudoers.d/$USERNAME && \
        # Replace 1000 with your user/group id
        usermod  --uid 1000 $USERNAME && \
        groupmod --gid 1000 $USERNAME

# RUN выполняет идущую за ней команду в контексте нашего образа.
# В данном случае мы установим некоторые зависимости и модули PHP.
# Для установки модулей используем команду docker-php-ext-install.
# На каждый RUN создается новый слой в образе, поэтому рекомендуется объединять команды.
# Обязательно устанавливать make autoconf automake libtool autotools-dev dpkg-dev fakeroot
# Иначе не обновляется yarn
RUN apt-get update && apt-get install -y curl apt-utils make autoconf automake libtool autotools-dev dpkg-dev fakeroot \
   && apt-get update && apt-get install -y wget gnupg \
   && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
   && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
   && apt-get update \
   && apt-get install -y git nodejs ssh openssh-server openssh-client \
   && apt-get update && apt-get install -y yarn libpng-dev


