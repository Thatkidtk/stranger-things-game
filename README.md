# 2D Fear

2D stealth escape horror prototype focused on sound-first stealth.

## How to run and play

### Install and open

- Install Godot 4.x (not 3.x).
- Open the project at `godot/project.godot`.

### Run

- Press Play (or F5) to run `godot/scenes/main.tscn`.

### Controls

- Move: WASD or arrow keys (left stick also works).
- Crouch: C.
- Toggle sound debug: F1.

### What you should see

- A top-down room with a square player.
- Expanding sound rings while moving (debug only).

## Troubleshooting

- No movement: click inside the game window to capture input.
- No sound rings: press F1 to toggle debug drawing.
- Project fails to open: confirm you are using Godot 4.x.

## Dev workflow

- Edit movement and footstep tuning in `godot/scripts/player.gd`.
- Edit room visuals and sound debug drawing in `godot/scripts/room.gd`.
- Main scene is `godot/scenes/main.tscn`.
- Roadmap lives in `ROADMAP.md`.
