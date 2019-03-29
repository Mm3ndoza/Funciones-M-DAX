/* Convierte una Fecha Juliana a calendario gregoriano
  Ejemplo: 12345 = 29/03/2019 */
(#"Fecha Juliana" as number) as date =>
Date.AddDays(
    #date(Number.RoundDown( #"Fecha Juliana" / 1000) + 1900,1,1),
    Number.Mod( #"Fecha Juliana" , 1000 ) -1 
)
