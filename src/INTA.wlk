//Parte 6
object inta{
	const parcelas = []
	
	method promedioPlantasXParcela() = parcelas.sum({p => p.cantPlantasActuales()}) / parcelas.size()

	method parcelaMasAutosustentable() = self.candidatasAutosustentables().max(
		{p => p.cantPlantasBienAsoc()})
	
	method candidatasAutosustentables() = parcelas.filter({p => p.cantPlantasActuales() > 4})	
}
