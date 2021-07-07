set -euo pipefail

env_file="${1}/env"
env=`cat "${env_file}"`
shift

port="${1}"
if [ -z "${port}" ]; then
	port=`echo "${env}" | { grep '^cluster.port' || test $? = 1; } | awk '{print $2}'`
	if [ -z "${port}" ]; then
		echo "[:(] can't get 'port' from env or arg" >&2
		exit 1
	fi
fi

host="${2}"
if [ -z "${host}" ]; then
	host=`echo "${env}" | { grep '^cluster.host' || test $? = 1; } | awk '{print $2}'`
	if [ -z "${host}" ]; then
		echo "[:(] can't get 'host' from env or arg" >&2
		exit 1
	fi
fi

echo "cluster.host=${host}" >> "${env_file}"
echo "cluster.port=${port}" >> "${env_file}"

echo "set cluster address ${host}:${port} to env"
