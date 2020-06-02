#!/bin/bash

echo "Waiting to complete, normally it takes about 1 minute"; while [ ! -f /opt/.backgroundfinished ] ; do echo -n '.'; sleep 2; done; echo "Done"

cd ~/terraform-aws-demo
