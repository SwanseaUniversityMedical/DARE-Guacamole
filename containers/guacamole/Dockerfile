FROM guacamole/guacamole:1.5.3

# Ensure that release notes get picked up from our repo and not from the apache guacamole base repo
# If the apache guacamole notes are used we will incorrectly pickup the release notes from our version
# string searched against their release history....
LABEL org.opencontainers.image.source=https://github.com/SwanseaUniversityMedical/DARE-Guacamole

# TODO setup a build step for compiling and injecting custom jar extnesions

# Intentionally trigger a build error
RUN ///
