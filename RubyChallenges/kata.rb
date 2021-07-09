def is_isogram(string)
    string = string.downcase.split(//)
    unique_string = string.uniq
  
    if unique_string.length == string.length
      return true
    else
      return false
    end
  
  end
  






  
  # not sure why you don't need the return true or false section in this one from the site

  def kata_is_isogram(string)
    letters = string.downcase.chars
    letters == letters.uniq
  end


  # what is this notation?

  def is_isogram(string)
    letters = string.downcase().split("")
    letters == letters.uniq ? true : false
  end
  