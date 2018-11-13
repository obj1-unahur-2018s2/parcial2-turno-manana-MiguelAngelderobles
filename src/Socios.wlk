class Socios {
	var property actividadesRealizadas=[]
	var property adoradorDelSol=true
	var property cantActividades=0
	var property topeActividades=2
	var property edad=0
	var property idiomas=[""]
	var atrae=null
	method idiomas(_idiomas){
		idiomas.add(_idiomas)
	}
	method edad(_edad){
		edad=_edad
	}
	method topeActividades(tope){
		topeActividades=tope
	}
	
	method actividadesRealizadas(_actividades){
		return if(actividadesRealizadas.size()<topeActividades){
			actividadesRealizadas.add(_actividades)
			
		} else{
			self.error("Ya llego al tope de Acts")
		}
	}
	
	method adoradorDelSol(){
		return (actividadesRealizadas.all({act=>act.puedeBroncearse()}))
	}
	method actividadesEsforzadas(){
		return (actividadesRealizadas.filter({act=>act.haceEsfuerzo()}))
	}
	
	method atrae(){return atrae}
}

class SocioTranquilo inherits Socios{
	override method atrae(){
		return(actividadesRealizadas.all({act=>act.cantDeDias()>=4}))
	}
}
class SocioCoherente inherits Socios{
	override method atrae(){
		return (self.adoradorDelSol() or actividadesRealizadas.all({act=>act.haceEsfuerzo()}))
	}
}
class SocioRelajado inherits Socios{
	override method atrae(){
		return (actividadesRealizadas.any({act=>act.idiomas()==idiomas.size()}))
	}
	
}
