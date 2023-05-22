# DARE-Guacamole

Builds a container and helm chart for deploying Guacamole in DARE-Teleport.

```
echo "<token>" | docker login harbor.ukserp.ac.uk -u <username> --password-stdin
docker pull harbor.ukserp.ac.uk/dare/guacamole:<version>
```

```
helm repo add --pass-credentials --username <username> --password <password> <repo> https://harbor.ukserp.ac.uk/chartrepo/dare
helm pull --version <version> <repo>/guacamole
ls *.tgz
# guacamole-<version>.tgz
```
