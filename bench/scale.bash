set -euo pipefail

env_file="${1}/env"
env=`cat "${env_file}"`
shift

scale="${1}"
echo "bench.scale=${scale}" >> "${env_file}"
echo "set bench scale=${scale}"
