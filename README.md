# Trailer
## _A tool for making demo versions of your fonts_

```
    python trailer.py font.otf font_trial.otf --keep-characters A B C \ 
    --keep-glyph-names space --keep-unicodes-base10 82 \
    --replacer-character n 
```
## pyftsubset
There is a great tool for substituting fonts, it's called `pyftsubset` and it's part of `fontTools`! I have always found it a bit too complicated to make trial fonts with it. In my opinion that this tool is primarily meant for substituting fonts that go on the web - making it smaller in size, removing unnecessary data and unnecessary characters as well.

## Why Trailer?
Removing certain glyphs of a font for purposes of providing a trial licence might not be that useful as .notdef glyph or fallback font can show up instead of a missing glyph. This can lead to confusion, especially when your font's fallback font can't be easily spotted. For example monospaced to monospaced. Making `pyftsubset` not changing anything else except the glyph set is a challenge by itself. I found it much easier and handy to replace unwanted glyphs with an arbitrary glyph, which can give better overview of the typeface's texture while still limiting the font's character set.


## How do I control it?
Trailer has two positional arguments
1. Path to a font which you want to make a trial of
1. Path where you want to save it
it has two groups of keyword arguments
1. A space-separated list of glyphs in one or more of the following ways
    * `--keep-characters` Keeps glyphs which represent given characters, use f.e. _0 1 2 a b c . ? !_
    * `--keep-glyph-names` Keeps glyphs of given glyph names, use f.e. _zero one two a b c period question exclam_
    * `--keep-unicodes-base10` Keeps glyphs mapped to given unicodes in base 10, use f.e. _48 49 50 97 98 99 46 63 33_
1. A glyph which will replace the glyphs that were not set to be kept. I refer to such glyph as a replacer. You can set only one of the following arguments
    * `--replacer-character` A glyph representing given character will become replacer, f.e. _*_
    * `--replacer-glyph-name` A glyph with given name will become replacer, f.e. _asterisk_
    * `--replacer-unicode-base10` A glyph with given unicode will become replacer, f.e. _42_
1. And then there are optional arguments
    * `--skip` Will ignore if any glyph out of the ones that should be kept is missing in the font 
    * `--ttf-components` Replaced glyph will contain replacer as a component in TrueType flavoured fonts
    * `--suffix` Suffix which font's name will obtain. F.e. name like _Font Sans_ with suffix set to _Trial_ will become _Font Sans Trial_ 
    * `--family-name` Sets name based on which the family name replacing is done. If not set, the program will determine the name itself based on name entry 1 in name table.
```
python trailer.py font.otf font_trial.otf --keep-characters A B C \ 
--keep-glyph-names space --keep-unicodes-base10 82 \
--replacer-character "n" 
```

## To do:
- Update kerning pairs, so glyphs not containing their original shape are updated accordingly.
- Flatten components. If user wants to keep `i` it should keep its components as well.
- Sequence of replacing characters. Replacing `a-z` with `n` might not give the best impression of the typeface. Replacing it with sequence of f.e. `n, o, s` might give more a bit more rhytmical and representing result.

## Happy trialing!

```
###########################################
#####      ##############  |#  _  \########
####  /####  \###  \#####    /####  \######
###  /######  \###  \####  /#######  \#####
###  |######  |####  \###  |########  |####
###  _________|####  /###  |########  |####
###  \############  /####  |########  |####
####  \####  /###  /#####  |########  |####
##### _____/#############  |########  |####
###########################################
```