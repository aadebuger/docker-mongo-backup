FROM    mongo

COPY    backup.sh /
RUN     chmod a+x /backup.sh
CMD     /backup.sh

VOLUME  /dump
