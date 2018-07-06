FROM ubuntu

# docker build -t vanessa/mommy-dev .

RUN apt-get update && apt-get install -y git

RUN apt-get install -y git-core  \
    zlib1g-dev \
    build-essential \
    libssl-dev \
    libreadline-dev \
    libyaml-dev \
    libsqlite3-dev  \
    sqlite3  \
    libxml2-dev \
    libxslt1-dev \
    libcurl4-openssl-dev \
    software-properties-common \
    libffi-dev \
    libssl-dev  \
    libreadline-dev \
    zlib1g-dev \
    curl \
    wget \
    vim

RUN mkdir /code
ADD . /code

ENV PATH "$HOME/.rbenv/bin:$PATH"

# Ruby
RUN cd && \
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc

ENV PATH "$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build && \
    echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc 

# Open ssl
RUN cd /tmp && \
    curl -LO https://www.openssl.org/source/openssl-1.1.0f.tar.gz && \
    tar xvfz openssl-1.1.0f.tar.gz && \
    cd openssl-1.1.0f && \
    ./config --prefix=/opt/openssl/1.1.0f && \
    make && make install && \
    wget -O /opt/openssl/1.1.0f/ssl/cert.pem http://curl.haxx.se/ca/cacert.pem

RUN CONFIGURE_OPTS="--with-openssl-dir=/opt/openssl/1.1.0f" rbenv install 2.4.2
RUN rbenv global 2.4.2
RUN gem install bundler && \
    rbenv rehash && \
    ruby -v

# Rails

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs && \
    gem install rails -v 4.2.6  && \
    rbenv rehash

# Jekyll

RUN gem install jekyll && \
    gem install github-pages  && \
    gem install bundler && \
    gem install jekyll-sass-converter && \
    rbenv rehash

# Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    apt-get update && \
    apt-get install -y google-chrome-stable
