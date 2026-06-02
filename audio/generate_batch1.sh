#!/bin/bash
# Batch 1/3: Generate 43 OGG pronunciation files
AUDIO_DIR="/Users/aiaimoo/.hermes/profiles/wenke/skills/english-cat/audio"

sanitize() {
    echo "$1" | sed "s/ /_/g; s/'//g; s/\///g; s/(//g; s/)//g"
}

generate() {
    local word="$1"
    local filename
    filename=$(sanitize "$word")
    local outfile="$AUDIO_DIR/${filename}.ogg"

    if [ -f "$outfile" ]; then
        echo "SKIP: $word -> $filename.ogg (exists)"
        return 0
    fi

    echo "GEN: $word -> $filename.ogg"
    say -v Samantha "$word" -o /tmp/word_tmp.aiff 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "ERROR: say failed for '$word'"
        return 1
    fi
    ffmpeg -y -i /tmp/word_tmp.aiff -c:a libopus -b:a 32k "$outfile" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "ERROR: ffmpeg failed for '$word'"
        return 1
    fi
    echo "OK: $filename.ogg"
}

words=(
    "watermelon"
    "cherry"
    "cherries"
    "strawberry"
    "strawberries"
    "grape"
    "plum"
    "crunchy"
    "spaghetti"
    "pizza"
    "snails"
    "French bread"
    "sushi"
    "cold noodles"
    "hot dog"
    "hamburger"
    "roast duck"
    "dim sum"
    "America"
    "Italy"
    "France"
    "Japan"
    "China"
    "a cup of lemon tea"
    "a cup of hot chocolate"
    "a glass of cola"
    "a glass of apple juice"
    "a plate of fried noodles"
    "a plate of fried rice"
    "a bowl of congee"
    "a bowl of dumplings"
    "a bar of chocolate"
    "a loaf of bread"
    "a bottle of water"
    "a packet of sweets"
    "two plates of fried noodles"
    "three glasses of apple juice"
    "a can of cola"
    "a tin of fish"
    "a piece of cheesecake"
    "a carton of milk"
    "hard"
    "soft"
)

total=${#words[@]}
count=0

for word in "${words[@]}"; do
    generate "$word"
    count=$((count + 1))
    echo "[$count/$total]"
done

echo "DONE: $count words processed"
