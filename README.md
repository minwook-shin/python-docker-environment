# python-docker-environment
Docker image of my Python development environment

## example:
```yaml
version: '3.8'
services:
  python:
    build:
      context: .
      args:
        TIMEZONE: Asia/Seoul
        PYTHON_VERSION: "3.9.0"
        PYTHON_PACKAGE: "pytest requests"
    restart: always
```