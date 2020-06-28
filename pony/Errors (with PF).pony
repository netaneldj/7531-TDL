class CuentaBancaria
  let _cbu : String
  var _saldo : F64
  
  new create() =>
    _cbu = "01547PQ52"
    _saldo = 0
    
  new createConSaldo(saldo : F64) =>
    _cbu = "01547PQ52"
    _saldo = saldo
    
  fun box obtenerSaldo() : F64 => _saldo
  fun box puedoExtraer(monto : F64) : Bool => _saldo > monto
  fun box haySaldo() : Bool => _saldo > 0
  
  fun ref depositar(monto : F64) => _saldo = _saldo + monto
  // Partial Function
  fun ref extraer(monto : F64)? => 
    if (_saldo < monto) then
      error
    else
      _saldo = _saldo - monto
    end


actor Main
  new create(env: Env) =>
    
    let cuenta = CuentaBancaria.createConSaldo(5000)
    
    try
      env.out.print("Saldo: " + cuenta.obtenerSaldo().string())
      cuenta.extraer(2500)?
      env.out.print("Saldo: " + cuenta.obtenerSaldo().string())
      cuenta.extraer(300)?
      env.out.print("Saldo: " + cuenta.obtenerSaldo().string())
      cuenta.extraer(300)?
      env.out.print("Saldo: " + cuenta.obtenerSaldo().string())
      cuenta.extraer(300)?
      env.out.print("Saldo: " + cuenta.obtenerSaldo().string())
      cuenta.extraer(3000)?
      env.out.print("Saldo: " + cuenta.obtenerSaldo().string())
    else
      env.out.print("No dispone suficiente saldo para realizar la operacion")
    then
      env.out.print("Gracias por operar en nuestra red")
    end