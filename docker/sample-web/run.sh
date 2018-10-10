#!/bin/bash

set -vx

if [ "$BOOTSTRAP" == true ]; then
  bundle exec rake db:create --trace
  bundle exec rake db:migrate --trace
fi

bundle install
bundle exec rake db:migrate --trace

rm -f tmp/pids/server.pid

bundle exec rails s -p 7000 -b '0.0.0.0'
