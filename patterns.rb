class Glob
  def match(pattern, filenames)

    # take the pattern and interpret it into regex
    pattern.gsub!("?", ".?")
    pattern.gsub!("*", ".*")
    matched_array = []
    # return matching filenames in new array
    filenames.map do |filename|
        if /^#{pattern}/.match(filename)
            matched_array << filename
        end
    end
    matched_array
  end
end


  puts ["abcd", "dabc", "abc"] == Glob.new.match("?abc*", ["abcd", "dabc", "abc", "efabc", "eadd"])

  puts ["abcd", "dabc", "abc"] == Glob.new.match("?a**c*", ["abcd", "dabc", "abc", "efabc", "eadd"])
