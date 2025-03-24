# ADR 2: Color Palette

## CONTEXT
I have a few colors that go well together. I want to find some more colors in this scheme that I can use, particularly for the game text. I like the current beige (`#F2E5BF`) background, and I like the monospace serif font I found (the only one I could find for free—WITH an Adobe subscription). Neither the dark teal (`#257180`) nor dark orange (`#CB6040`) of my current scheme looks great on the beige in this font, though.

I found [coolors.co](https://coolors.co) to help generate some more colors in this same palette. Names of colors below also come from Coolors.

### Original Colors

    caribbean current: #257180
    jasper: #CB6040
    atomic tangerine: #FD8B51
    dutch white: #F2E5BF

### Candidate Colors

    raisin black: #1D1E2C
    eggplant: #472836
    caput mortuum: #482728
    rosy brown: #DC9596
    dark cyan: #558C8C
    dark slate gray: #1b5050
    gunmetal: #0F2E2E
    ivory: #FBFCEE
    eggshell: #F8F1DD
    charcoal: #373F51
    hunter green: #44633F
    feldgrau: #3F4B3B
    rose ebony: #563635


I tested the contrast by trying each text color against the Dutch White, running the app locally in the browser (Firefox), and using the dev tools Accessibility pane to simulate no color. These provided the best contrast:

    BACKGROUND:
    dutch white: #F2E5BF

    TEXT:
    raisin black: #1D1E2C
    caput mortuum: #482728
    gunmetal: #0F2E2E

I liked Gunmetal on Dutch White, but it still wasn't _quite_ doing it for me. I tried it in a slightly lighter shade and got Eggshell, which lets me use slightly lighter text colors, which in turns lets us see the color of the text a bit better. Good-looking options on Eggshell include:

    BACKGROUND:
    eggshell: #F8F1DD

    TEXT:
    dark purple: #301934
    dark slate gray: #1b5050
    hunter green: #44633F
    rose ebony: #563635
    sienna: #752306

I think Dark Purple and Dark Slate Gray are my favorites here. Dark Purple gives better contrast, while the color of Dark Slate Gray is easier to discern.

Contrast and readability need to be the first priority, though.

## DECISION
Use the following color scheme:

    background: Eggshell #F8F1DD
    text: Dark Purple #301934

## IMPACT
This is definitely subject to change. I think the font is actually a bigger issue than the color, but since a monospace serif font is sort of hard to come by, I'm stuck with what I have for now. Down the road, if I still don't like the look and feel, a different font is probably a better solution.

Ultimately, I've been considering a more eggplanty color scheme for Alya herself. I have a vision of a dark-skinned girl with black hair in a purple dress.