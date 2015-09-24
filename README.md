Kubernetes config files to spin ONOS cluster for CORD

##Steps To Start ONOS Cluster

- Start Kubernetes master and services: `make start`
- Check if the pods and nodes are available `make p` and `make n`
- Once Kubernetes master pod is `Running`, start onos cluster (default:3) : `make onosrc`
- Check the number of ONOS instances: `make rc`
- Check to make sure all ONOS instances are `Running`: `make p`
- Get ONOS instances' IP: `make onosip`
- (Optionally) Check ONOS GUI `http://<ONOS_POD_IP>:8181/onos/ui/index.html`
- Form the cluster: `make cluster`
- (Scale UP/Down) Scale number of ONOS instances: `make scale COUNT=4`
  `y` to put them in a cluster
- if clustering doesn't work after scaling then most likely new ONOS instance is not ready, wait for a minute and then run `make cluster`

- To delete ONOS instances: `make delonosrc`
- To stop Kubernetes: `make stop`
- To clean up all the containers: `make clean`

- For more commands, see `Makefile` 