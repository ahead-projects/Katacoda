#!/bin/bash

echo "Waiting to complete"; while [ ! -f /opt/.backgroundfinished ] ; do echo -n '.'; sleep 2; done; echo "Done"

cd ~/terraform-aws-demo
