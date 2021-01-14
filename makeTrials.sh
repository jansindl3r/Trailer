for font in full/*
do 
    echo $font
    out=${font/full/trial}
    python trailer.py $font $out --keep-characters A B C D --keep-glyph-names space --keep-unicodes-base10 82 --replacer-character n --ttf-components --skip --suffix Trial 
done