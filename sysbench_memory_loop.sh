#!/bin/bash

RESULTS_FILE="sysbench_mem_results.txt"
mem_MAX_PRIME=100000
THREADS_LIST=(1 2 4 8 16 32 64)

# Clear the results file
echo "Sysbench mem benchmark results" > "$RESULTS_FILE"

for THREADS in "${THREADS_LIST[@]}"; do
    echo "Running sysbench with $THREADS threads..." | tee -a "$RESULTS_FILE"
    sysbench memory -memory-block-size=1K --memory-total-size=120G --threads=$THREADS run >> "$RESULTS_FILE"
    echo -e "\n---\n" >> "$RESULTS_FILE"
done

echo "Benchmark completed. Results saved to $RESULTS_FILE."
