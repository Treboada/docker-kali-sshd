# kali-sshd

[![Build and Push Docker Image](https://github.com/Treboada/docker-kali-sshd/actions/workflows/docker-build-push.yml/badge.svg)](https://github.com/Treboada/docker-kali-sshd/actions/workflows/docker-build-push.yml)

Docker image extending kalilinux/kali to start with the SSH daemon listening as service. The image is weekly rebuilt from rolling pod by kalilinux (rolling updates).

This image exposes SSH service on port 22 by default with a [Kali Linux as container](https://www.kali.org/docs/containers/). Use `KALI_PORT` environment variable to use an alternative port number.

Ready to pull from [caligari/kali-sshd on Docker Hub](https://hub.docker.com/r/caligari/kali-sshd), weekly updated and tagged with _latest_ and week number _YYYY.WW_.

## Execute on Docker

```sh
# start the container
docker run -d -e KALI_PASS=yourSecretPasswordHere caligari/kali-sshd

# use host network and alternative port
docker run -d -e KALI_PASS=ysph1234 -e KALI_PORT=10022 --network=host caligari/kali-sshd
```

## Execute on Kubernetes

```sh
# set the namespace
export NS=your_namespace

# create the secret with the password
kubectl -n $NS create secret generic kali-sshd-secret --from-literal=KALI_PASS=ysph1234

# create the deployment
kubectl -n $NS apply -f https://raw.githubusercontent.com/Treboada/docker-kali-sshd/refs/heads/main/kali-ssh-deployment.yaml
```

The service is _NodePort_ type. Please, ask your cluster administrator to setup the service in a better way.

## SSH service

Log in with ssh client by using the _root_ user and the password set on `KALI_PASS` environment variable:

```sh
# command to log in the SSH service
ssh -p 10022 root@SERVICE_IP
````

## Changelog

### v1.1.0

- Action workflow to do weekly builds and pushes.
- Kubernetes deployment instructions.

### v1.0.0 

- Password and port environment variables

