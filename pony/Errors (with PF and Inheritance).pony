class CuentaCorriente
  var _cuenta : CuentaBancaria
  var _descubierto : F64
  
  new create(cbu : String, saldo : F64 = 0, descubierto : F64 = 5000) =>
    _cuenta = CuentaBancaria(cbu, saldo)
    _descubierto = descubierto

  fun box obtenerSaldo() : F64 =>
    _cuenta.obtenerSaldo()
  
  fun box obtenerDescubierto() : F64 =>
    _descubierto
    
  fun box puedoExtraer(monto : F64) : Bool =>
    (_cuenta.obtenerSaldo() + _descubierto) > monto
    
  fun box haySaldo() : Bool => 
    _cuenta.haySaldo()
  
  fun ref depositar(monto : F64) =>
    _cuenta.depositar(monto)
    
  fun ref extraer(monto : F64)? => 
    if ((_cuenta.obtenerSaldo() + _descubierto) < monto) then
      error
    else
      if (_cuenta.obtenerSaldo() > monto) then
        _cuenta.extraer(monto)?
      else
        _cuenta.extraer(_cuenta.obtenerSaldo())?
        _descubierto = _descubierto - (monto - _cuenta.obtenerSaldo())
      end
    end
  

class CuentaBancaria
  let _cbu : String
  var _saldo : F64
  
  new create(cbu : String, saldo : F64 = 0) =>
    _cbu = cbu
    _saldo = saldo
    
  fun box obtenerSaldo() : F64 => 
    _saldo
    
  fun box puedoExtraer(monto : F64) : Bool =>
    _saldo > monto
    
  fun box haySaldo() : Bool =>
    _saldo > 0
  
  fun ref depositar(monto : F64) =>
    _saldo = _saldo + monto
    
  fun ref extraer(monto : F64)? => 
    if (_saldo < monto) then
      error
    else
      _saldo = _saldo - monto
    end


actor Main

  /*
  fun descubrirCuenta(cuenta : (CuentaBancaria|CuentaCorriente)) : String =>
    match cuenta
    | let a : CuentaBancaria => "Cuenta Bancaria"
    | let b : CuentaCorriente => "Cuenta Corriente"
    else
      "No es una cuenta"
    end
  
  fun cuentaConGranDescubierto(cuenta : (CuentaBancaria|CuentaCorriente)) : String =>
    match cuenta
    | let b : CuentaCorriente if b.obtenerDescubierto() > 10000 => "Si"
    else
      "No"
    end
  */

  new create(env: Env) =>
    
    let cuenta = CuentaBancaria.create("AAG4567", 5000)
    // let cuenta2 = CuentaCorriente("AA4785", 5000)
    // let cuenta3 = CuentaCorriente("AA5874" where descubierto = 25000)
    
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
      env.out.print("No dispone suficiente saldo para realizar la operación.")
    then
      env.out.print("Gracias por operar en nuestra red.\n")
    end