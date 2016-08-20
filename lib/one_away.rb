module OneAway
  def one_away(s1, s2)
    if s1.size == s2.size
      diff_count = 0

      (0...s1.size).each do |index|
        diff_count += 1 if s1[index] != s2[index]
      end

      diff_count == 1
    elsif (s1.size - s2.size).abs == 1
      s1_diff_count = 0
      s2_diff_count = 0

      s1_lookup = Hash.new(0)
      s2_lookup = Hash.new(0)

      s1.chars.each do |char|
        s1_lookup[char] += 1
      end

      s2.chars.each do |char|
        s2_lookup[char] += 1
      end

      s1_lookup.each do |key, count|
        if s2_lookup.has_key? key
          s1_diff_count += 1 if (count - s2_lookup[key]).abs == 1
        else
          s1_diff_count += 1
        end
      end

      s2_lookup.each do |key, count|
        if s1_lookup.has_key? key
          s2_diff_count += 1 if (count - s1_lookup[key]).abs == 1
        else
          s2_diff_count += 1
        end
      end

      s1_diff_count == 1 || s2_diff_count == 1
    else
      false
    end
  end

  def one_away(s1, s2)
    if s1.size == s2.size
      seen_one_away = false

      (0...s1.size).each do |index|
        if s1[index] != s2[index]
          if seen_one_away
            return false
          else
            seen_one_away = true
          end
        end
      end

      seen_one_away
    elsif (s1.size - s2.size).abs == 1
      fidx = 0
      sidx = 0

      while fidx < s1.size && sidx < s2.size do
        if s1[fidx] != s2[sidx]
          if fidx != sidx
            return false
          end

          s1.size > s2.size ? (fidx += 1) : (sidx += 1)
        else
          fidx += 1
          sidx += 1
        end
      end

      true
    else
      false
    end
  end
end
