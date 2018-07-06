# Mommy-Dev

These are instructions for using your development environment for working on code. You have two choices - the Docker Image (1) or

Ubuntu development environment (2). For the first, the volume is not mounted to the host. For the second, you can't use jekyll

to preview the image.

# Option 1a: Docker

In the start menu type "powershell" to see the Command Line prompt.  Right click --> Run As Administrator to Open it.


Go to your mommy-dev folder

```bash
cd C:/Users/Natacha/Desktop/mommy-dev
```

Look at running containers, is mommy-dev running?

```bash
docker ps
```

Take a look to see that it does exist:

```bash
docker images
```
Just for your FYI (DON'T run this command) here is how I built the container, from the Dockerfile in the present working directory:


```bash
docker build -t vanessa/mommy-dev .
```

What we are going to do is start the container, with a named volume (that we will see and keep our data in).

```bash
docker run -it -v mommydata:/data vanessa/mommy-dev
```

This is a container that will hold your Github repository, and you can shell into it to get an ubuntu environment. We are using this over the windows subsystem because it isn't terribly slow.



# Option 1b: Ubuntu
This option will let you edit files and move them from the host easily, but is not recommended since you can't
use Jekyll to preview pages.


 - Go to the Start Menu
 - Type "Ubuntu" and select the orange application

Username: (ask vanessa)
Password: XXXXXXXXXXX (ask Vanessa)

The password to unlock the ssh key (if needed) is the same. This should only be needed if you restart the computer.



# 2. Navigate to your working directory
I've created for you a folder in your `$HOME` called Code where we will clone github repos, including your website. 

```bash
cd $HOME/Code
ls
```

We cloned it like this:

```bash
git clone git@github.com:vsoch/nsoch.github.io.git
cd nsoch.github.io
```

Let's go into the nsoch.github.io folder to see your site files:



```bssh
cd nsoch.github.io
ls
```

To open a file in the editor, you would type:

```bash
gedit project/neuromorphic.md
```

# 3. Get comfortable with Github
Whether you are in Docker or the ubuntu windows subsystem, you need to get comfortable with Github. When you first clone a repo, you will be on the master branch. That looks like this:

``bash
git branch
master
```

To checkout a NEW branch, you need `-b`

```bash
git checkout -b new-branch
```

To checkout an existing branch, no `-b`

```bash
git checkout master
git checkout newbranch
git checkout pancakes
```

# 3. Edit Files with Gedit
To open a file to edit with your text editor, you are going to:

 1. Start xming server (this is the display)
 2. export the display in ubuntu (so it finds xming)
 3. run the gedit command with correct permissions (sudo)

For step 1, this comes down to searching for Xming in the windows bar, and right clicking and selecting "Run as administrator." You should see the small X icon in the status bar in the lower right. Then in your ubuntu terminal, export the display like this:


```bash
export DISPLAY=0:0
```

When you say `export` this is how you define a variable in bash. You
could do this, for example:


```bash
# Define variable MYNAME, but we didn't export, so it's only for this shell
MYNAME=natacha

# Show that the variable is defined, "echo" is like saying "print"
echo "My name is $MYNAME"

# My name is natacha
# This would make the variable accesible to subshells (programs that you call)
export MYNAME
```

Now that the display is exported, you can use gedit to edit files. Here we are still sitting in the folder nsoch.github.io (do an ls if you ged lost, and cd to change directory) and we are using gedit to open a project markdown file:


```bash
sudo gedit -E projects/neuromorphic.md
```

We use sudo so that you have permissions to change settings (e.g., set the theme to cobalt if you want). The -E says to pass the user environment to the command, otherwise we wouldn't detect the display, which is exported as 0:0. This is why we started Xming server previously.

At this point, you can edit files as you please, and press Control+S to save.

# 4b. Add files to the repository (ubuntu)

This is extra work because we are using Ubuntu on Windows (normally you would just open a file browser, copy paste, etc.) but you basically need to find where Windows drives C and D are mounted on the Ubuntu instance. This location is:

```bash
# This is for ubuntu
/mnt
  /mnt/c  (--- C drive
  /mnt/d  (-- D drive
```

So we can copy files from here to your repo! To do this you follow
this general syntax:

```bash
cp <SOURCE> <DESTINATION>
```

So for example, here is how to copy some file from the user "Natacha" desktop to the assets image folder. Make sure to specify the correct subfolder when you copy (e.g., likely in projects/<project>.


```bash
# One file
cp /mnt/c/Users/Natacha/Desktop/myfile.txt assets/img/projects/

# Wildcard (multiple) files
cp /mnt/c/Users/Natacha/Desktop/*.png assets/img/projects/

# And then you might add it
git add assets/img/projects/<filename>
git add assets/img/projects/myfile.txt
git add assets/img/projects/*.png
```

You probably want to know what the * is. It's a wildcard. You can add "wildcads" for multiple files, here are some examples:



```bash
# add all png files in the folder "projects"
git add assets/img/projects/*.png

# add all files that start with "arty"
git add assets/img/projects/arty
```

# 4. Committing changes
When you are ready to "commit" your changes, which is saying "I am happy with my edits and added files, and I want to record them officially in my local repository (remember it's just a bunch of text files in the .git folder) then what I usually do first is to see what I've changed. You can do:

```bash
git status
```

and it will show you your changes. Take a look to see if you need to add any new files or folders - files and folders that are "untracked" won't be pushed to your remote repository. Once you've added all the files, then commit!

```bash
git commit -a -m "This is a message to describe my changes"
```

Once you have commit, then you are ready to push those changes to the remote repository. First, make sure you are on the right branch:

```bash
git branch
# new-branch
```

Then push to your remote, 

```bash
git push origin new-branch
```

If you forget what these things are, take a look at the git config file:

```bash
cat .git/config

```

Once you are done with that, when you are ready to "merge" the changes into the master branch, you want to:

 - Go to the web interface at https://www.github.com/nsoch/nsoch.github.io
 - Click "Open a Pull Request" if you don't see a notification about the recent branch.
 - Open the pull request, in the message write to me @vsoch so I am notified and I can review the changes.
 - When I take a look (and make sure it looks good) we can merge into your branch.

Also know that when you are working on an actual Linux box, these commands run a gazillion times faster. This is seriously slow as balls.
