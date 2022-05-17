require "io/console"

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

  def universe
    @universe
  end

  def iter
    @universe.each_with_index.map do |line, y|
      line.each_with_index.map do |_col, x|
        [*(y == 0 ? 0 : y - 1)..(y == @universe.size - 1 ? y : y + 1)].map do |ny|
          [*(x == 0 ? 0 : x - 1)..(x == line.size - 1 ? x : x + 1)].map do |nx|
            @universe[ny][nx] ? 1 : 0
          end
        end
        .flatten(1).sum.between?(3, 4)
      end
    end
  end

  def iter!
    @universe = self.iter
  end

  def draw(chars = @chars)
    case chars
    when :ascii then " .':"
    when :block then " ▄▀█"
    end => chars

    @universe.then { _1.size.odd? ? _1 + [[false] * _1[0].size] : _1 }
    .each_slice(2).to_a.map(&:transpose)
    .map do |dua_lines|
      dua_lines.map do |dua_spaces|
        chars[dua_spaces.map { _1 ? "1" : "0" }.join.to_i(2)]
      end
      .join
    end
    .join("\n")
  end

  def draw_big(chars = @chars)
    case chars
    when :ascii then ["  ", "[]"]
    when :block then ["  ", "██"]
    end => chars

    @universe.map do |line|
     line.map { |col| col ? chars[1] : chars[0] }.join
    end
    .join("\n")
  end

  def play
    loop do
      IO.console.clear_screen
      return if @universe.flatten.compact.empty?
      puts @draw_mode == :big ? self.draw_big : self.draw
      sleep @speed
      self.iter!
    end
  end
end
