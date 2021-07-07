set -euo pipefail

env_file="${1}/env"
env=`cat "${env_file}"`

port=`echo "${env}" | { grep '^cluster.port' || test $? = 1; } | awk '{print $2}'`
if [ -z "${port}" ]; then
	echo "[:(] no env val 'cluster.port'" >&2
	exit 1
fi

host=`echo "${env}" | { grep '^cluster.host' || test $? = 1; } | awk '{print $2}'`
if [ -z "${host}" ]; then
	host="127.0.0.1"
	echo "cluster.host=${host}" >> "${env_file}"
fi

scale=`echo "${env}" | { grep '^bench.scale' || test $? = 1; } | awk '{print $2}'`
if [ -z "${scale}" ]; then
	scale=1
	echo "bench.scale=${scale}" >> "${env_file}"
fi

echo "data loading to ${host}:${port} begin, scale=${scale}"
for ((i = 0; i < ${scale}; i++)); do
	echo -n "."
	sleep 1
done
echo
echo "data loading to ${host}:${port} finish"
