# About

zpm is a zero-configuration package manager. Use it to install any directory as a package on your system.
zpm is designed for excellent isolation and conflict avoidance. zpm is just a shell script that uses
well-known posix commands to work. Anything that zpm does you can do/undo using commands available
on your system.

# Installing

zpm can install itself:

    $ cd zpm
    $ ./zpm install zpm

Boom.

# Usage

zpm has only three commands - install, list and hints. Packages are installed to ~/.zpm
and symlinks are created in ~/bin.


## zpm install

zpm uses the current directory to install a package. The name of the directory is used as
the name of the package. The only explicit thing zpm needs is the desired exectuable to 
run. The executable name will also be the name of the symlink created in ~/bin.

## zpm list 

The list command simply lists the contents of the ~/.zpm directory.

## zpm hints

Hints are the only attempt at configuration that zpm provides. Including a .zpm file
in your project will cause any shell variables defined there to be visible to zpm.

the hints command outputs the result of processing any .zpm file along with
information where zpm plans on installing things. It's a good sanity check to run
`zpm hints' before running `zpm install'.

### supported hints:

version - sets a version number, if no version zpm will use epoch timestamp
bin - name of the bin entrypoint of the package, and also symlink name
name - name of the project, used as installation folder under ~/.zpm
desc - human readable description of the package. Not used by zpm currently


# Philosophy

zpm is an experiment in un-package management. The goal is to enable deployment of 
experimental code during development. Instead of linking directly to the working directory
zpm enables you to push a snapshot of the directory to a well-known location and maintain
symlinks easily.

# Future work

In keeping with the goal of absolute simplicity, I want zpm to do as little as possible.
I think that creating tarballs or git based distribution points could be considered, 
but most other functions (eg removing) should be trivial to do with `rm'. If it's not
completely obvious how to remove a package by simply deleting it, zpm has failed.

# changelog
- added initial hint support
