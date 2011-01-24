!SLIDE
# INSTALL RUBY!

 * We are going to use [RVM](http://rvm.beginrescueend.com/).
 * Why? (Easy, fast)

!SLIDE commandline
$ bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )

Initialized empty Git repository in /home/nwelch/.rvm/src/rvm/.git/  

remote: Counting objects: 16929, done.  
remote: Compressing objects: 100% (4822/4822), done.  
remote: Total 16929 (delta 11407), reused 15835 (delta 10649)  
Receiving objects: 100% (16929/16929), 2.97 MiB | 1462 KiB/s, done.  
Resolving deltas: 100% (11407/11407), done.  
Checking out files: 100% (303/303), done.  

RVM:  Shell scripts enabling management of multiple ruby environments.  
RTFM: http://rvm.beginrescueend.com/  
HELP: http://webchat.freenode.net/?channels=rvm (#rvm on irc.freenode.net)  

!SLIDE
# Add to .bashrc or .bash_profile
## At very bottom

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

