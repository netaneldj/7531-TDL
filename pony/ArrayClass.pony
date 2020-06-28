class Array[A] is seq[A]
  """Creo las variables"""
  var _size: USize
  var _alloc: USize
  var _ptr: Pointer[A]
  
  new  create(len: USize = 0) =>
    """Creo un arreglo con cero elementos pero espacio para len elementos"""
    _size = 0
    _alloc = len
    _ptr = Poniter[A]._alloc(len)
  
  new init(from: A^, len: USize) =>
    """Creo un array para len elementos, todos inicializados con un valor dado"""
    _size = len
    _alloc = len
    _ptr = Pointer[A]._alloc(len)
    var i: USize = 0
    while i<len do
      _ptr.update(i,from)
      i = i+1
    end
  
  new undefined[B: (A & Real[B] val & number) = A](len: USize) =>
  	"""Creo un array de len elementos, poblandolo con memoria aleatoria. Esto esta solo permitido para un array numerico."""
	_size = len
	_alloc = len
	_ptr = Pointer[A]._alloc(len)

  new from_cstring(ptr: Pointer[A], len: USize, alloc: USize = 0) =>
	"""Crea un array de un puntero del estilo c y de una longitud. El contenido no es copiado"""
	_size = len
	if alloc > len then
		_alloc = alloc
	else
		_alloc = len
	end
	_ptr = ptr
  
  fun cstring(): Pointer[A] tag =>
  	"""Devuelve el puntero de estilo C subyacente""
 	_ptr
  
  fun _cstring(): Pointer[A] box =>
  	"""internal cstring"""
	_ptr
	
  fun size(): USize =>
    """El numero de elementos del array"""
	_size
    
  fun space(): USize =>
  	"""El espacio disponible en el array"""
    _alloc
	
 fun ref reserve(len: USize): Array[A]^ =>
 	"""Reserva espacio para len elementos, incluyendo cualquier elemento que este en el array"""
	if _alloc < len then
	_alloc = len.max(8).ponyint_next_pow2()
	_ptr() = _ptr._realloc(_alloc)
	end
	this
  
  fun apply(i: USize): this->A ? =>
  	"""Obtiene el elemento i-esimo, lanzando un error si el indice no pertenece"""
    if i < _size then
      _ptr._apply(i)
    else
      error
    end
  
  fun ref update(i: USize, value: A): A^ ? =>
  	"""cambia el i-esimo elemeto, lanza un error si el indice no pertenece"""
    if i < _size then 
      _ptr._update(i, consume value)
    else
      error
    end
  
  fun ref insert(i:USize, value: A): Array[A]^ ? =>

actor Main
  new create(env: Env) =>
  
    let number : F64 = (3 / 0) * 0
    
    env.out.print(number.string())
    
