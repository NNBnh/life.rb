<h1 align="center"><a href="https://wikipedia.org/wiki/Conway's_Game_of_Life">Conway's Game of Life</a></h1>
<p align="center">But in Ruby</p>
<p align="center"><img src="https://user-images.githubusercontent.com/43980777/166968542-6a006552-4ec3-4173-b9d5-c68e54be092e.png"></p>
<p align="center">
  <a href="https://github.com/NNBnh/life.rb/blob/main/LICENSE"><img src="https://img.shields.io/github/license/NNBnh/life.rb?labelColor=B3475B&color=DE5D6E&style=for-the-badge" alt="License: GPL-3.0"></a>
  <a href="https://gist.github.com/NNBnh/9ef453aba3efce26046e0d3119dab5a7#development-completed"><img src="https://img.shields.io/badge/development-completed-%23DE5D6E.svg?labelColor=B3475B&style=for-the-badge&logoColor=FFFFFF" alt="Development completed"></a>
</p>

## ⌨️ Usage

Download [the file](https://github.com/NNBnh/life.rb/blob/main/life.rb) then load it in `irb`:

```rb
require_relative "path/to/life"
```

For convenience, use this board generator:

```rb
def universe_gen(d = 16, r = 0.1) d = [d, d] if Array(d).one?; Array.new(d[1]) { Array.new(d[0]) { rand <= r } } end
```

Then start the simulation:

```rb
GameOfLife.new(universe_gen([64, 32], 0.075)).play
```

## 💌 Credits

Special thanks to:
- [**APL + Game of Life = ❤️**](https://www.youtube.com/watch?v=pMslgySQ8nc) by [Code_report](https://www.youtube.com/channel/UC1kBxkk2bcG78YBX7LMl9pQ)
- [**Game of Life**](https://wikipedia.org/wiki/Conway's_Game_of_Life) by [John Horton Conway](https://wikipedia.org/wiki/John_Horton_Conway)

<br><br><br><br>

---

> <h1 align="center">Made with ❤️ by <a href="https://github.com/NNBnh"><i>NNB</i></a></h1>
>
> <p align="center"><a href="https://www.buymeacoffee.com/nnbnh"><img src="https://img.shields.io/badge/buy_me_a_coffee%20-%23F7CA88.svg?logo=buy-me-a-coffee&logoColor=333333&style=for-the-badge" alt="Buy Me a Coffee"></a></p>
