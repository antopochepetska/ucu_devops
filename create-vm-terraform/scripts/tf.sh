# Usage: ./scripts/tf.sh <init|plan|apply|destroy>
set -euo pipefail

step=${1:?usage: $0 <init|plan|apply|destroy>}
cd "$(dirname "$0")/.."
mkdir -p logs
ts=$(date +%Y%m%d-%H%M%S)
log="logs/tf-${step}-${ts}.log"

{
    echo "### terraform ${step}"
    echo "### started $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
    echo "### user: $(whoami) terraform: $(terraform version | head -n 1)"
    echo
} | tee "$log"

case "$step" in
    init)
        terraform init -no-color
        ;;
    plan)
        terraform plan -no-color -out=tfplan
        terraform show -json tfplan > "logs/${step}-${ts}-plan.json"
        ;;
    apply)
        terraform apply -no-color tfplan
        ;;
    destroy)
        terraform destroy -no-color | tee -a "$log"
        ;;
    *)
        echo "Unknown step: $step";
        exit 1
esac 2>&1 | tee -a "$log"


echo -e "\n### finished $(date -u '+%Y-%m-%dT%H:%M:%SZ')"| tee -a "$log"
echo "Log saved to $log"