# People Collector (POC)
_Working Title: **Alya**_

A text-based proof of concept for a game about fostering relationships within your questing party! The idea is that I can use this to rough out some gameplay ideas without getting bogged down with details like "making it look pretty."

I am developing this game using the Godot engine. As a template, I started with the text-based adventure from this repo: https://github.com/hashbangcode/godot-text-adventure

## Playing the Game
The proof of concept is live on [arrudabaga.com](https://arrudabaga.com/). Try it out!

### [~ Play Alya! ~](https://arrudabaga.com/people-collector/alya.html)

### Instructions
You play as Alya, a teenage girl in a fantasy/steampunk world. Use text commands to navigate the game.

To execute a command, type it into the prompt and hit enter.

Some commands require a parameter, which can be one or more words specifying the target of the command. This is indicated by `<` `>` angle brackets in the list below and in the in-game `help` menu. For example, to examine a pickle jar, type `examine pickle jar`.

Some commands can be executed by typing the first letter of the command word. This is indicated by `[` `]` square brackets. For example, to view your inventory, you can type either the full word `inventory` *or* simply the letter `i`.

Some commands can be executed with or without an optional preposition. This is indicated by `(` `)` parentheses. For example, to go to your room, you can type `go my room` or `go to my room`.

**Instruction Reference (viewable in-game by typing `help`):**
```
HELP:
  examine <target>     | Get more information about a target
  take <item>          | Pick up an item
  [i]nventory          | See all the items you are carrying
  [m]ap                | View a map of the area
  [g]o (to) <location> | Go to a location on the map
                       |
  [c]ontinue           | Advance text when you see '...'
  restart              | Restart game from the beginning 
  help                 | Open this help menu
```

### (Extremely) Limited Language Model
Since this is just a proof of concept, I'm trying **not** to distract myself by perfecting the language-processing element of this game. Sophisticated text-based games often recognize commands and items by many different names, but this is not the case here.

In *Alya*, there is always **just one thing** a given location or object can be called. Make sure to pay close attention to the syntax in the object's description. For example, to examine the doll house in your room, you *must* include the space between the two words, as in `examine doll house`. The game will not recognize `examine dollhouse` or any other variation.

The name I choose for a given object is usually going to be its **simplest** form, omitting any unnecessary adjectives. If `examine writing desk` doesn't work, try simply `examine desk`.

If it starts to get inhibitive or confusing, or if a lot of people who aren't me wind up playing this, I might put in some effort down the road to improve the player experience here. For now, the plan is to prioritize simplicity on the end of the developer (me). `:)`

## Development Progress
You can see what I'm currently working on and what's on deck by checking out the [project board](https://github.com/users/narruda789/projects/2/views/1). The **Ready** column is for everything I've decided to implement, with the highest-priority items at the top. Anything in the **Backlog** is up for consideration but might need to be refined before it can be prioritized (or might not make the cut at all).

### Feedback and Contributing
I would **love** to hear your feedback! Submit a suggestion [here](https://github.com/narruda789/people-collector-poc/issues) by creating an issue (click the big green `New issue` button to the right of the search bar). Any issues you submit will go into the project backlog, where I will determine whether to implement them.

If you're feeling inspired and want to dive into the code yourself, you can fork the repository and open a pull request with your suggested changes! See GitHub's [help page](https://docs.github.com/en/get-started/exploring-projects-on-github/contributing-to-a-project) for contributing to a project.

## Sprint 0
### Personas
**Annika** the gamer...
- enjoys chill, story-based games like Stardew Valley and The Sims
- likes management sims, but gets overwhelmed by too much micromanagement
- loves fantasy and steampunk genres

**Nicole** the dev...
- has dabbled in game dev and visual design, but it's still very new to her
- loves to write and is excited to focus on the story for her game
- prefers to find solutions through trial-and-error

### Value Stories
**AS** Annika,\
**I WANT** to play a low-key, story-based management sim\
**SO THAT** I can enjoy the story without getting stressed by the gameplay.

**AS** Nicole,\
**I WANT** a text-based proof of concept for my game\
**SO THAT** I can work out mechanics and story without worrying about visual design.
