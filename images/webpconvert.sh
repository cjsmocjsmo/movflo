for f in /media/charliepi/HD1/mediac*/movflo/images/*.jpg; do
cwebp -q 95 -resize 600 0 "$f" -o "${f%.jpg}.webp"
done
