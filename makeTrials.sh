for font in full/*
do 
    out=${font/full/trial}
    python makeTrial.py $font $out --keep-characters A B C D --keep-glyph-names space --keep-unicodes-base10 82 --replacer-character "*"
    break
done