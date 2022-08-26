FROM segment/topicctl:v1.5.0 AS topicctl

FROM edenhill/kcat:1.7.1 AS kcat

FROM deviceinsight/kafkactl:v2.5.0 AS kafkactl

FROM alpine:3.16.2
RUN apk add zstd-libs curl bash
COPY --from=topicctl /bin/topicctl /usr/local/bin/topicctl
COPY --from=kcat /usr/bin/kcat /usr/local/bin/kcat
COPY --from=kafkactl /usr/local/bin/kafkactl /usr/local/bin/kafkactl
