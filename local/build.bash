set -euo pipefail

env_file="${1}/env"
env=`cat "${env_file}"`

here=`pwd`

echo "searching projects under:"
echo "    - ${here}"
echo
echo "expanding searching range..."
echo
echo "project found:"
echo "    - demo-cluster-project"

echo "build succeeded, binary:"
bin="${here}/bin/demo-cluster-server"
echo "    - ${bin}"

echo -e "cluster.bin\t${bin}" >> "${env_file}"
