## Jeff's Computer Configuration
Here's the set of files I need whenever I set up a brand new OS install.

* `bash_profile` - Some nice aliases and coloring for bash
* `bettertouchtool.config` - My keyboard shortcuts I use in BetterTouchTool. They are Win7-esque.
* `brewinstall.sh` - A nice starter pack of my must-have apps for OS X.
* `sublime-text/` contains configuration files for both Sublime Text configuration and for packages installed via [Package Control](https://packagecontrol.io/installation).
* `.editorconfig` - The basic editorconfig file I like to use in new projects. Run the alias `genec` to copy it to the current directory.

### Setup Instructions

#### Bash Profile

Just run `./setup.sh` to automatically symlink the bash profile. Note that this script will not replace existing files; you have to remove them yourself first.

#### Install Software

    ./brewinstall.sh

#### Non-Brew Software

- [Clusterverse](https://itunes.apple.com/us/app/clusterverse/id1462237022?mt=12)

#### Sublime Text 3

1. Run Sublime Text 3
2. [Install Package Control](https://packagecontrol.io/installation)
3. Run `./config-setup.sh` and restart Sublime Text 3 a few times. Ignore the error messages.

#### Atom

1. Run Atom for the first time to create its directory structure
2. Close Atom
3. Run (or rerun) `./setup.sh`

#### BetterTouchTool

1. Run `./brewinstall.sh` to install BetterTouchTool if you haven't already
2. Open it and purchase/import your license
3. Go to Preferences and find the `Import` button. Import `bettertouchtool.config`.
