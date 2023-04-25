# DARE-guacamole-helm

Helm chart for deploying the Apache Guacamole on Kubernetes. 

```
helm repo add --pass-credentials --username <username> --password <password> <repo> https://harbor.ukserp.ac.uk/chartrepo/dare
helm pull --version <version> <repo>/guacamole
ls *.tgz
# guacamole-<version>.tgz
```

## CI Build and Release Chart

Releases are triggered by commits added to `main` and version release branches (i.e. `1.x.x`, `1.1.x`).

The type of release (i.e. major / minor / patch) is determined by analysing the commit history since the previous release.

Commits are expected to follow the Conventional Commits standard https://www.conventionalcommits.org/en/v1.0.0/.

When a new release is created the `Chart.yaml` is updated with the new version code and is committed back into the repository on the same branch. The resulting commit is tagged as the release.

The following variables and secrets are set on this Github repo. If you fork the repo you will need to update these settings to point to a chart repository you control.

| Repo Variable   | Value                          |
|-----------------|--------------------------------|
| HARBOR_REGISTRY | harbor.ukserp.ac.uk            |
| HARBOR_PROJECT  | dare                           |
| HARBOR_REPO     | guacamole                      |
| HARBOR_USER     | robot$SwanseaUniversityMedical |
| APP_ID          | 323749                         |

| Repo Secret     | Value      |
|-----------------|------------|
| HARBOR_TOKEN    | eyJhb…rJY0 |
| APP_PRIVATE_KEY | ---...---  |