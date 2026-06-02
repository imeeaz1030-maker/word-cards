#!/bin/bash
DIR="/Users/aiaimoo/.hermes/profiles/wenke/skills/english-cat/audio"
cd "$DIR" || exit 1

VOICE="en-US-EmmaMultilingualNeural"

generate() {
    local text="$1"
    local fname="$2"
    echo "Generating: $text -> ${fname}.ogg"
    edge-tts --voice "$VOICE" --text "$text" --write-media "${fname}_tmp.mp3" 2>/dev/null
    ffmpeg -y -i "${fname}_tmp.mp3" -codec:a libvorbis "${fname}.ogg" 2>/dev/null
    rm -f "${fname}_tmp.mp3"
}

# Batch 1
generate "watermelon" "watermelon"
generate "cherry" "cherry"
generate "cherries" "cherries"
generate "strawberry" "strawberry"
generate "strawberries" "strawberries"
generate "grape" "grape"
generate "plum" "plum"
generate "crunchy" "crunchy"
generate "spaghetti" "spaghetti"
generate "pizza" "pizza"
generate "snails" "snails"
generate "French bread" "French_bread"
generate "sushi" "sushi"
generate "cold noodles" "cold_noodles"
generate "hot dog" "hot_dog"
generate "hamburger" "hamburger"
generate "roast duck" "roast_duck"
generate "dim sum" "dim_sum"
generate "America" "America"
generate "Italy" "Italy"
generate "France" "France"
generate "Japan" "Japan"
generate "China" "China"
generate "a cup of lemon tea" "a_cup_of_lemon_tea"
generate "a cup of hot chocolate" "a_cup_of_hot_chocolate"
generate "a glass of cola" "a_glass_of_cola"
generate "a glass of apple juice" "a_glass_of_apple_juice"
generate "a plate of fried noodles" "a_plate_of_fried_noodles"
generate "a plate of fried rice" "a_plate_of_fried_rice"
generate "a bowl of congee" "a_bowl_of_congee"
generate "a bowl of dumplings" "a_bowl_of_dumplings"
generate "a bar of chocolate" "a_bar_of_chocolate"
generate "a loaf of bread" "a_loaf_of_bread"
generate "a bottle of water" "a_bottle_of_water"
generate "a packet of sweets" "a_packet_of_sweets"
generate "two plates of fried noodles" "two_plates_of_fried_noodles"
generate "three glasses of apple juice" "three_glasses_of_apple_juice"
generate "a can of cola" "a_can_of_cola"
generate "a tin of fish" "a_tin_of_fish"
generate "a piece of cheesecake" "a_piece_of_cheesecake"
generate "a carton of milk" "a_carton_of_milk"
generate "hard" "hard"
generate "soft" "soft"

echo ""
echo "=== All done! Files: ==="
ls -1 *.ogg | sort
