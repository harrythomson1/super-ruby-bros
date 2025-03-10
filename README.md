# Super Ruby Bros

A **Super Mario Bros-inspired** platformer built with **Ruby and Ruby2D**. This project demonstrates **game development fundamentals** using Ruby, including **collision detection, sprite animations, and physics interactions**.

## 🚀 Features

- 🎮 **Classic platforming mechanics** – jump, run, and avoid obstacles
- 🏆 **Coin collection & score tracking**
- 🏗 **Basic enemy AI** – avoid hazards!
- 🎨 **Pixel-art style graphics**
- 🎵 **Sound effects & background music**
- ⚡ **Built with Ruby and Ruby2D**

## 🛠 Tech Stack

- **Language:** Ruby
- **Game Library:** Ruby2D
- **Physics & Collision:** Custom implementation

---

## 📦 Installation & Running the Game

### **Prerequisites**
- Install **Ruby** (Recommended: version 3.2.2 or later)
- Install **Bundler**
- Install **Ruby2D dependencies** (SDL2)

### **Setup**
1. **Clone this repository:**
   ```
   git clone https://github.com/harrythomson1/super-ruby-bros.git
   cd super-ruby-bros
2. **Ensure you are using the correct Ruby version (via rbenv):**
   ```
   rbenv global 3.2.2
   rbenv rehash
3. **Install dependencies:**
   ```
   bundle install
4. Ensure Ruby2D dependencies(SDL2) are installed:
   ```
   brew install sdl2 sdl2_image sdl2_mixer sdl2_ttf
   brew link --overwrite sdl2
5. **Run the game:**
   ```
   ruby lib/super_ruby_bros.rb
## 🎮 Controls

| Key         | Action      |
|------------|------------|
| W Key | Move Left  |
| D Key | Move Right |
| Spacebar    | Jump       |
