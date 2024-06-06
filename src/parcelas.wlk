class Parcela{
	var ancho
	var largo
	var hsDeSol
	const plantas = []
	
	method superficie() = ancho * largo
	
	method cantMaxPlantas() = if(ancho > largo) self.superficie() / 5 
	else self.superficie() / 3 + largo
	
	method tieneComplicaciones() = plantas.any({p=>p.cuantasHsAlSolTolera() < hsDeSol})
	
	method plantar(planta){
		if(plantas.size() >= self.cantMaxPlantas() or hsDeSol >= planta.cuantasHsAlSolTolera() + 2){
			throw new Exception(message = "No fue posible plantar la planta")		
		}else{
			plantas.add(planta)
		}		
	} 
	
	method todasPlantaMasAltaQue(metros) = plantas.all({p => p.obtenerAltura() > metros})
	
	method hsDeSolRecibidas() = hsDeSol	
	
	method cantPlantasActuales() = plantas.size()
}


//Parte 5
class ParcelaEcologica inherits Parcela{
	method seAsociaBien(planta) = !(self.tieneComplicaciones()) and planta.esParcelaIdeal(self)
	
	method cantPlantasBienAsoc() = plantas.count({p => self.seAsociaBien(p)})
}

class ParcelaIndustrial inherits Parcela{
	method seAsociaBien(planta) = self.cantMaxPlantas() <= 2 and planta.esFuerte()
	
	method cantPlantasBienAsoc() = plantas.count({p => self.seAsociaBien(p)})
}
