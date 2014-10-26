#Eats memory like there's no tomorrow
require_relative 'term'
#Generates array of coefficients of the expansion for (x-1)^p 
#(ignoring sign, can easily be added but is unneeded for this)
#Basically a row of pascal's triangle
def coefficients p
  array = []
  ct = Term.new(p)
  array.push ct.coefficient
  p.times do |n|
    ct = ct.derive
    ct.reduce(n+1)
    array.push (ct.coefficient)
  end
  return array
end

#Expand (x-1)^p-(x^p-1) and if all coefficients are divisible by p then p is prime
def is_p? y
  if y == 1
    return false
  end
  coe = (coefficients y).reject{|x| x==1}
  coe.each do |x|
    if x % y != 0
      return false
      break
    end
  end
  return true
end

class Fixnum
  def is_prime?
    is_p? self
  end
end


puts 99999.is_prime?