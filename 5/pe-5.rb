class Integer
  def prime_factors
    return [self] if self.prime?
    f = []
    i = self
    while i > 1
      f << (2..i).to_a.reverse.find {|x| self.evenly_divisible_by?(x) && x.prime?}
      i = i / f.last
    end
    f
  end

  def prime?
    return true if self <= 2
    return false if self & 1 == 0
    (3..(Math.sqrt(self).to_i)).step(2).none? { |i| self%i == 0 }
  end

  def evenly_divisible_by? x
    self / x * x == self
  end

  def prime_factorize 
    factors =  self.prime_factors
    p = {}
    self.prime_factors.each do |f|
      unless p.key? f
        p[f] = 1
      else
        p[f]= p[f] + 1
      end
    end
    p
  end
end


def smallest_num_divisiable_from_one_to x
  polynomials = {} 
  (2..x).to_a.reverse.each do |n|
    n.prime_factorize.each do |k, p|
      polynomials[k] = p if !polynomials.has_key?(k) || polynomials[k] < p
    end
  end

  s = 1
  polynomials.each do |k, v|
    s *= k ** v
  end
  s 
end

puts "Smallest number divisiable from 1 to 20 is #{smallest_num_divisiable_from_one_to(20)}"
#puts 20.polynomial
