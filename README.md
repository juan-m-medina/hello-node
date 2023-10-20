# Description
Small sample dockerized nodejs project that uses a token for an authenticated registry.

## How to build

```shell
docker build . --tag hello-node --build-arg npm_token=${NPM_TOKEN}
```

## How to run and dispose immediately

```shell
docker run --rm hello-node
```

## How to deploy on Kubernetes

- Make sure you have built your project. See [How to build](#how-to-build).
- Have `kubectl` `cli` installed. See https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
- Make sure you have your `Docker Desktop` configured to run Kubernetes. See https://docs.docker.com/desktop/kubernetes/#turn-on-kubernetes
- Switch your context to the docker desktop context:
    ```shell
    kubectl config use-context docker-desktop    
    ```
- Deploy the cluster   
    ```shell
    kubectl apply -f deployment.yml
    ```
- Deploy the service
    ```shell
    kubectl create -f service.yml
    ```
    After this point you can check your pods by running
    ```shell
    kubectl get pods
    ```
- Run a test
    ```shell
    curl --request GET --url http://localhost:300
    ```
    alternatively, you can also try a bigger check using `apache benchmark`:
    ```shell
    ab -k -c 2 -v 2 -n 1000 localhost:3000/
    ```
- Test deployment scaling 
    ```shell
    kubectl scale deployment hello-node --replicas=10
    ````
    