actor Main
  new create(env: Env) =>
    
    let number : F64 = 3
    // let numbEr : F64 = 3 / 1
    // let numbEr : F64 = 3 / 0
    // let numbEr : F64 = (3 / 0) * 0
    // let numbEr : F64 = ((3 / 0) * 0) + 1
    
    env.out.print(number.string())