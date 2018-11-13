class Viaje{
	
	var idioma=[""]
	var property esfuerzo=true
	var property broncearse=true
	var property cantDias=0
	var property interesante=true
	var property recomendada=true
	method esInteresante(){
		return (idioma.size()>2)
	}
	method idioma(_idioma){ 
		idioma.add(_idioma)
	}
	method idiomas(){
		return idioma
	}

	method esRecomendada(socio,actividad){
		return (self.esInteresante() 
			and socio.atrae() and 
			! socio.actividadesRealizadas().contains()==actividad
		)
	}
}
class ViajePlaya inherits Viaje{
	var property  largoPlaya=0
	method cantDeDias(){
		return largoPlaya/500	
	}
	
	method haceEsfuerzo(){return (largoPlaya>1200)
	}
	method puedeBroncearse(){return broncearse}	
}
class ExcursionCiudad inherits Viaje{
	var  cantAtracciones
	method cantAtracciones(_cantAtracciones){
		cantAtracciones=_cantAtracciones
	}	
	method cantDeDias(){
		return cantAtracciones/2
	}
	method haceEsfuerzo(){
		return (cantAtracciones.between(5,8))
	}
	method puedeBroncearse(){
		return broncearse
	}
	override method esInteresante(){
		return super() or cantAtracciones==5
	}
}
class ExcursionCiudadTropical inherits ExcursionCiudad{
	override method cantDeDias(){
	  return (cantAtracciones/2)+1
	 }
	override method puedeBroncearse(){
		return true
	}
}
class SalidaDeTrekking inherits Viaje{
	var property kms=0
	var property diasSol=0
	
	method kms(_kms){
		kms=_kms
	}
	method diasSol(_diasSol){
		diasSol=_diasSol
	}
	method cantDeDias(){
		return kms/50
	}
	method haceEsfuerzo(){
		return (kms>80)
	}
	method puedeBroncearse(){
		return (diasSol>200 and( diasSol.between(100,200) or kms>120))
	}
	override method esInteresante(){
		return super() and diasSol>=140 
	}
}
class Gim{
	
	const property idioma="español"
	const property esfuerzo=true
	const property broncearse=false
	var property cantDias=1
	method esRecomendada(socio){
		return socio.edad().between(20,30)
	}
	method cantDeDias(){
		return cantDias
	}
	method idiomas(){
		return idioma
	}
	method puedeBroncearse(){
		return false
	}
	method haceEsfuerzo(){
		return true
	}
}
class TallerLiterario{
	var libros=[]
	var cantDias=0
	method librosQueTrabaja(_libros){
		libros.add(_libros)
	}	
	method idiomasUsados(){
		return libros.map({libro=>libro.idioma()})
	}
	method cantDeDias(){
		return libros.size()+1
	}
	method haceEsfuerzo(autor){
		return (libros.any({libro=>libro.cantPag()>500})) or
		(libros.all({libro=>libro.nombreAutor()==autor}))
	}
	method puedeBroncearse(){
		return false
	}
	method esRecomendada(socio){
		return socio.idiomas().size()>=2
	}
	}
class Libros{
	var property idioma=""
	var property cantPag=0
	var property nombreAutor=""
}