FROM ruby:3.2

WORKDIR /srv/jekyll/blog-tech

RUN gem install bundler -v 2.5.23
COPY blog-tech/Gemfile blog-tech/Gemfile.lock* ./
RUN bundle install

COPY _config.yml ./_config.yml
COPY blog-tech/ ./

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000", "--watch", "--force_polling"]
