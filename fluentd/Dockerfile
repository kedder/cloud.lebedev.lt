FROM fluent/fluentd
RUN fluent-gem install fluent-plugin-loggly
COPY conf/ /fluentd/
ENTRYPOINT ["fluentd", "-c", "/fluentd/etc/fluent.conf", "-p", "/fluentd/plugins"]
