# Docker Command

## Docker Image
- build a image from docker-file and add tag
  ```
  docker build -f broker-service.dockerfile -t techarm/broker-service:1.0.0 .
  ```

- push image to dockerhub
  ```
  docker psuh techarm/broker-service:1.0.0
  ```

## Docker Swarm
### Docker Swarm Setup
- initialize swarm
    ```
    docker swarm init
    ```

- join current node to swarm cluster
    ```
    # As a worker
    docker swarm join-token worker
    
    # As a manager
    docker swarm join-token manager
    ```

- leave swarm
    ```
    docke swarm leave
    ```

### Docker Swarm Stack
- deploy
    ```
    docker stack deploy -c swarm.yml myapp
    ```

- remove
    ```
    docker stack rm myapp
    ```

### Docker Swarm Service
- list service
    ```
    docker service ls
    ```

- scale service
    ```
    docker service scale myapp_listener-service=3
    ```

- update service (v1.0.0 -> v1.0.1)
    ```
    docker service update --image techarm/logger-service:1.0.1 myapp_log-service
    ```

- stop service
    ```
    docker service scale myapp_broker-service=0
    ```

### Kubernetes
- installing minikube
    To install the latest minikube stable release on x86-64 macOS using binary download:
    ```
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
    sudo install minikube-darwin-amd64 /usr/local/bin/minikube
    ```
    ※ https://minikube.sigs.k8s.io/docs/start/

- installing kebectl
    ```
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/arm64/kubectl"
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    sudo chown root: /usr/local/bin/kubectl
    kubectl version --client
    ```

- installing a cluster
    ```
    minikube start --nodes=2
    ```

- minikube commands
    ```
    minikube status
    minikube start
    minikube stop
    minikube dashboard
    ```

- kubectl commands
    ```
    kubectl get pods -A  # show all pods
    kubectl get pods
    kubectl get svc
    kubectl get deployments

    kubectl apply -f k8s/rabbit.yml
    kubectl delete deployments rabbitmq
    kubectl delete svc rabbitmq
    ```