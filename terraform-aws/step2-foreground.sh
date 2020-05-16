echo "Waiting to complete"; while [ ! -f /opt/.backgroundfinished2 ] ; do sleep 2; done; echo "Done"
