let fn = (FechaInicio as date, FechaFin as date) as text=>
    let
        Source = List.Dates(
            FechaInicio, 
            Duration.TotalDays(FechaFin - FechaInicio), 
            #duration(1,0,0,0)
        ),
        Tabla = Table.FromList(
            Source, 
            Splitter.SplitByNothing(), 
            null, 
            null, 
            ExtraValues.Error
        ),
        CambiarTipo = Table.TransformColumnTypes(
            Tabla,{
                {"Column1", type date}
            }
        ),
        Mes = Table.AddColumn(
            CambiarTipo, 
            "Month", 
            each Date.Month([Column1]), 
            Int64.Type
        ),
        Año = Table.AddColumn(
            Mes, 
            "Year", 
            each Date.Year([Column1]), 
            Int64.Type
        ),
        QuitaDuplicados = Table.Distinct(
            Año, 
            {"Month", "Year"}
        ),
        Concatenar = List.Accumulate(
            QuitaDuplicados[Month],
            "", 
            (x,y) => 
                if Text.From(x) = "" then 
                Text.From(x) & Text.From(y) else 
                Text.From(x) & "," & Text.From(y)
        )
    in
        Concatenar
in 
fn