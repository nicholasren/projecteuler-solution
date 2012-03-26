val multiples =  (1 until 1000).filter { (x: Int) => x % 3 ==0 || x % 5 ==0}
val sums = (0 /: multiples) { (sum, ele) => sum + ele }
println(sums)
