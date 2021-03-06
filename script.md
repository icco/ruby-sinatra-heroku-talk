# Programming Script

This is basically a list of commands and code that I will be writing. Feel free to bug me if you have no idea what I'm typing.

## Install stuff

If you didn't install stuff when we started, it's time now. These first set of directions are for your own machine, if you are at Cal Poly, and are on a computer science lab machine, you can ssh into vogon and follow Mark's instructions to save you a compile.

    $ bash < <( curl --location http://is.gd/k2wjrp )
    echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
    source ~/.bashrc
    rvm info
    rvm install 1.9.2
    rvm --default use 1.9.2
    rvm info
    gem install sinatra heroku

If you are trying to do this on CSC lab machines, you may not have enough space.  Fortunately, my asshole of a roommate has precompiled it. so you can follow this instead.

    cd
    ln -s /home/mgius/.rvm .
    echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
    source ~/.bashrc

You cannot install new gems using this environment, but the heroku and sinatra gems have been pre-installed.

If you want to be able to install new gems, do the following (requires approx 100MB free space on your profile)

    cd $HOME
    cp -R /home/mgius/.rvm .
    echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
    source ~/.bashrc

Alright we've got everything installed.

    mkdir test-project
    touch README.md
    git init
    git add README.md
    git commit -m "Initialize."

Quick aside:

    echo '*swp' > .gitignore
    git add .gitignore
    git commit -m "Adding a git ignore file."

Now we have a git repo (that doesn't commit our vim swap files).

    vim site.rb

Let's write a basic hello world with Sinatra.

    #!/usr/bin/env ruby
    require 'sinatra'
    get '/hi' do
      "Hello World!"
    end

Alright, now let's deploy it locally.

    ./site.rb
    curl localhost:4567/hi

BAM. We have a website.

Alright. Now we want sexy webpages. Sinatra supports a few different templating engines, but we are going to use `erb`. [ERB](http://www.ruby-doc.org/stdlib/libdoc/erb/rdoc/classes/ERB.html) is built into the Ruby stdlib.

Let's open `site.rb` back up.

    #!/usr/bin/env ruby

    require 'sinatra'

    get '/' do
       erb :index
    end

The basic folder structure of a sinatra app is as follows.

    .
    |-- site.rb
    |-- config.ru
    |-- public
    |   `-- script.js
    `-- views
        `-- index.erb


Now let's open `views/index.erb`.

    <!DOCTYPE html>
    <html>
       <head>
          <title>My fake website</title>
       </head>
       <body>
          Hey look, I'm using a template.
       </body>
    </html>

Well that was fun. Now let's make a little form.

    <!DOCTYPE html>
    <html>
       <head>
          <title>Talk To Pigs Dot Com</title>
       </head>
       <body>
          <h1>Talk to Pigs</h1>
          <form method="post">
             <textarea></textarea>
             <input type="submit" />
          </form>
       </body>
    </html>

We need to now tell sinatra to deal with this form request.

    #!/usr/bin/env ruby

    require 'sinatra'

    get '/' do
       erb :index
    end

    # Translate what was posted into pig-latin
    post '/' do
       words = params[:awesome]

       vowels = %w{a e i o u}
       translated = words.gsub(/\w+/) {|word|
          # Periods, single letters
          if word.length <= 1 then
             word

          # Vowel rules according to wikipedia
          elsif vowels.include? word[0] then
             word + '-ay'

          # Normal words
          else
             word[1..word.length] + "-#{word[0]}ay"
          end
       }

       # Display the file views/done.erb with these variables.
       erb :done, :locals => {:words => words, :translated => translated}
    end

We will need to write up `views/done.rb` now.

    <!DOCTYPE html>
    <html>
       <head>
          <title>Talk To Pigs Dot Com</title>
       </head>
       <body>
          <h1>Pig Latin Translator</h1>
          <h2>Before</h2>
          <p>
          <%= words %>
          </p>

          <h2>After</h2>
          <p>
          <%= translated %>
          </p>

          <p><a href=".">Back...</a></p>
       </body>
    </html>

Wheee. Alright, let's run and test. (Yes there are some bugs...)

Cool, that works. Now, how do we get it on the internet? We use Heroku!

Heroku runs using [rack](http://rack.rubyforge.org/). To launch sinatra in rack, you need to put the following into `config.ru`.

    require 'site'
    run Sinatra::Application

Also, we need to tell Heroku that we need sinatra to be installed. To do this, we create a `.gems` file. This file tells Heroku what gems to install on boot.

    echo "sinatra" > .gems
    git add .gems
    git commit -m "Adding gems file."

We installed heroku earlier, so now we can just:

    heroku create --stack bamboo-mri-1.9.2 talktopigs-`whoami`

`--stack bamboo-mri-1.9.2` says that you want to use Ruby 1.9.2 on Heroku. The last paramater specifies the name of the app. You can leave this blank and heroku will come up with a name for you.

Hmm... That seemed pretty simple... Now you just push?

    git add .
    git commit -m "Huzzah! an App."
    git push heroku master

HOT SKIPPY! Notice your app is now running on the interwebs. You can read the [heroku docs](http://docs.heroku.com/) on how to change the app name on put on a special domain.

BUT WAIT! We want to share our code with the world. Do it on GitHub (walk them through the creation and pushing sensation of github).

Tah Dah. Questions?

### Other things we could talk about if you wanted:

 * GitHub and Git
 * DB access on Heroku
 * less (css easy mode)

