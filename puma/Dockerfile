FROM nginx/unit:1.26.1-ruby3.0

RUN apt update && apt-get install -qq -y --no-install-recommends \
    build-essential patch libpq-dev gnupg2 wget lsb-release git ssh ruby-dev zlib1g-dev liblzma-dev cmake pkg-config \
    automake libtool libffi-dev libssl-dev libgmp-dev python-dev

RUN gem install bundler
WORKDIR /app
COPY ./app/Gemfile .
RUN bundle install -j 10
COPY ./app /app

RUN chown -R unit:unit /app

