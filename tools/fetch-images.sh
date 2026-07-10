#!/usr/bin/env bash
# BREN Landscaping — pull the Higgsfield-generated photography into images/
# and switch the site over from the SVG placeholders.
#
# Run from the repo root on your own machine (the generated files live on
# Higgsfield's CDN, which the remote coding environment couldn't reach):
#
#   bash tools/fetch-images.sh
#
# CDN links can expire — run this soon after generation. The images also
# live in the Higgsfield library (higgsfield.ai) under this account.
set -euo pipefail

cd "$(dirname "$0")/.."

# filename → generated image URL (filled in by the generation session)
BASE="https://d8j0ntlcm91z4.cloudfront.net/user_3GIbodp4ntCTm8UnZRTiYSMtgvD"
declare -A IMAGES=(
  [hero.png]="$BASE/hf_20260710_055416_950cd43c-098f-474b-b543-a4fba052dd80.png"      # backyard dusk firepit, 16:9
  [gallery-1.png]="$BASE/hf_20260710_055458_b4ac9ae8-db52-4008-ac7d-4c88b4438b19.png" # fieldstone firepit, 3:4
  [gallery-2.png]="$BASE/hf_20260710_055716_8d7a26ba-841a-44a4-ab5c-fc5aa7ea25a9.png" # bluestone terrace, 4:3
  [gallery-3.png]="$BASE/hf_20260710_060028_8b628425-d48d-4145-8da7-fd1390339a6d.png" # dry-laid stone wall, 1:1
  [gallery-4.png]="$BASE/hf_20260710_060425_3c32bdd4-cbcf-403c-b103-d7e36c344718.png" # path lighting at night, 3:4
  [gallery-5.png]="$BASE/hf_20260710_060723_b1333e1a-b0d8-4a96-90f7-e35fdf54318d.png" # striped lawn, 4:3
  [gallery-6.png]="$BASE/hf_20260710_060812_ddd29477-62b3-4826-a601-4fcf5ac61959.png" # hillside stone steps, 3:4
  [gallery-7.png]="$BASE/hf_20260710_060854_23905b1d-e84e-4558-9fc4-7a6b9da05993.png" # dining patio string lights, 3:2
  [gallery-8.png]="$BASE/hf_20260710_061036_edf82d20-1071-4253-bac8-ef688e77f604.png" # perennial border in bloom, 3:4
)

echo "Downloading ${#IMAGES[@]} images…"
for name in "${!IMAGES[@]}"; do
  echo "  images/$name"
  curl -fsSL -o "images/$name" "${IMAGES[$name]}"
done

echo "Switching site references from .svg placeholders to .png photos…"
for f in index.html blog/index.html blog/*.html css/styles.css; do
  sed -i.bak \
    -e 's#images/hero\.svg#images/hero.png#g' \
    -e 's#images/gallery-1\.svg#images/gallery-1.png#g' \
    -e 's#images/gallery-2\.svg#images/gallery-2.png#g' \
    -e 's#images/gallery-3\.svg#images/gallery-3.png#g' \
    -e 's#images/gallery-4\.svg#images/gallery-4.png#g' \
    -e 's#images/gallery-5\.svg#images/gallery-5.png#g' \
    -e 's#images/gallery-6\.svg#images/gallery-6.png#g' \
    -e 's#images/gallery-7\.svg#images/gallery-7.png#g' \
    -e 's#images/gallery-8\.svg#images/gallery-8.png#g' \
    "$f" && rm -f "$f.bak"
done

echo "Done. Open index.html to check, then commit:"
echo "  git add images *.html blog css && git commit -m 'Swap in generated photography'"
