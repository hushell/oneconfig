rm -rf ~/.vim_runtime
cp -R . ~/.vim_runtime
mkdir ~/.vim_runtime/temp_dirs
cd ~/.vim_runtime

echo "Installing vimrcs"

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installing YouCompleteMe"

cd bundle
git clone https://github.com/ycm-core/YouCompleteMe.git
