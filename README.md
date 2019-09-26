# wcp
wcp is a GNU Wget front-end for website archiving. It's main purpopose is to act as a reliable command-line interface for mirroring a wide variety of websites. It should be as intuitive as the cp and scp commands. It is free, open-source, use it everywhere, I do not care.
## Installation
Just download the wcp file and store it inside your /usr/local/bin directory.
For the command-line copiers:
```
$ git clone https://github.com/Sleet37/wcp.git wcp
$ cp wcp/wcp /usr/local/bin
```
You can store it wherever you want, but, for convenience, I prefer to just have to type wcp to call the command instead.
## Syntax
```
wcp [OPTIONS]... URL DESTINATION
```
## Current features
Since wcp is just a shell script at the moment, it has limited functionalities for now, but it should work for most websites. __Notice that websites that depend on JavaScript will usually fail to be archived in its entirety.__
##### -w<seconds>
Tells wcp to wait <seconds> seconds before requesting a new request.
##### -nd
No directories flag. Only use this flag if you know what you're doing, otherwise you might end up with a broken website.
##### -x
Force directories flag. Same warning as above.
##### -h
Shows help.
##### -R
Creates a reject list. It opens up your default $EDITOR. If you don't have one, it'll open with ```vi```.
##### -X
Excludes directories to download. (Extremely broken).
##### -P
Changes the DESTINATION directory. It is reduntant with the current syntax and will add an additional directory for nothing.
##### --user-agent=""
Changes your user agent. Doesn't behave well with spaces right now.
##### --one-page
Archives a single page from a website.
##### --windows
Use this if you want to view your files in a Windows system. (WSL users should also use this, if they want to see the website properly on a Windows).
