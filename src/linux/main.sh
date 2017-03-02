#!/bin/sh

maybeKill() {
  for p in "$@"
  do
    killall -9 "$p" 2>/dev/null && echo "✋  nope 🚫  :: $p" || true
  done
}

maybeKill "$@"
while :; do maybeKill "$@"; sleep .05; done
