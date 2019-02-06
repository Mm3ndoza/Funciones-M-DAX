/*
Transforma una duracion del tipo 49:10:15 al formato admitido por Power Query (M)
Ejemplo: 49:10:15 = 2.01:10:15
*/

let fn = (Valor as text) as duration =>
    let
        Source = Valor,
        Horas = Text.BeforeDelimiter(Source,":"),
        Dias = Text.From(Number.IntegerDivide(Number.From(Horas),24)),
        HorasFinal = Text.From(Number.Round(Number.Mod(Number.From(Horas) / 24,1) * 24,0)),
        Union = Duration.From(Dias & "." & HorasFinal & ":" & Text.AfterDelimiter(Source,":"))
    in
        Union
in
    fn