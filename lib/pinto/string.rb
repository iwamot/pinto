# lib/pinto/string.rb
class String
  def camelize
    self.split('_').map{|word| word.capitalize}.join
  end
end