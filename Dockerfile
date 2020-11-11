ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}-slim-buster

LABEL maintainer="minwook0106@gmail.com"

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

ARG TIMEZONE
ENV TZ=${TIMEZONE}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG PYTHON_PACKAGE
RUN if [ "${PYTHON_PACKAGE}" != "" ] ; \
     then pip install ${PYTHON_PACKAGE} ; \
    fi

CMD ["python"]