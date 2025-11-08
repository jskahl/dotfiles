#!/bin/sh

model="llama3"

# Get web results
search_results=$(curl -s "https://api.duckduckgo.com/?q=${1}&format=json" | jq -r '.AbstractText')

# Combine with model
echo "Search results: $search_results" | ollama run $model "Based ONLY AND JUST ONLY on this web search, answer: $1"
