class Array[A] is seq[A]
  "Creo las variables"
  var _size: USize
  var _alloc: USize
  var _ptr: Pointer[A]
  
  new  create(len: USize = 0) =>
    "Creo un arreglo con cero elementos pero espacio para len elementos"
    _size = 0
    _alloc = len
    _ptr = Poniter[A]._alloc(len)
  
  new init(from: A^, len: USize) =>
    "Creo un array para len elementos, todos inicializados con un valor dado"
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
	"Crea un array de un puntero del estilo c y de una longitud. El contenido no es copiado"
	_size = len
	if alloc > len then
		_alloc = alloc
	else
		_alloc = len
	end
	_ptr = ptr
  
  fun cstring(): Pointer[A] tag =>
  	"Devuelve el puntero de estilo C subyacente"
 	_ptr
  
  fun _cstring(): Pointer[A] box =>
  	"internal cstring"
	_ptr
	
  fun size(): USize =>
    "El numero de elementos del array"
	_size
    
  fun space(): USize =>
  	"El espacio disponible en el array"
    _alloc
	
 fun ref reserve(len: USize): Array[A]^ =>
 	"Reserva espacio para len elementos, incluyendo cualquier elemento que este en el array"
	if _alloc < len then
	_alloc = len.max(8).ponyint_next_pow2()
	_ptr() = _ptr._realloc(_alloc)
	end
	this
  
  fun apply(i: USize): this->A ? =>
  	"Obtiene el elemento i-esimo, lanzando un error si el indice no pertenece"
    if i < _size then
      _ptr._apply(i)
    else
      error
    end
  
  fun ref update(i: USize, value: A): A^ ? =>
  	"cambia el i-esimo elemeto, lanza un error si el indice no pertenece"
    if i < _size then 
      _ptr._update(i, consume value)
    else
      error
    end
  
  fun ref insert(i:USize, value: A): Array[A]^ ? =>
  	"Inserta un elemento en el array.Elementos despues de este son movidos de a uno extendiendo el array. Si se va de indice lanza un error. El array es devuelto."
	if i <= _size then
		reserve(_size+1)
		_ptr._offset(i)._insert(1,size-i)
		_ptr.update(i,consume value)
		_size = _size + 1
		this
	else
		error
	end

  fun ref delete(i:USize): A^ ? =>
	"Borra un elemento del array. Elementos despues de este son movidos de a uno compactando el array. Si el indice o pertenece lanza un error. El elemento borrado es devuelto."
	if i < _size then
		_size = _size -1
		_ptr._offset(i)._delete(1,_size-i)
	else
		error
	end

  fun ref truncate(len: USize): Array[A]^ =>
	"Trunca un array a la longitud dada, descartando los elementos en exceso.Si el array ya es mas chico que la longitd dada, no hace nada"
	_size = _size.min(len)
	this

  fun find(value: A!, offset: USize = 0, nth: USize = 0, predicate: {(box->A!,box->A!):Bool} val = lambda(l: box->A!, r: box->A!): Bool => l is r end): USize ? =>
	"Encuentra la nth aparicion del value del value desde el principio del array"
	var i = offset
	var n = USize(0)
	
	while i <_size do
	if predicate(_ptr._apply(i),value) then
		if n == nth then
			return i
		end
		n = n + 1
	end
	i = i +1
	end
	error

  fun keys(): ArrayKeys[A, this->Array[A]]^ =>
	"Devuelve un iterador sobre los indices del array"
	ArrayKeys[A, this->Array[A]](this)

class ArrayKeys[A, B: Array[A] #read] is Iterator[USize]
	let _array: B
	var _i: USize
	
	new create(array: B) =>
		_array = array
		_ i = 0
	
	fun has_next(): Bool =>
		_i < _array.size()
	
	fun ref next(): USize =>
		if _i< _array.size() then
			_i = _i +1
		else
			_ i
		end
		
actor Main
  new create(env: Env) =>
  