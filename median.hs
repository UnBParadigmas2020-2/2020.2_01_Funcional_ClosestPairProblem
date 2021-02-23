data Point = Point { x :: Int, y :: Int } deriving Show

points = [Point 1 1, Point 2 2, Point 3 3, Point 4 4, Point 5 5, Point 6 6]

pair x
  | mod x 2 == 0 = True
  | otherwise = False

getMiddle left right 
  | pair (left + right) = quot (left + right) 2
  | otherwise = quot (left + right) 2 + 1

median points left right = points !! getMiddle left right

main = print(median points 0 (length points - 1))
