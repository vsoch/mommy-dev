# Mommy-Dev

These are instructions for using your development environment for working on code. 

 1. First open Git by double clicking on the desktop icon
 2. From the start menu type in "cmd" to get a command prompt, then right click "Run as Administrator"

In the second, you can run powershell, and go to the location of your Github repo:

```bash
powershell
cd /Users/Natacha/Desktop/mommy-dev
```

Then run jekyll to serve the website. That's it. You can leave that window and go to [http://localhost:4000](http://localhost:4000) to see the preview.

 - The git window is where you run commit / push commands
 - The cmd (powershell) you can leave the server running
 - The web browser can stay open and will update automatically.


# 2. Navigate to your working directory
I've created for you a folder in your `$HOME` called Code where we will clone github repos, including your website. 

```bash
# in git window, start by running from Desktop
cd /Users/Natacha/Desktop/mommy-dev
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

To open a file in the editor, the easiest thing to do is to right click the gedit icon in your start
menu, then open the file.


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

# 4. Add files to the repository (ubuntu)

You can just copy paste the actual files into the folders on your Desktop. Then use `git add <path>` to add. Examples are below. To do this you follow
this general syntax:

```bash
cp <SOURCE> <DESTINATION>
```

So for example, here is how to copy some file from the user "Natacha" desktop to the assets image folder. Make sure to specify the correct subfolder when you copy (e.g., likely in projects/<project>.


```bash
# One file
cp /Users/Natacha/Desktop/myfile.txt assets/img/projects/

# Wildcard (multiple) files
cp /Users/Natacha/Desktop/*.png assets/img/projects/

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
