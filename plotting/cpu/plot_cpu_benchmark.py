import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# Load data from the text file
data = pd.read_csv('cpu_benchmark_data.txt')

# Prepare data for plotting
threads = data['Threads'].unique()
virtualization_types = data['Virtualization Type'].unique()

# Extract throughput and latency
throughputs = {vt: data[data['Virtualization Type'] == vt]['Measured Throughput (Events per Second)'].values for vt in virtualization_types}
latencies = {vt: data[data['Virtualization Type'] == vt]['Avg. Latency (ms)'].values for vt in virtualization_types}

# Create figure with two y-axes
fig, ax1 = plt.subplots(figsize=(10, 6))

# Plot throughput on the left y-axis
ax1.set_xlabel('Threads')
ax1.set_ylabel('Throughput (Events per Second)', color='black')
lines1 = []
for vt in virtualization_types:
    line, = ax1.plot(threads, throughputs[vt], marker='o', label=f'{vt} Throughput', color={'Baremetal': 'blue', 'Container': 'green', 'Virtual Machine': 'red'}.get(vt))
    lines1.append(line)
ax1.tick_params(axis='y', labelcolor='black')
ax1.set_yscale('log')  # Log scale for better visibility of throughput range
ax1.grid(True)

# Create second y-axis for latency
ax2 = ax1.twinx()
ax2.set_ylabel('Avg. Latency (ms)', color='black')
lines2 = []
for vt in virtualization_types:
    line, = ax2.plot(threads, latencies[vt], marker='s', linestyle='--', label=f'{vt} Latency', color={'Baremetal': 'lightblue', 'Container': 'lightgreen', 'Virtual Machine': 'tomato'}.get(vt))
    lines2.append(line)
ax2.tick_params(axis='y', labelcolor='black')
ax2.set_yscale('log')  # Log scale for latency range

# Combine lines for a single legend
lines = lines1 + lines2
labels = [l.get_label() for l in lines]
ax1.legend(lines, labels, loc='upper center', bbox_to_anchor=(0.5, -0.15), ncol=3)

# Title
plt.title('CPU Benchmark Performance')

# Adjust layout to prevent overlap
fig.tight_layout()

# Save the plot
plt.savefig('cpu_performance_plot.png', dpi=300, bbox_inches='tight')
plt.show()