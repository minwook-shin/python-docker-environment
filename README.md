# python-docker-environment
Docker image of my Python development environment

## custom build example

pure python 3.13.9

```yaml
version: '3.8'
services:
  python:
    build:
      context: .
      args:
        TIMEZONE: Asia/Seoul
        PYTHON_VERSION: "3.13.9"
        PYTHON_PACKAGE: "requests"
    restart: always
```

jupyterlab (python 3.13.9)

```yaml
version: '3.8'
services:
  jupyterlab:
    build:
      context: .
      dockerfile: jupyter.Dockerfile
      args:
        TIMEZONE: Asia/Seoul
        PYTHON_VERSION: "3.13.9"
        PYTHON_PACKAGE: "jupyterlab"
        DEBIAN_PACKAGE: "nodejs npm"
    ports:
    - 8888:8888
    volumes:
    - .:/data
    restart: always
    command: "jupyter lab --ip=* --port=8888 --no-browser --notebook-dir=/data --allow-root"
```