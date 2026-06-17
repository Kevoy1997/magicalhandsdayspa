#!/bin/bash
# Run this from inside your magical-hands-website folder.
# Downloads the 12 images directly from WordPress into ./images/
# This must run from YOUR machine, not mine — these images are still
# reachable directly (no referer header = no hotlink block), but the
# block is specifically what stops them loading embedded in the Netlify page.

curl -sL "https://magicalhandsdayspa.com/wp-content/uploads/2022/01/woman-young-massage-3701712-768x474.jpg" -o "images/woman-young-massage-3701712-768x474.jpg"
curl -sL "https://magicalhandsdayspa.com/wp-content/uploads/2022/02/Denise-2.jpg" -o "images/Denise-2.jpg"
curl -sL "https://magicalhandsdayspa.com/wp-content/uploads/2022/02/GetPaidStock.com-620c9fb698c3c-768x486.jpg" -o "images/GetPaidStock.com-620c9fb698c3c-768x486.jpg"
curl -sL "https://magicalhandsdayspa.com/wp-content/uploads/2022/02/GetPaidStock.com-620cb34566e87.jpg" -o "images/GetPaidStock.com-620cb34566e87.jpg"
curl -sL "https://magicalhandsdayspa.com/wp-content/uploads/2022/02/GetPaidStock.com-6216d9d127b63-768x486.jpg" -o "images/GetPaidStock.com-6216d9d127b63-768x486.jpg"
curl -sL "https://magicalhandsdayspa.com/wp-content/uploads/2022/02/Omar.jpg" -o "images/Omar.jpg"
curl -sL "https://magicalhandsdayspa.com/wp-content/uploads/2022/03/touching-young-peaceful-beautiful-therapy-1-768x512.jpg" -o "images/touching-young-peaceful-beautiful-therapy-1-768x512.jpg"
curl -sL "https://magicalhandsdayspa.com/wp-content/uploads/2022/03/woman-with-dreadlocks-1-768x512.jpg" -o "images/woman-with-dreadlocks-1-768x512.jpg"
curl -sL "https://magicalhandsdayspa.com/wp-content/uploads/2024/12/abstract-portrait-man-vaporwave-style-1-768x512.jpg" -o "images/abstract-portrait-man-vaporwave-style-1-768x512.jpg"
curl -sL "https://magicalhandsdayspa.com/wp-content/uploads/2024/12/pexels-vlada-karpovich-6634889-1-768x512.jpg" -o "images/pexels-vlada-karpovich-6634889-1-768x512.jpg"
curl -sL "https://magicalhandsdayspa.com/wp-content/uploads/2024/12/stones-candle-plants-1-768x512.jpg" -o "images/stones-candle-plants-1-768x512.jpg"
curl -sL "https://magicalhandsdayspa.com/wp-content/uploads/2024/12/woman-receiving-manicure-from-woman-gloves-mask-beauty-salon-daytime-1-768x525.jpg" -o "images/woman-receiving-manicure-from-woman-gloves-mask-beauty-salon-daytime-1-768x525.jpg"

echo "Done. Checking file sizes (anything near 0 bytes failed):"
ls -la images/
