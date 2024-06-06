import parcelas.*

//Parte 1
class Planta{
	var anioObtencion
	var altura
	
	method cuantasHsAlSolTolera()
	
	method esFuerte() = self.cuantasHsAlSolTolera() > 10
	
	method daNuevasSemillas() = self.esFuerte() 
	
	method espacioQueOcupa() 
	
	method obtenerAltura() = altura
	
	method obtenerAnio() = anioObtencion
	
	//Parte 4
	method esParcelaIdeal(parcela)
}

class Menta inherits Planta{
	override method cuantasHsAlSolTolera() = 6
	
	override method daNuevasSemillas() = super() or altura > 0.4
	
	override method espacioQueOcupa() = altura * 3
	
	override method esParcelaIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Planta{
	override method cuantasHsAlSolTolera(){
		if(altura < 0.5){
			return 6
		}else if(altura.between(0.5,1)){
			return 7
		}else{
			return 9
		}
	}
	
	override method daNuevasSemillas() = super() or (anioObtencion > 2007 and altura > 1)
	
	override method espacioQueOcupa() = altura / 2
	
	override method esParcelaIdeal(parcela) = parcela.hsDeSolRecibidas() == self.cuantasHsAlSolTolera()
}

class Quinoa inherits Planta{
	var hsTolerancia
	
	override method cuantasHsAlSolTolera() = hsTolerancia
	
	override method daNuevasSemillas() = super() or anioObtencion < 2005
	
	override method espacioQueOcupa() = 0.5
	
	override method esParcelaIdeal(parcela) = !(parcela.todasPlantaMasAltaQue(1.5))
}

//Parte 2
class SojaTransgenica inherits Soja{
	override method daNuevasSemillas() = false
	
	override method esParcelaIdeal(parcela) = parcela.cantMaxPlantas() == 1
}

class MentaHierbabuena inherits Menta{
	override method espacioQueOcupa() = super() * 2
}
