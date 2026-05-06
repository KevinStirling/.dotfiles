# My dotfiles

Intended to use with `stow`. Main branch is a common branch, other branches are either backups or cater to certain needs on specific machines (work, personal, mac/linux, etc.)

## Usage 
Each directory in the root of this repo represents a package. The folder structure mimics that of the home directory. 

To use a specific packages config machine, run this from the repository root
```
stow {package name}
```

This will create a symlink in `$HOME/{package path}` pointing to the package in this repo.
