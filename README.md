# python-docker-environment
Docker image of my Python development environment


## pull image example

pure python 3.9.0

```yaml
version: '3.8'
services:
  python:
    image: docker.pkg.github.com/minwook-shin/python-docker-environment/python:3.9.0
    restart: always
```

jupyterlab (python 3.9.0)

```yaml
version: '3.8'
services:
  jupyterlab:
    image: docker.pkg.github.com/minwook-shin/python-docker-environment/python-jupyterlab:3.9.0
    ports:
    - 8888:8888
    volumes:
    - .:/data
    restart: always
```

## custom build example

pure python 3.9.0
```yaml
version: '3.8'
services:
  python:
    build:
      context: .
      args:
        TIMEZONE: Asia/Seoul
        PYTHON_VERSION: "3.9.0"
        PYTHON_PACKAGE: "requests"
    restart: always
```

jupyterlab (python 3.9.0)

```yaml
version: '3.8'
services:
  jupyterlab:
    build:
      context: .
      dockerfile: jupyter.Dockerfile
      args:
        TIMEZONE: Asia/Seoul
        PYTHON_VERSION: "3.9.0"
        PYTHON_PACKAGE: "jupyterlab"
        DEBIAN_PACKAGE: "nodejs npm"
    ports:
    - 8888:8888
    volumes:
    - .:/data
    restart: always
    command: "jupyter lab --ip=* --port=8888 --no-browser --notebook-dir=/data --allow-root"
```