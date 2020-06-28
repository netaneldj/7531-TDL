class CuentaBancaria
  let _cbu : String
  var _saldo : F64
  
  new create(saldo : F64 = 0) =>
    _cbu = "01547PQ52"
    _saldo = saldo
    
  fun obtenerSaldo() : F64 => _saldo
  fun puedoExtraer(monto : F64) : Bool => _saldo > monto
  fun haySaldo() : Bool => _saldo > 0
  
  fun ref depositar(monto : F64) => _saldo = _saldo + monto
  fun ref extraer(monto : F64) => _saldo = _saldo - monto


actor Main
  new create(env: Env) =>
    
    let cuenta = CuentaBancaria(5000)
    
    try
      env.out.print("Saldo: " + cuenta.obtenerSaldo().string())
      if not cuenta.puedoExtraer(2500) then
        error
      else
        cuenta.extraer(2500)
        env.out.print("Saldo: " + cuenta.obtenerSaldo().string())
        if not cuenta.puedoExtraer(300) then
          error
        else
          cuenta.extraer(300)
          env.out.print("Saldo: " + cuenta.obtenerSaldo().string())
        end
      end
    else
      env.out.print("No dispone suficiente saldo para realizar la operacion")
    then
      env.out.print("Gracias por operar en nuestra red")
    end
