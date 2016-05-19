## Jeff's Computer Configuration
Here's the set of files I need whenever I set up a brand new OS install.

* `bash_profile` - Some nice aliases and coloring for bash
* `bettertouchtool.config` - My keyboard shortcuts I use in BetterTouchTool. They are Win7-esque.
* `brewinstall.sh` - A nice starter pack of my must-have apps for OS X.

`sublime-text/` contains configuration files for both Sublime Text configuration and for packages
installed via [Package Control](https://packagecontrol.io/installation). I recommend making a
symbolic link to these from within Sublime's directory structure, typically something like:

```
~/Library/Application Support/Sublime Text 3/Packages/User
```

### Installing
Just run `. setup.sh` to automatically symlink the bash profile. Note that this script will not replace existing files; you have to remove them yourself first.

