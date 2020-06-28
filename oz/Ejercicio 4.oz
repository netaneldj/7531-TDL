4) Previo a la ejecución del código, realizamos el siguiente análisis con respecto a los posibles Browses del código:
	Output 1: Saldrá por el case 1 cualquier registro con separador pipe ('|') y primer elemento 'a'.
	Output 2: Saldrá por el segundo case todo registro de tipo f (nombre del registro), cuyo único elemento sea una 'a'.
	Output 3: Tomarán el tercer case todos los registros cuyo primer elemento sea igual al segundo.
	Output 4: El cuarto case marcará todos los registros que tengan más de un elemento.
	Output 5: Serán del quinto case todos los elementos que sean de un registro tipo 'f'.
	Output 6: Cualquier elemento que no cumpla ninguna de las condiciones anteriores saldrán por la salida por defecto.

En base a este análisis hecho, los siguientes casos de Tests se repartirán de la siguiente manera:

{Test [b c a]}			% Case 4
	% No toma ninguna de las primeras 3 salidas y es un registro de 3 elementos.
{Test f(b(3))}			% Case 5 
	% No toma ninguna de las primeras 4 salidas y es un registro con separador 'f'.
{Test f(a)}				% Case 2
	% No toma la primer salida y es un registro de separador 'f' con un invariante 'a'.
{Test f(a(3))}			% Case 5
	% No toma ninguna de las primeras 4 salidas y es un registro con separadaor 'f'.
{Test f(d)}				% Case 5
	% No toma ninguna de las primeras 4 salidas y es un registro con separadaor 'f'.
{Test [a b c]}			% Case 1
	% Es un registro de separador '|' (una lista común) y primer elemento 'a'.
{Test [c a b]}			% Case 4
	% No toma ninguna de las primeras 3 salidas y es un registro de 3 elementos.
{Test a|a}				% Case 1
	% Es un registro de separador '|' (una lista común) y primer elemento 'a'.
{Test '|'(v b)}			% Case 4
	% No toma ninguna de las primeras 3 salidas y es un registro de 3 elementos.
{Test '|'(a a)}			% Case 1
	% Es un registro de separador '|' (una lista común) y primer elemento 'a'.
{Test '|'(b b)}			% Case 3
	% No toma ninguna de las primeras 2 salidas y es un registro cuyo primer elemento ('b') es igual al segundo ('b').
{Test '|'(a b c)}		% Case 1
	% Es un registro de separador '|' (una lista común) y primer elemento 'a'.
{Test '|'(a [b c])}		% Case 1
	% Es un registro de separador '|' (una lista común) y primer elemento 'a'.