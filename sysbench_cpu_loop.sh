#!/bin/bash

RESULTS_FILE="sysbench_cpu_results.txt"
CPU_MAX_PRIME=100000
THREADS_LIST=(1 2 4 8 16 32 64)

# Clear the results file
echo "Sysbench CPU benchmark results" > "$RESULTS_FILE"

for THREADS in "${THREADS_LIST[@]}"; do
    echo "Running sysbench with $THREADS threads..." | tee -a "$RESULTS_FILE"
    sysbench cpu --cpu-max-prime=$CPU_MAX_PRIME --threads=$THREADS run >> "$RESULTS_FILE"
    echo -e "\n---\n" >> "$RESULTS_FILE"
done

echo "Benchmark completed. Results saved to $RESULTS_FILE."