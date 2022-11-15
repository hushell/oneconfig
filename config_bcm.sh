# Ubuntu OS Requirements
sudo apt-get -y update && sudo apt-get -y upgrade

# Install some basic utilities
sudo apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6

# System packages
sudo apt-get update && sudo apt-get install -y \
    build-essential pkg-config cmake gcc g++ ctags \
    software-properties-common python3-dev \
    libopenmpi-dev openmpi-bin \
    ssh vim screen htop wget tree \
    git-core bash-completion unzip \
    libjpeg-dev libpng-dev libsndfile1 \
    freeglut3-dev libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev

sudo add-apt-repository -y ppa:jonathonf/vim
sudo apt-get -y update
sudo apt-get -y install vim

# Cleaning
apt-get autoremove -y && \
apt-get clean && \
rm -rf /root/.cache && \
rm -rf /var/lib/apt/lists/*

# Install Miniconda 4.12 and Python 3.9
#curl -sLo ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh \
# && bash ~/miniconda.sh -b -p $HOME/miniconda
. ~/miniconda/etc/profile.d/conda.sh
conda activate base
conda init

# Install Pytorch with CUDA 11.3, and Vim 9
conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch
conda clean -ya

# pip
pip install tqdm jupyter jupyterlab matplotlib pandas cmake
pip install numpy Cython dotmap gym h5py blosc opencv-python opencv-python-headless
pip install --upgrade 'jedi<0.18.0'

# git related
echo "source /usr/share/bash-completion/completions/git" >> ~/.bashrc
cp gitconfig ~/.gitconfig

# bash stuffs
echo "source ~/.bashrc" >> ~/.bash_profile
echo "export CONDA_AUTO_UPDATE_CONDA=false" >> ~/.bash_profile
echo "defshell -bash" > ~/.screenrc

# bash aliases (ref: https://opensource.com/article/19/7/bash-aliases)
echo "alias screen='screen -U'" >> ~/.bashrc
echo "alias vi='vim'" >> ~/.bashrc
echo "alias ls='ls -F'" >> ~/.bashrc
echo "alias ll='ls -lth'" >> ~/.bashrc
echo "alias lt='ls --human-readable --size -1 -S --classify'" >> ~/.bashrc
echo "alias lm='ls -lt -1'" >> ~/.bashrc
echo "alias histg='history|grep'" >> ~/.bashrc
echo "alias cpv='rsync -ah --info=progress2'" >> ~/.bashrc
echo "alias delete='mv --force -t ~/.local/share/Trash'" >> ~/.bashrc
echo "alias condaa='conda activate'" >> ~/.bashrc
echo "alias condad='conda deactivate'" >> ~/.bashrc

