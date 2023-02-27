FROM debian:bullseye

RUN apt-get update \
    && apt-get install ruby-full build-essential -y \
    && gem install jekyll bundler \
    && jekyll new ./alpersad \
    && cd alpersad \
    && bundle add webrick

WORKDIR /alpersad

EXPOSE 4000 35729

ENTRYPOINT [ "bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload" ]