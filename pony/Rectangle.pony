class Rectangle
  let height: U32
  let width: U32
  
  new create(height': U32, width': U32) =>
    height = height'
    width = width'
  
  new square(size: U32) =>
    height = size
    width = size
    
  fun /* box */ perimeter(): U32 =>
    (height * 2) + (width * 2)
    
  fun /* box */ area(): U32 =>
    height * width
    
actor Main
  new create(env: Env) =>
    
    let rectangle = Rectangle(10, 8)
    let square = Rectangle.square(8)
    env.out.print("The perimeter of the rectangle is: " + rectangle.perimeter().string())
    env.out.print("The area of the rectangle is: " + rectangle.area().string())
    env.out.print("The perimeter of the square is: " + square.perimeter().string())
    env.out.print("The area of the square is: " + square.area().string())
    env.out.print("The area of the square is: " + square.area().string())