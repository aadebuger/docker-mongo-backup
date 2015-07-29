set -e # Exit on any error
export
# Default variables - one can override them in docker run invocation
: ${HOST:=mongo}
: ${DB:=test_database}
: ${DIR:=/dump}
: ${TIME:=$(date +%F)}

mkdir -p "$DIR"
cd       "$DIR"
echo $MONGO_PORT_27017_TCP_ADDR

echo "$HOST"
mongodump \
  --host "$MONGO_PORT_27017_TCP_ADDR" \
  --db   "$DB" \
  --out  "./$DB-$TIME"

tar czf "./$DB-$TIME.tar.gz" "./$DB-$TIME"

rm -rf  "./$DB-$TIME"

# TODO: If mailgun key is provided then send backup
# if test -n $MAILGUNKEY; then
#   curl
#     -s \
#     --user "api:$MAILGUNKEY"
#     test -n $MAILGUNKEY/messages \
#     -F from='Responsa.eu Guardian Angel <backups@responsa.eu>' \
#     -F to='stuff@responsa.eu' \
#     -F subject="ToTIME's database backup" \
#     -F text="Attached please find toTIME's backup of Responsa.eu database."
#     -F attachment=@$DB-$DATE.tar.gz
# fi
