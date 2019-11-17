#!/bin/sh
set -xe
APP=soaring-coupons
dokku apps:create $APP
dokku domains:set $APP pirk.sklandymas.lt
dokku proxy:ports-set $APP http:80:8080
dokku postgres:create $APP-db
dokku postgres:link $APP-db $APP
dokku nginx:build-config $APP

dokku docker-options:add soaring-coupons deploy,run "--log-driver=fluentd"
dokku docker-options:add soaring-coupons deploy,run "--log-opt tag=docker.soaring-coupons"
dokku docker-options:add soaring-coupons deploy,run "--log-opt fluentd-async-connect=true"
dokku docker-options:add soaring-coupons deploy,run "--log-opt fluentd-sub-second-precision=true"
