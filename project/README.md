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
