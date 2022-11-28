class GameOfLife
  def initialize(
    universe = Array.new(16) { Array.new(16) },
    draw_mode: :normal, chars: :ascii, speed: 0.1
  )
    @universe = universe
    @draw_mode = draw_mode
    @chars = chars
    @speed = speed
  end

  attr_accessor :universe

  def iter
    @universe = @universe.map.with_index do |line, y|
      line.map.with_index do |_col, x|
        [*(y == 0 ? 0 : y - 1)..(y == @universe.size - 1 ? y : y + 1)].map do |ny|
          [*(x == 0 ? 0 : x - 1)..(x == line.size - 1 ? x : x + 1)].map do |nx|
            @universe[ny][nx] ? 1 : 0
          end
        end
        .flatten(1).sum.between?(3, 4)
      end
    end
  end

  def draw(chars = @chars)
    chars = {
      ascii: " .':",
      block: ' ▄▀█',
    }[chars]

    @universe.then { _1.size.odd? ? _1 + [[false] * _1[0].size] : _1 }
    .each_slice(2).to_a.map(&:transpose)
    .map do |dua_lines|
      dua_lines.map do |dua_spaces|
        chars[dua_spaces.map { _1 ? ?1 : ?0 }.join.to_i(2)]
      end
      .join
    end
    .join("\n")
  end

  def draw_big(chars = @chars)
    chars = {
      ascii: {
        false => '  ',
        true  => '[]',
      },
      block: {
        false => '  ',
        true  => '██',
      },
    }[chars]

    @universe.map do |line|
      line.map { chars[_1] }.join
    end
    .join("\n")
  end

  def play
    loop do
      puts "\e[2J\e[H"
      return if @universe.flatten.compact.empty?
      puts @draw_mode == :big ? self.draw_big : self.draw
      sleep @speed
      self.iter
    end
  end
end