#!/usr/bin/env bash
set -euo pipefail

cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

if [[ ! -f index.html || ! -f vercel.json ]]; then
  echo "❌ Keep deploy.sh in the same folder as index.html and vercel.json." >&2
  exit 1
fi

echo "🚀 Deploying to Vercel..."

if ! command -v vercel >/dev/null 2>&1; then
  echo "⚠️ Vercel CLI not found. Installing..."
  npm install -g vercel
fi

vercel --prod

echo "✅ Deploy complete!"
