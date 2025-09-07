# CS553 HW #2 – Benchmarking BareMetal, Containers, and Virtual Machines - Hernan Garcia Quijano


## Overview

This project automates the benchmarking of CPU performance across different virtualization technologies (BareMetal, Docker containers, and KVM virtual machines) on the Chameleon Cloud. The automation is achieved using a set of shell scripts that configure the environment, orchestrate Docker/KVM, and run CPU benchmarks using `sysbench`.

## Project Structure

- `config-chamaleon.sh`: Script to configure the Chameleon server environment.
- `run-docker.sh`: Automates launching and benchmarking inside a Docker container.
- `run-vm.sh`: Automates launching and benchmarking inside a KVM virtual machine.
- `sysbench_cpu_loop.sh`: Runs the CPU benchmark using sysbench with configurable parameters.
- `Dockerfile`: Docker image definition for benchmarking.
- `README.md`: Project documentation.

## Benchmarking Methodology

- **CPU Benchmark**: Uses `sysbench` to measure CPU performance by calculating prime numbers up to 100,000.
- **Virtualization Types**: Benchmarks are run on BareMetal, Docker containers, and KVM virtual machines.
- **Scaling Study**: Varies the number of threads to analyze performance scaling.
- **Efficiency Calculation**: Compares events per second across virtualization types to determine relative efficiency.

## Usage

1. **Configure Chameleon Server**
   ```sh
   ./config-chamaleon.sh
   ```

2. **Run BareMetal Benchmark**
   ```sh
   ./sysbench_cpu_loop.sh
   ```

3. **Run Docker Benchmark**
   ```sh
   ./run-docker.sh
   ```

4. **Run KVM VM Benchmark**
   ```sh
   ./run-vm.sh
   ```


## Results & Analysis

- Collect the `events per second` from each environment.
- Calculate efficiency:
  - Efficiency (%) = (Events per second of virtualization type) / (Events per second of BareMetal) × 100
- Example:
  - BareMetal: 10 events/sec (100%)
  - Container: 9 events/sec (90%)
  - VM: 8 events/sec (80%)

## Notes

- Ensure all scripts are executable (`chmod +x scriptname.sh`).
- Scripts are designed for Ubuntu Linux 24.04 on Chameleon Cloud.
- Results should be reproducible and suitable for analysis and plotting.

