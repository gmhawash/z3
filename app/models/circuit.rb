class Circuit < ActiveRecord::Base

  validate :content_format

  def content_format
    g = parsed_content.split(" ")
    raise SyntaxError, "Bit size mismatch" if g.map(&:size).uniq.size > 1
  end

  def self.options_for_format
    ["compact", "netlist (not implemented)"]
  end

  def parsed_content
    @content ||= strip_comments(content)
    invalid = @content.split('').uniq - %w(0 1 + v V x \ )
    raise SyntaxError, "Invalid input found: #{invalid}" unless invalid.empty?
    @content
  end

  def n_bits
    @n_bits ||= parsed_content[:n_bits].to_i rescue 0
  end

  def gates
    return nil unless parsed_content

    g = parsed_content.split(" ")
    raise SyntaxError, "Bit size mismatch" if g.map(&:size).uniq.size > 1
    g
  end

  def file_content=(f)
    if f.present?
      val = f.read
      self[:content] = strip_comments(val)
    end
  end

  def strip_comments(text)
    return nil if text.nil?
    text.split("\n").map(&:strip).map do |line|
      value = line.split('#').first
      value.blank? ? nil : value.strip
    end.compact.join(" ")
  end
end
