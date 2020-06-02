# Download and install a binary.
#
# Arguments:
#     - Name of binary ("consul")
#     - URL of zipfile ("https://example.com/consul.zip")
#
install_zip()
{
    NAME="$1"
    DOWNLOAD_URL="$2"

    curl -L -o ~/$NAME.zip $DOWNLOAD_URL
    sudo unzip -d /usr/local/bin/ ~/$NAME.zip
    sudo chmod +x /usr/local/bin/$NAME
    rm ~/$NAME.zip
}

install_zip "terraform" "https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip"

# localstack
curl -L https://raw.githubusercontent.com/localstack/localstack/master/docker-compose.yml -o docker-compose.yml
docker-compose up -d
rm -f docker-compose.yml

# install awscli-plugin-endpoint
pip install awscli-plugin-endpoint

# main
mkdir -p ~/.aws
mkdir -p ~/terraform-aws-demo
cd ~/terraform-aws-demo

cp /var/tmp/main.tf ~/terraform-aws-demo/main.tf

echo "done" >> /opt/.backgroundfinished

