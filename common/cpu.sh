#!/bin/bash

# Number of iterations for top to gather accurate data
iterations=2

# Display top 5 CPU-consuming processes (skip header)
echo "Top 5 CPU-consuming processes:"
top -b -n $iterations | sed -n '8,12p'