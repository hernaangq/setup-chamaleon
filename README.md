# CS553 HW #2 – Benchmarking BareMetal, Containers, and Virtual Machines

Hernan Garcia Quijano

## Overview

This project automates benchmarking of CPU, memory, disk, and network performance across different virtualization technologies (BareMetal, Docker containers, and KVM virtual machines) on the Chameleon Cloud. The automation is achieved using shell scripts for environment setup, orchestration, and running benchmarks with `sysbench` and `iperf`.

## Repository Structure

- `config-chamaleon.sh`: Run this script when you start a Chameleon Cloud instance. It installs all required packages (sysbench, iperf, Docker, KVM, etc.) and configures the environment.

- `docker/`: Contains scripts and Dockerfile for launching and benchmarking inside a Docker container.
  - `Dockerfile`: Defines the benchmarking container image.
  - `run-docker.sh`: Starts the Docker container to run benchmarks.

- `vm/`: Contains scripts for launching and benchmarking inside a KVM virtual machine.
  - `config-vm.sh`: Configures the VM environment.
  - `run-vmKVM.sh`: Starts the KVM VM to run benchmarks.

- `benchmarks/`: Contains scripts to run various benchmarks using sysbench.
  - `sysbench_cpu_loop.sh`: CPU benchmarking (prime calculation).
  - `sysbench_memory_loop.sh`: Memory benchmarking.
  - `sysbench_disk_loop.sh`: Disk benchmarking.
  - `sysbench_network_loop.sh`: Network benchmarking.

- `README.md`: Project documentation.

## Benchmarking Methodology

- **CPU Benchmark**: Uses `sysbench` to measure CPU performance by calculating prime numbers up to 100,000.
- **Memory, Disk, Network Benchmarks**: Uses corresponding sysbench scripts to measure performance.
- **Virtualization Types**: Benchmarks are run on BareMetal, Docker containers, and KVM virtual machines.
- **Scaling Study**: Varies the number of threads to analyze performance scaling.
- **Efficiency Calculation**: Compares events per second (or throughput) across virtualization types to determine relative efficiency.

## Usage

1. **Configure Chameleon Server**
   ```sh
   ./config-chamaleon.sh
   ```

2. **Run Benchmarks on BareMetal**
   ```sh
   cd benchmarks
   ./sysbench_cpu_loop.sh
   ./sysbench_memory_loop.sh
   ./sysbench_disk_loop.sh
   ./sysbench_network_loop.sh
   ```

3. **Run Benchmarks in Docker Container**
   ```sh
   cd docker
   ./run-docker.sh
   ```

4. **Run Benchmarks in KVM VM**
   ```sh
   cd vm
   ./run-vmKVM.sh
   ```

## Results & Analysis

- Collect the `events per second` or throughput from each environment and each benchmark type.
- Calculate efficiency:
  - Efficiency (%) = (Performance of virtualization type) / (Performance of BareMetal) × 100
- Example (CPU):
  - BareMetal: 10 events/sec (100%)
  - Container: 9 events/sec (90%)
  - VM: 8 events/sec (80%)

## Notes

- Ensure all scripts are executable (`chmod +x scriptname.sh`).
- Scripts are designed for Ubuntu Linux 24.04 on Chameleon Cloud.
- Results should be reproducible and suitable for analysis and plotting.

