# to recursively work on the reduced problem
def spiral(a) 
  return [] if a.length < 1 # for a = []

  outer, inner = outer_spiral_and_inner(a)

  return outer if inner == nil # done: no inner to work on any more

  outer.concat(spiral(inner))
end

# to return the outer spiral and the rest of the matrix which is reduced by one in dimension
def outer_spiral_and_inner(a) 

  # get the dimension of the matrix
  n = Math.sqrt(a.length).to_i 

  # first row
  outer = Array.new
  for c in 0..n-1 
    outer << a[c]
  end

  if a.length > 1 # done if a.length <= 1
    # right side edge
    for r in 2..n-1 
      outer << a[r*n-1]
    end

    # last row going right to left
    (n*n-1).downto((n-1)*n) do |c| 
      outer << a[c]
    end

    # left side edge bottom up
    (n-2).downto(1) do |r| 
      outer << a[r*n]
    end

    # get the inner matrix
    inner = Array.new
    for r in 1..n-2
      for c in 1..n-2
        inner << a[r*n+c]
      end
    end
  end

  return outer, inner
end

def m_to_a(m)
  a = Array.new
  n = m.size
  for r in 0..n-1
    for c in 0..n-1
      a << m[r][c]
    end
  end
  return a
end

test_cases = [
  [[]],                      # empty matrix
 
  [[1]],                     # 1x1 matrix
 
  [[1,2],
   [3,4]],             # 2x2 matrix
 
  [[1,2,3],
   [4,5,6],
   [7,8,9]], # 3x3 matrix
 
  [[1,  2, 3,4],
   [5,  6, 7,8],
   [9, 10,11,12],
   [13,14,15,16]],
 
  [[1,  2, 3, 4,5],
   [6,  7, 8, 9,10],
   [11,12,13,14,15],
   [16,17,18,19,20],
   [21,22,23,24,25]],
 
  [[1,  2, 3, 4, 5, 6],
   [7,  8, 9,10,11,12],
   [13,14,15,16,17,18],
   [19,20,21,22,23,24],
   [25,26,27,28,29,30],
   [31,32,33,34,35,36]]
]

test_cases.each { |m|
  print spiral(m_to_a(m))
  puts
}
