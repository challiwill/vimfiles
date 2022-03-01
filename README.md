## Install
```
cd ~/
git clone git@github.com:challiwill/vimfiles.git
echo "source ~/.vimfiles/vimrc" >> ~/.vimrc
```
Then open vim and run `:PlugInstall`.


## Commands I use regularly

<Leader>	is ','

### Navigating Projects
gf 		open file under cursorin the same window
<c-w>f 		open in a new window
<c-w>gf		open in a new tab
gt		go to test/implementation file (depends on `.projections.json` file)
<ctrl>-p	fuzzy find file in same root directory
<Leader>e	open file from same directory as current file


###  Navigating Files
<space>		toggle fold
zM          fold all
zR          open all folds
zc          close fold
zo          open fold
za          toggle fold
zC          close folds to top level
zO          open folds to top level
zA          toggle folds to top level
<ctrl>-f	page down
<ctrl>-b	page up
gcc		comment/uncomment
