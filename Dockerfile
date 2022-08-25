FROM segment/topicctl:v1.5.0 AS topicctl

FROM alpine:3.16.2

COPY --from=topicctl /bin/topicctl /usr/local/bin/topicctl
