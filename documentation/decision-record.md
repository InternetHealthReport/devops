# Decision Record

Documenting devops decisions of IHR.

---

## Golden Image

Use a golden python image for all container work in IHR.

**Purpose**:

1. Share common setup & security checks.
2. Easy switching of base image (current: debian `slim-buster`) of all IHR python containers.

**Details**:

- golden image names: `python:3.6-ihr` & `python:3.8-ihr`
- definition: [Dockerfile.python](https://github.com/InternetHealthReport/devops/blob/main/Dockerfile.python)
- official base image: slim-buster (debian)

---

## *TODO* Multi Architecutre Images


**Purpose**:

1. Allow running IHR on Rasperry Pi for hobbyists. (arch: `linux/arm/v7`)

2. Allow running IHR on ARM-based machines on AWS, which are cheaper. (arch: `linux/arm64`)

**Not Implemented Yet**

---

## Stack

### Github Container Registry (ghcr.io)

- **Usecase**: storage & distribution of Docker images.

- **Rational**:
    - Dockerhub have changed their policy in 2023 regarding open source organizations from free to cost 420 USD per year. The workaround is to use an individual account and share credetials among collaborators which introduces some needless friction.
    - ghcr.io is free.
    - ghcr.io allows collaboration between community members with no additional fees.

- **Cons**:
    
    - DockerHub is the default registry for all docker clients, all image pulls target it. If ghcr.io is used, users will have to either:
        1. reconfigure their Docker client to pull from ghcr.io
        2. or, specify full registry address when using IHR containers, eg: 
    
    ```
    docker pull ghcr.io/internethealthreport/python:3.8-ihr
    ```

- To avoid this:

    - [x] push images to DockerHub as well to let u-sers pull from it directly, eg: 

    ```
    docker pull internethealthreport/python:3.8-ihr
    ```

---

### Github Actions

- **Usecase**: Continouos Integration
- **Rational**:

    1. Already used by IHR collaborators.
    2. Easy & well-documented.
    3. Free for open source projects.
    4. No need to setup a dedicated server for build (like with Jenkins)

---