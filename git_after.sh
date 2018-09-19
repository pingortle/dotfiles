#!bash

git config --global core.excludesfile ~/.gitignore_global
git config --global init.templatedir '~/.git_template'
git config --global alias.ctags '!.git/hooks/ctags'
git config --global alias.commit-date '!git commit -m "$(date \'+%Y-%m-%d\')"'

