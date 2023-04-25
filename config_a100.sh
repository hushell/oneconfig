#conda create --name $1 -y python=3.10
#conda activate $1
#python -m pip install --upgrade pip

# torch
pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117

# pip
pip install tqdm jupyter jupyterlab matplotlib pandas cmake
pip install numpy Cython dotmap gym h5py blosc opencv-python opencv-python-headless
pip install --upgrade 'jedi<0.18.0'

