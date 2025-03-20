# Build stage
FROM phpswoole/swoole:php8.4-alpine AS builder

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN apk --no-cache add git patch && \
    install-php-extensions pcntl bcmath zip redis

WORKDIR /www

ARG CACHEBUST
ARG REPO_URL
ARG BRANCH_NAME

RUN echo "Attempting to clone branch: ${BRANCH_NAME} from ${REPO_URL} with CACHEBUST: ${CACHEBUST}" && \
    rm -rf ./* && \
    rm -rf .git && \
    git config --global --add safe.directory /www && \
    git clone --depth 1 --branch ${BRANCH_NAME} ${REPO_URL} .

RUN composer install --no-cache --no-dev

# Final stage
FROM phpswoole/swoole:php8.4-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions pcntl bcmath zip redis && \
    apk --no-cache add shadow sqlite mysql-client mariadb-connector-c supervisor redis git && \
    addgroup -S -g 1000 www && adduser -S -G www -u 1000 www && \
    (getent group redis || addgroup -S redis) && \
    (getent passwd redis || adduser -S -G redis -H -h /data redis)

WORKDIR /www

COPY .docker/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY --from=builder /www .

RUN php artisan storage:link && \
    chown -R www:www /www && \
    chmod -R 775 /www && \
    mkdir -p /data && \
    chown redis:redis /data

ENV ENABLE_WEB=true \
    ENABLE_HORIZON=true \
    ENABLE_REDIS=false 

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
