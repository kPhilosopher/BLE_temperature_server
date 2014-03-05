SERVER=localhost
PORT=2003
while true; do
  value=$(((RANDOM % 10) + 1))
  echo "local.random.diceroll4 $value `date +%s`"
  echo "local.random.diceroll4 $value `date +%s`" | nc -q 0 ${SERVER} ${PORT};
  sleep 1
done
