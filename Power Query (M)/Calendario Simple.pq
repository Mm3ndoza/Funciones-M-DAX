// Crea un listado de fechas segun los parametros indicados

let 
  fn = (#"Fecha Inicio" as date, #"Fecha Fin" as date) =>
    let
      Listado = List.Dates(#"Fecha Inicio", Duration.TotalDays(#"Fecha Fin" - #"Fecha Inicio"), #duration(1,0,0,0))
    in
      Listado
in
  fn
