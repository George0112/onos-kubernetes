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
