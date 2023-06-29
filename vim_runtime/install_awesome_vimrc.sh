rm -rf $HOME/.vim_runtime
cp -R . $HOME/.vim_runtime
mkdir -p $HOME/.vim_runtime/temp_dirs
cd $HOME/.vim_runtime

echo "Installing vimrcs"

echo 'set runtimepath+=$HOME/.vim_runtime

source $HOME/.vim_runtime/vimrcs/basic.vim
source $HOME/.vim_runtime/vimrcs/filetypes.vim
source $HOME/.vim_runtime/vimrcs/plugins_config.vim

try
source $HOME/.vim_runtime/my_configs.vim
catch
endtry' > $HOME/.vimrc

#echo "Installing YouCompleteMe"
#
#cd bundle
#git clone https://github.com/ycm-core/YouCompleteMe.git
