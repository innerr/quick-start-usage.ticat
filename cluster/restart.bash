set -euo pipefail

env=`cat "${1}/env"`

host=`echo "${env}" | { grep '^cluster.host' || test $? = 1; } | awk '{print $2}'`
port=`echo "${env}" | { grep '^cluster.port' || test $? = 1; } | awk '{print $2}'`

echo "restart cluster ${host}:${port} begin"
for ((i = 0; i < 2; i++)); do
	echo -n "."
	sleep 1
done
echo
echo "restart cluster ${host}:${port} finish"
