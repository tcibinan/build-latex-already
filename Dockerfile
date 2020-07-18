FROM aergus/latex:latest

COPY entrypoint.sh /entrypoint.sh

WORKDIR /root

ENTRYPOINT ["/entrypoint.sh"]
