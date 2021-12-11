FROM php:7.0-fpm

# 拷贝需要用到的资源
COPY resource /var/resource

# APT 自动安装 PHP 相关的依赖包,如需其他依赖包在此添加
RUN apt-get update \
  && apt-get install -y \
  libcurl4-openssl-dev pkg-config libssl-dev \
  libmcrypt-dev \
  libz-dev \
  libzip-dev\
  git \
  wget \
  libpcre3-dev \
  libjpeg62-turbo-dev\
  libfreetype6-dev \
  libpng-dev\
  vim \
  libmhash-dev \
  libfontconfig1 libxrender1 \
  openssl \
  busybox \
  sudo \
  htop

RUN docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-freetype-dir=/usr/include/freetype2 \
        --with-png-dir=/usr/include \
        --with-jpeg-dir=/usr/include

# 官方 PHP 镜像内置命令，安装 PHP 依赖
RUN docker-php-ext-install \
  # mcrypt \
  pdo_mysql \
  zip \
  fileinfo \
  json \
  exif \
  iconv \
  gd \
  bcmath \
  opcache \
  sockets \
  # Clean apt install cache
  # && apt-get clean \
  # && apt-get autoclean \
  && rm -rf /tmp/* /var/tmp/* 

# Install PHP Composer
RUN mv /var/resource/composer.phar /usr/local/bin/composer \
  && chmod 755 /usr/local/bin/composer \
  && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer
#   && composer global require hirak/prestissimo
