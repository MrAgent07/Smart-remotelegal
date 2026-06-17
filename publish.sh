#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

if ! gh auth status &>/dev/null; then
  echo "Log in first: gh auth login --hostname github.com --git-protocol ssh --web"
  exit 1
fi

if git remote get-url origin &>/dev/null; then
  git push -u origin main
else
  gh repo create MrAgent07/beamremote-legal --public --source=. --remote=origin --push
fi

echo ""
echo "Enable Pages: https://github.com/MrAgent07/beamremote-legal/settings/pages"
echo "  Branch: main  Folder: / (root)"
echo ""
echo "Live URLs (after 1–2 min):"
echo "  https://mragent07.github.io/beamremote-legal/privacy.html"
echo "  https://mragent07.github.io/beamremote-legal/support.html"
