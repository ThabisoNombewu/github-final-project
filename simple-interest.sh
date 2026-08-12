#!/bin/bash

# Simple Interest Calculator
# This script calculates simple interest based on user input

echo "====================================="
echo "   Simple Interest Calculator"
echo "====================================="

# Prompt user for principal amount
echo ""
echo "Enter the principal amount:"
read -p "> " principal

# Validate principal input
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || [ "$principal" -le 0 ]; then
    echo "Error: Please enter a valid positive number for principal."
    exit 1
fi

# Prompt user for rate of interest
echo ""
echo "Enter the rate of interest (in %):"
read -p "> " rate

# Validate rate input
if ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || [ "$rate" -le 0 ]; then
    echo "Error: Please enter a valid positive number for rate."
    exit 1
fi

# Prompt user for time period
echo ""
echo "Enter the time period (in years):"
read -p "> " time

# Validate time input
if ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]] || [ "$time" -le 0 ]; then
    echo "Error: Please enter a valid positive number for time."
    exit 1
fi

# Calculate simple interest
# Formula: Simple Interest = (Principal * Rate * Time) / 100
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate total amount
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display results
echo ""
echo "====================================="
echo "   Results"
echo "====================================="
echo "Principal Amount:    $principal"
echo "Rate of Interest:    $rate%"
echo "Time Period:         $time years"
echo "-------------------------------------"
echo "Simple Interest:     $simple_interest"
echo "Total Amount:        $total_amount"
echo "====================================="
