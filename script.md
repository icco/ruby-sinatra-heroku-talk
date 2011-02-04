# Programming Script

This is basically a list of commands and code that I will be writing. Feel free to bug me if you have no idea what I'm typing.

## Install stuff

If you didn't install stuff when we started, it's time now.

    $ bash < <( curl http://is.gd/k2wjrp )
    cat '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
    source ~/.bashrc
    rvm info
    rvm install 1.9.2
    rvm --default use 1.9.2
    rvm info
    gem install sinatra heroku

Alright we've got everything installed.

    mkdir test-project
    touch README.md
    git init
    git add README.md
    git commit -m "Initialize!"

Now we have a git repo.

    vim site.rb

Let's write a basic hello world with Sinatra.

    #!/bin/env ruby
    require 'sinatra'
    get '/hi' do
      "Hello World!"
    end

Alright, now let's deploy it locally.

    ./site.rb
    curl localhost:4567/hi

BAM. We have a website.

 * talk about templates.
 * talk about post
 * mention databases, but don't do (maybe sqlite/postgres...)
 * heroku init
 * heroku deploy
 * pimp github.

