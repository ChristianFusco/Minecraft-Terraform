sudo apt install linuxbrew-wrapper

# deploys 

brew install terraform

# aws cli

curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
echo "export PATH=~/.local/bin:$PATH" >> ~/.profile
source ~/.profile

pip install awscli --upgrade --user
rm get-pip.py

aws configure

