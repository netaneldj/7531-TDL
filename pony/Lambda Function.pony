use "collections"
    
actor Main
  new create(env: Env) =>
    
    let list = List[U32].from([1; 2; 3; 4]) 
    
    for number in list.filter({(number : U32) : Bool => number % 2 == 0}).values() do
      env.out.print(number.string())
    end