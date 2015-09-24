start:
	docker-compose up -d

stop:
	docker-compose stop

clean:
	docker-compose rm
	docker ps -a | awk '{print $1}' | xargs docker kill

p:
	kubectl get pods

n:
	kubectl get nodes

rc:
	kubectl get rc

srv:
	kubectl get services

ps:
	docker ps

onosrc:
	kubectl create -f onos-rc.yaml

onosip:
	kubectl describe pod onos | grep IP | sed -E 's/IP:[[:space:]]+//'

delonosrc:
	kubectl delete -f onos-rc.yaml

onossrv:
	kubectl create -f onos-service.yaml

delonossrv:
	kubectl delete -f onos-service.yaml

mininet:
	kubectl create -f leaf-spine-fabric-rc.yaml

delmininetrc:
	kubectl delete -f leaf-spine-fabric-rc.yaml

cluster:
	./onos-form-cluster -u karaf -p karaf `kubectl describe pod onos | grep IP | sed -E 's/IP:[[:space:]]+//' | awk '{print $1}' ORS=' '`

scale:
	kubectl scale rc onos --replicas=$(COUNT)
	@while [ -z "$$CONTINUE" ]; do \
        read -r -p "Update the ONOS cluster? [y/N]: " CONTINUE; \
    done ; \
    [ $$CONTINUE = "y" ] || [ $$CONTINUE = "Y" ] || (echo "Exiting."; exit 1;)
	./onos-form-cluster -u karaf -p karaf `kubectl describe pod onos | grep IP | sed -E 's/IP:[[:space:]]+//' | awk '{print $1}' ORS=' '`
