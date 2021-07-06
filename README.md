# kali-sshd

Docker image extending kalilinux/kali to start with the SSH daemon listening as service.

## Execute on Docker

    # start the container
    docker run -d -e KALI_PASS=yourSecretPasswordHere caligari/kali-sshd

    # use host network and alternative port
    docker run -d -e KALI_PASS=ysph1234 -e KALI_PORT=10022 --network=host caligari/kali-sshd

## Execute on Kubernetes

ToDo...

