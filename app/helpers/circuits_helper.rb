module CircuitsHelper

  def render_term(target, nbits=nil, control=nil)
    if target.is_a? String
      str = target.split('')
      raise ArgumentError, "number of bits are invalid for #{target}" if( nbits and nbits != str.size )

      nbits = str.size
      target = control = 0
      str.each do |char|
        target  <<= 1
        control <<= 1
        target  |= 1 if char == '+'
        control |= 1 if char == '1'
      end
    end

    gates = []
    target_pos = target_position(target)
    left, right = bounding_controls(control, target_pos)

    list = [EMPTY] * nbits

    return list if target == 0

    if control == 0
      list[target_pos] = NOT
      return list.reverse
    end

    (right..left).each do |index|
      combo = (target >> (index-1) & 2) + (control >> (index) & 1)
      list[index] = case combo
        when 0b00: WIRE
        when 0b01:
          case index
            when left: CTRL_BOTTOM
            when right: CTRL_TOP
            else CTRL_BOTH
          end
        when 0b10:
          case index
            when left: NOT_BOTTOM
            when right: NOT_TOP
            else NOT_BOTH
          end
        else INVALID
      end
    end

    list.reverse
  end

  def target_position(target)
    return nil if target == 0
    @bit_array ||= bit_array

    count = 0
    index = nil
    offset = 1

    while target > 0
      word = target & 0xffff
      target >>= 16
      offset += 16
      next if word == 0

      index = @bit_array.index(word) + offset - 16

      count += 1
    end

    raise ArgumentError unless count == 1
    index - 1
  rescue
    raise ArgumentError
  end

  def bit_array
    (0..15).inject([]) {|r,i| r << (1 << i)}
  end

  def bounding_controls(control, target)
    return [0,0] if control == 0

    right = left = nil

    (0..(control.size*8)).each do |index|
      bit = control & 1
      if bit == 1
        left = index
        right = index if right == nil
      end

      control >>= 1
    end

    [ [left, target].max, [target,right].min ]
  end
end
