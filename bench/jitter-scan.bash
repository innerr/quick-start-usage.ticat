set -euo pipefail

env=`cat "${1}/env"`

host=`echo "${env}" | { grep '^cluster.host' || test $? = 1; } | awk '{print $2}'`
port=`echo "${env}" | { grep '^cluster.port' || test $? = 1; } | awk '{print $2}'`
begin=`echo "${env}" | { grep '^bench.begin' || test $? = 1; } | awk '{print $2}'`
end=`echo "${env}" | { grep '^bench.end' || test $? = 1; } | awk '{print $2}'`

echo "jitter scan on cluster ${host}:${port} begin"
for ((i = 0; i < 5; i++)); do
	echo -n "."
	sleep 1
done
echo

echo
echo "bench-begin: [${begin}]"
echo "bench-end:   [${end}]"
echo "jitter-sd:   xx.x%"
echo "jitter-max:  yy.y%"
echo

echo "jitter scan on cluster ${host}:${port} finish"
