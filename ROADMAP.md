# 2D Stealth Escape Horror Game - Development Roadmap

Core fantasy: You are not hunted because you are seen. You are hunted because the world heard you exist.

This roadmap takes the project from blank folder to shippable prototype to polished vertical slice. It is written to support iterative development, frequent testing, and intentional rule-breaking as a design weapon.

---

## Phase 0 - Concept Lock and Design Spine

Goal: Eliminate ambiguity before code exists.

### 0.1 Core Decisions (Lock These)
- Perspective: Top-down 2D (preferred for sound cones + clarity)
- Engine: Godot 4.x (GDScript)
- Input: Keyboard + controller (design for keyboard first)
- Session length: 10-20 minutes per run
- Tone: Minimal UI, environmental storytelling

### 0.2 Non-Negotiable Rules
- Enemies do not see - sound only
- Light affects both player visibility and enemy aggression
- Vecna never appears as a chase enemy
- Fear comes from systems betrayal, not jumpscares

### 0.3 Player Fantasy Statement

"I am quiet, clever, and observant - until the rules betray me."

Write this at the top of your main design doc. If a feature does not serve it, cut it.

---

## Phase 1 - Project Setup and Skeleton

Goal: Get something controllable on screen ASAP.

### 1.1 Project Initialization
- Create Godot project
- Folder structure:
  - scenes/
  - scripts/
  - entities/
  - levels/
  - ui/
  - audio/

### 1.2 Player Controller (MVP)
- 2D movement (walk, crouch)
- Movement speed variable
- Footstep sound events (no enemies yet)

Deliverable: A player square moving in a room with sound debug output.

---

## Phase 2 - Sound as a First-Class Mechanic

Goal: Sound replaces vision entirely.

### 2.1 Sound Emission System
- Every player action emits a sound event:
  - Walking
  - Running
  - Dropping objects
  - Interacting with doors
- Each sound has:
  - Radius
  - Intensity
  - Decay time

### 2.2 Sound Visualization (Debug Only)
- Draw expanding sound circles
- Color-coded by intensity
- Toggleable debug mode

Deliverable: You can see sound behaving consistently.

---

## Phase 3 - Demogorgon AI (Sound Cones)

Goal: Make enemies legible, predictable, and terrifying.

### 3.1 Patrol State Machine
- Idle
- Patrol
- Investigate Sound
- Aggressive Search

### 3.2 Sound Cone Logic
- Forward-biased hearing cone
- Distance attenuation
- Obstruction dampening (walls reduce sound)

### 3.3 Player Feedback
- Subtle audio cue when enemy is alert
- Animation change when cone locks on

Deliverable: One enemy reliably hunts sound, not sight.

---

## Phase 4 - Light System (The Double-Edged Sword)

Goal: Light gives safety and danger.

### 4.1 Light Sources
- Static lights (lamps, hallways)
- Dynamic lights (flickering, player-triggered)

### 4.2 Light to Sound Interaction
- Player louder in bright light
- Enemy hearing range increases near light
- Darkness reduces sound but increases navigation difficulty

### 4.3 Player Learning Moment
- First puzzle requires turning on a light
- Second encounter punishes overuse

Deliverable: Player learns light is not safety - it is leverage.

---

## Phase 5 - Level Design Philosophy

Goal: Teach rules, then break them deliberately.

### 5.1 Level 1 - The Truth
- Clear sound rules
- Predictable enemy behavior
- No Vecna interference

### 5.2 Level 2 - The Lie
- Same rules
- Slight timing changes
- Environmental distractions

### 5.3 Level 3 - The Betrayal
- Walls pulse
- Lights flicker unpredictably
- Sound delay introduced

Each level must introduce exactly one new concept.

---

## Phase 6 - Vecna Systems (Environmental Corruption)

Goal: Break trust, not mechanics.

### 6.1 Visual Corruption
- Wall textures bleed
- Subtle screen distortion
- Level geometry subtly shifts

### 6.2 UI Corruption
- Button prompts swap
- Map occasionally lies
- Objective text reframes itself

### 6.3 Control Corruption (Limited)
- Temporary axis inversion
- Input latency spikes
- Must be reversible

Rule: Vecna effects never stack unfairly.

---

## Phase 7 - Failure and Death Design

Goal: Death teaches, never punishes.

### 7.1 Death Conditions
- Direct contact with enemy
- Overwhelming sound buildup

### 7.2 Post-Death Feedback
- Highlight last sound event
- Replay enemy path
- No blame language

Deliverable: Player understands why they died.

---

## Phase 8 - Audio and Atmosphere Pass

Goal: Let sound do 70% of the horror work.

- Directional audio
- Low-frequency tension hum
- Silence as a mechanic

No music during stealth.

---

## Phase 9 - Polish and Vertical Slice

Goal: One unforgettable 20-minute experience.

### 9.1 Remove Debug Crutches
- Disable sound visualizers
- Tighten feedback

### 9.2 Balance Pass
- Enemy speed
- Sound radius forgiveness
- Light risk/reward

### 9.3 Build and Share
- Package demo
- Gather player confusion points
- Fix only clarity, not difficulty

---

## Phase 10 - Post-Prototype Decisions

Choose one:
- Expand levels
- Add new enemy types
- Add co-op asymmetry
- Stop and ship as an art piece

Stopping is allowed.

---

## Guiding Principle (Pin This)

Horror is not chaos. Horror is rules collapsing at the moment you rely on them.
