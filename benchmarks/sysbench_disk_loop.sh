#!/bin/bash

RESULTS_FILE="sysbench_cpu_results.txt"

THREADS_LIST=(1 2 4 8 16 32 64)

sysbench fileio prepare --file-num=128 --file-block-size=4096 --file-total-size=120G --file-extra-flags=direct

# Clear the results file
echo "Sysbench CPU benchmark results" > "$RESULTS_FILE"

for THREADS in "${THREADS_LIST[@]}"; do
    echo "Running sysbench with $THREADS threads..." | tee -a "$RESULTS_FILE"
    sysbench fileio run --file-num=128 --file-total-size=10G --file-io-mode=sync --file-test-mode=rndrd --file-extra-flags=direct --threads=$THREADS >> "$RESULTS_FILE"
    echo -e "\n---\n" >> "$RESULTS_FILE"
done

sysbench fileio cleanup --file-num=128

echo "Benchmark completed. Results saved to $RESULTS_FILE."


