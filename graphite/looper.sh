while true; do
  sh read_temperature_data.sh $* &
  sleep 1
done
