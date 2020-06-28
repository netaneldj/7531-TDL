actor Main

  fun sumar(x : F64, y : F64) : F64 => x + y
  fun sumar(x : String, y : String) : String => "No puedo sumar Strings"

  new create(env: Env) =>
    
    env.out.print(sumar(1, 2).string())
    env.out.print(sumar("1", "2").string())