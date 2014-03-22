file=$1
if [ -z "$file" ]; then
  file='tmpfile'
fi
val=$(tail -n1 $file | cut -d' ' -f8 | tr '[:lower:]' '[:upper:]' | sed 's/.*/ibase=16; \0/' | bc)
temp_in_celcius=$(ruby -e "puts $val * 0.48875855327 - 50")
temp_in_f=$(ruby -e "puts $temp_in_celcius * 9 / 5 + 32")
SERVER=localhost
PORT=2003
echo "local.ctemperature $temp_in_celcius `date +%s`";
echo "local.ctemperature $temp_in_celcius `date +%s`" | nc -q 0 ${SERVER} ${PORT};
echo "local.ftemperature $temp_in_f `date +%s`";
echo "local.ftemperature $temp_in_f `date +%s`" | nc -q 0 ${SERVER} ${PORT};
