#!/bin/bash

RESULTS_FILE="network_results.txt"
THREADS_LIST=(1 2 4 8 16 32 64)

sudo sysctl -w net.core.rmem_max=2621440
sudo sysctl -w net.core.wmem_max=2621440
sudo sysctl -w net.ipv4.tcp_rmem="4096 2621440 2621440"
sudo sysctl -w net.ipv4.tcp_wmem="4096 2621440 2621440"
sudo sysctl -p

# Start server in background
iperf -s -w 0.5M > /dev/null 2>&1 &
SERVER_PID=$!
sleep 2  # Wait for server to start

echo "Network Benchmark Results" > "$RESULTS_FILE"

for N in "${THREADS_LIST[@]}"; do
    echo "Running iperf with $N parallel streams..." | tee -a "$RESULTS_FILE"
    iperf -c 127.0.0.1 -w 1.25M -l 8192K -e -i 1 --nodelay --parallel=$N | grep -E "^\[ CT\]|^\[SUM\]" >> "$RESULTS_FILE" 2>&1
    echo -e "\n---\n" >> "$RESULTS_FILE"
done

# Stop server
kill $SERVER_PID
echo "Benchmark completed. Results in $RESULTS_FILE."
