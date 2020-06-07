FROM blang/latex:ctanfull

COPY entrypoint.sh /entrypoint.sh

WORKDIR /root

ENTRYPOINT ["/entrypoint.sh"]
