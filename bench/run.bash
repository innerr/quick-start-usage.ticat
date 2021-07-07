set -euo pipefail

env_file="${1}/env"
env=`cat "${env_file}"`

host=`echo "${env}" | { grep '^cluster.host' || test $? = 1; } | awk '{print $2}'`
port=`echo "${env}" | { grep '^cluster.port' || test $? = 1; } | awk '{print $2}'`
scale=`echo "${env}" | { grep '^bench.scale' || test $? = 1; } | awk '{print $2}'`

begin=`date +%D-%T`

echo "benchmark on ${host}:${port} begin, scale=${scale}"
for ((i = 0; i < ${scale}; i++)); do
	echo -n "."
	sleep 1
done
echo
echo "benchmark on ${host}:${port} finish"

end=`date +%D-%T`

echo "bench.begin=${begin}" >> "${env_file}"
echo "bench.end=${end}" >> "${env_file}"
