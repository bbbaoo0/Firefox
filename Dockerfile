FROM ubuntu:22.04 AS downloader
RUN apt-get update && \
    apt-get install -y curl && \
    curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /cloudflared && \
    chmod +x /cloudflared

FROM jlesage/firefox

COPY --from=downloader /cloudflared /usr/local/bin/cloudflared

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
