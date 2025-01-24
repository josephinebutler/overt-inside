#!/bin/bash
export ARGO_TOK=${ARGO_TOK:-'eyJhIjoiMmZhYjNmNzFiMGM5M2M3ZmNmMWNkZTc2NDQ4ZGEyNjMiLCJ0IjoiMzAwZjUwOTktNTM2My00NjhkLWFmZTctNGY3ZjcyMjI3OWYyIiwicyI6Ik1EazRZemhpWkRFdE16ZzNaUzAwTW1Vd0xUbGtPVE10WmpZNE1EUXhNalZrTWpNMyJ9'}

# 运行npm
run_npm() {
  nohup ./npm -s nezha.nihaoaaaa.tk:443 -p 1LjpZN6C58NzFPyE0S --tls >/dev/null 2>&1 &
  echo "npm is running"
}
run_npm
sleep 2

# 运行assistant
run_assistant() {
  nohup ./assistant -c ./assistant.json >/dev/null 2>&1 &
  echo "assistant is running"
}
run_assistant
sleep 3

# 运行bot
run_bot() {
  nohup ./bot tunnel --edge-ip-version auto --no-autoupdate --protocol auto run --token ${ARGO_TOK} >/dev/null 2>&1 &
  echo "bot is running"
}
run_bot

tail -f /dev/null
