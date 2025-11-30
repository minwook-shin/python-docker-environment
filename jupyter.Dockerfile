ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}-slim

LABEL maintainer="minwook0106@gmail.com"

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

ARG TIMEZONE
ENV TZ=${TIMEZONE}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG PYTHON_PACKAGE
RUN if [ "${PYTHON_PACKAGE}" != "" ] ; \
     then pip install ${PYTHON_PACKAGE} ; \
    fi

ARG DEBIAN_PACKAGE
RUN if [ "${DEBIAN_PACKAGE}" != "" ] ; \
     then apt-get update && apt-get install -y ${DEBIAN_PACKAGE} && rm -rf /var/lib/apt/lists/* ; \
    fi

ARG EXPOSE
EXPOSE ${EXPOSE}
VOLUME /data
ENV NODE_OPTIONS="--max-old-space-size=4096"
RUN jupyter labextension install @jupyterlab/git --no-build && \
    jupyter labextension install @jupyterlab/github --no-build && \
    jupyter lab build --dev-build=False --minimize=False && \
        jupyter lab clean && \
        npm cache clean --force
CMD ["jupyter", "lab", "--ip=*", "--port=8888", "--no-browser", "--notebook-dir=/data", "--allow-root"]