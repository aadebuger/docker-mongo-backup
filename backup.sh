set -e # Exit on any error

# Default variables - one can override them in docker run invocation
: ${HOST:=mongo}
: ${DB:=R20}
: ${DIR:=/dump}
: ${DAY:=$(date +%F)}

mkdir -p $DIR
cd       $DIR

mongodump \
  -host $HOST \
  -db   $DB \
  -out  $DB-$DAY

tar czf $DB-$DAY.tar.gz $DB-$DAY

rm -rf  $DB-$DAY

# TODO: If mailgun key is provided then send backup
# if test -n $MAILGUNKEY; then
#   curl
#     -s \
#     --user "api:$MAILGUNKEY"
#     test -n $MAILGUNKEY/messages \
#     -F from='Responsa.eu Guardian Angel <backups@responsa.eu>' \
#     -F to='stuff@responsa.eu' \
#     -F subject="Today's database backup" \
#     -F text="Attached please find today's backup of Responsa.eu database."
#     -F attachment=@$DB-$DATE.tar.gz
# fi
