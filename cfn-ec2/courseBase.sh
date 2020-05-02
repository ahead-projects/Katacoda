# Download and install a binary.
#
# Arguments:
#     - Name of binary ("consul")
#     - URL of zipfile ("https://example.com/consul.zip")
#

# localstack
curl -L https://raw.githubusercontent.com/localstack/localstack/master/docker-compose.yml -o docker-compose.yml
docker-compose up -d
rm -f docker-compose.yml

# install awscli-plugin-endpoint
pip install awscli-plugin-endpoint

# main
mkdir -p ~/.aws
