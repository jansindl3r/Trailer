# Trailer: a tool for making demo version of fonts
_making preview versions of your fonts containing limited characterset_ 

## pyftsubset
There is a great tool for font substitution, it's called `pyftsubset` and it's part of `fontTools`! I have always found it a bit too complicated to make trial fonts with it. I believe that this tool is primarly meant for substituting fonts that go on the web - making it smaller in size, removing unnecessary data.

## why Trailer?
Seeing empty glyphs, .notdefs or fallback fonts can be confusing when showcasing your font. I found it much useful to replace unwated glyphs with one glyph, which can give better overview of the typeface's texture while still limiting the font's characterset.


```
    python trailer.py font.otf font_trial.otf --keep-characters A B C \ 
    --keep-glyph-names space --keep-unicodes-base10 82 \
    --replacer-character "n" 
```

# To do:
- update kerning pairs
- Flatten components
- More replacing characters