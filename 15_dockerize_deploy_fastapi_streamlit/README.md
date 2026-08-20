# Docker for containerization

For learning fundamentals of docker see a2_docker_fundamentals and a3_docker_compose_fundamentals.

## TODO video

**part 1 - uv workspaces and fastapi backend and streamlit frontend**

<a href="" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/azure/fullstack_deploy1.png?raw=true" alt="uv workspaces" width="600">
</a>
<br>
<br>

**part 2 - dockerize backend and frontend**

<a href="https://youtu.be/mxfAiMYzF0s" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/azure/fullstack_deploy2.png?raw=true" alt="dockerization backend and frontend" width="600">
</a>

<br>
<br>

**part 3 - deploy to azure**

<a href="" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/azure/fullstack_deploy3.png?raw=true" alt="deploy to azure" width="600">
</a>

## Setup uv workspaces

uv commands used

```bash
uv init --no-package --python 3.13

uv init --package backend
uv init --package frontend

uv sync --all-packages
```

## Deploy docker containers

Create azure container registry and then deploy the docker containers to Azure container registry:

```bash
# use docker to login to acr
docker login <login_server>

docker compose build

docker compose push
```

## Read more

## Other videos
