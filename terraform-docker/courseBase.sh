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

# main
mkdir -p ~/terraform-docker-demo
cd ~/terraform-docker-demo
