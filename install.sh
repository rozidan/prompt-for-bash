#!/usr/bin/env bash

set -e
set -o pipefail

curl -fsSL -o ~/.prompt-for-bash "https://raw.githubusercontent.com/rozidan/prompt-for-bash/main/set_ps1.sh"
grep "source ~/.prompt-for-bash" ~/.bashrc > /dev/null || echo "source ~/.prompt-for-bash" >> ~/.bashrc
chmod +x ~/.prompt-for-bash

echo "prompt-for-bash installed successfully"
echo "Open a new terminal or execute 'source ~/.bashrc' to see the changes"

