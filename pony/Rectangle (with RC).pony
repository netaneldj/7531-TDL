class Rectangle
  let /* var */ _color: String
  let _height: I32
  let _width: I32
  
  new create(color': String = "white", height': I32, width': I32) =>
    _color = color'
    // if ((height' < 0) or (width' < 0)) then 
    //   _height = 1
    //   _width = 1
    //   return
    // end
    _height = height'
    _width = width'
    "Inicializado correctamente."
  
  new square(color': String = "white", size: I32) =>
    _color = color'
    _height = size
    _width = size
    
  fun /* box */ perimeter(): I32 =>
    (_height * 2) + (_width * 2)
    
  fun /* box */ area(): I32 =>
    _height * _width
    
  fun /* box */ color(): String => _color
  
  /* fun /* box */ /* ref */ set_color(to: String = "white"): String => _color = to
    
actor Main
  new create(env: Env) =>
    
    let rectangle = Rectangle("white", 10, 8)
    let square = Rectangle.square("black", 8)
    /* square.set_color("red") */
    env.out.print("The perimeter of the " + rectangle.color() + " rectangle is: " + rectangle.perimeter().string())
    env.out.print("The area of the " + rectangle.color() + " rectangle is: " + rectangle.area().string())
    env.out.print("The perimeter of the " + square.color() + " square is: " + square.perimeter().string())
    env.out.print("The area of the " + square.color() + " square is: " + square.area().string())
