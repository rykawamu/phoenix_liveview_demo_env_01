#!/bin/sh

if [[ -d "phoenix_live_view_example" ]]; then
  cd phoenix_live_view_example
  iex -S mix phx.server 
fi
