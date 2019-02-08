/*
Transforma una duracion del tipo 49:10:15 al formato admitido por Power Query (M)
Ejemplo: 49:10:15 = 2.01:10:15
*/

let fn = (Valor as text) as duration =>
    let
        Source = Valor,
        Horas = Text.BeforeDelimiter(Source,":"),
        HorasFinal = Text.From(
    in
        Union
in
    fn