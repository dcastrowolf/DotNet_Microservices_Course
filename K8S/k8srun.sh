#!/bin/bash
start(){
	kubectl apply -f ./mssql-plat-depl.yaml
	wait
	kubectl apply -f ./rabbitmq-depl.yaml
	wait
	kubectl apply -f ./platforms-depl.yaml
	wait
	kubectl apply -f ./commands-depl.yaml
	wait
	kubectl apply -f ./ingress-srv.yaml
	wait
}

stop() {
	kubectl delete -f ./platforms-depl.yaml
	wait
	kubectl delete -f ./commands-depl.yaml
	wait
	kubectl delete -f ./mssql-plat-depl.yaml
	wait
	kubectl delete -f ./rabbitmq-depl.yaml
	wait
	kubectl delete -f ./ingress-srv.yaml
	wait
}

iingress(){
	kubectl apply -f "https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.0/deploy/static/provider/cloud/deploy.yaml"
}

singress(){
	kubectl delete -f "https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.0/deploy/static/provider/cloud/deploy.yaml"
}

$1
