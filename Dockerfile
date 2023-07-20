FROM alpine
ARG TARGETARCH

WORKDIR /
# COPY smartdns.1.2023.05.07-1641.x86_64-linux-all.tar.gz /smartdns.1.2023.05.07-1641.x86_64-linux-all.tar.gz
ADD 4dockerfile.sh /pre.sh
ADD start.sh /start.sh
ADD config.conf /config.conf
RUN chmod +x /pre.sh && ./pre.sh && chmod +x /start.sh
VOLUME ["/smartdns"]

EXPOSE 53

ENTRYPOINT ["/bin/sh","/start.sh"]
# CMD ["/bin/sh","/start.sh"]
