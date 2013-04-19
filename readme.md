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

zpm has only three commands - install, remove and list. Packages are installed to ~/.zpm
and symlinks are created in ~/bin.


## zpm install

zpm uses the current directory to install a package. The name of the directory is used as
the name of the package. The only explicit thing zpm needs is the desired exectuable to 
run. The executable name will also be the name of the symlink created in ~/bin.

## zpm remove 

The remove command removes the package folder from ~/.zpm and removes the symlink
from ~/bin. Since zpm doesn't know the name of the symlink via configuration, the 
name must be given on the command line. zpm should get smarter about this in the future.

## zpm list 

The list command simply lists the contents of the ~/.zpm directory.

# Philosophy

zpm is an experiment in un-package management. The goal is to enable deployment of 
experimental code during development. Instead of linking directly to the working directory
zpm enables you to push a snapshot of the directory to a well-known location and maintain
symlinks easily.

# Future work

I intend to allow optional configuration 'hints' to control the operation of zpm. 
Since these hints will be extremely simple and completely optional, in keeping
with the goal of absolute simplicity.

