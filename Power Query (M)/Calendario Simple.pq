// Crea un listado de fechas segun los parametros indicados

let fn = (Inicio as date, optional Fin as date) =>
let
    Origen = 
        Table.FromList(
            List.Dates(
                Inicio, 
                Duration.TotalDays(
                    (
                        if Fin = null then 
                        Date.From( DateTime.FixedLocalNow() ) else Fin
                    ) - Inicio
                ) + 1, #duration(1,0,0,0)
            ),Splitter.SplitByNothing(), null, null, ExtraValues.Error
        ),
    Renombrar = Table.TransformColumnTypes(
        Table.RenameColumns(
            Origen,
            {"Column1","Fecha"}
        ),{{"Fecha", type date}}
    ),
    Año = Table.AddColumn(
        Renombrar, "Año", each Date.Year([Fecha]), type number
    ),
    Mes = Table.AddColumn(
        Año, "Mes", each Date.Month([Fecha]), type number
    ),
    NombreMes = Table.AddColumn(
        Mes, "Nombre Mes", each Date.MonthName([Fecha]), type text
    ),
    Dia = Table.AddColumn(
        NombreMes, "Dia", each Date.Day([Fecha]), type number
    ),
    DiaSemana = Table.AddColumn(
        Dia, "Dia Semana", each Date.DayOfWeek([Fecha]), type number
    ),
    NombreDia = Table.AddColumn(
        DiaSemana, "Nombre Dia Semana", each Date.DayOfWeekName([Fecha]), type text
    )
in
    NombreDia
in fn
