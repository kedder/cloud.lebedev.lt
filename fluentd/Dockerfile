FROM fluent/fluentd
RUN fluent-gem install fluent-plugin-loggly fluent-plugin-logzio
COPY conf/ /fluentd/
ENTRYPOINT ["fluentd", "-c", "/fluentd/etc/fluent.conf", "-p", "/fluentd/plugins"]
