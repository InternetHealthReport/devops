# syntax=docker/dockerfile:1

ARG IMAGE_VERSION="slim-bookworm"
ARG PYTHON_VERSION="3.13"

FROM python:${PYTHON_VERSION}-${IMAGE_VERSION} AS python

LABEL "org.name"="InternetHealthReport" \
      "org.website"="https://ihr.iijlab.net/ihr/en-us/" \
      "org.email"="admin@ihr.live" \
      "image.description"="Base Python image used by all IHR published images" \
      "org.description"="The Internet Health Report monitors the \
                        conditions of networks that compose the Internet. \
                        This effort aims to provide network operators, policymakers, \
                        and other stakeholders, with a better understanding of the \
                        Internet's infrastructure and its evolution."

ENV UID=1000 GID=1000

# - create ihr user, to be used in all
# ihr image instructions (ENTRYPOINT/CMD/RUN)
# to run as non-root
# - in IHR images use: USER ihr:ihr, 
# - user & group ids are 1000 for compatibility in dev contaienrs
RUN addgroup --system --gid ${GID:-1000} ihr \
    && adduser --system --ingroup ihr --uid ${UID:-1000} ihr

USER ihr:ihr

WORKDIR /app

ENTRYPOINT ["python"]
