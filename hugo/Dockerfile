FROM registry.gitlab.com/pages/hugo@sha256:503f6dabe979d059e55c8451ba484c4f8a2d191eb0eee17c40e17202daac837f
RUN apk add --no-cache git==2.37.1-r1 && \
    adduser -HD -u 998 -s /bin/sh gitlab-runner && \
    adduser -HD -u 1000 -s /bin/sh standard-runner
