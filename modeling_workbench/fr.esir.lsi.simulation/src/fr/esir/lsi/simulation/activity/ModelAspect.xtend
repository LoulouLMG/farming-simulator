package fr.esir.lsi.simulation.activity

import activity.Model
import fr.inria.diverse.k3.al.annotationprocessor.Aspect

@Aspect(className=Model)
class ModelAspect {
	
	
	def print(){
		var res ="";
		for(  p : _self.activities){
			var temp = "***** PeriodicActivity : "+p.name+" *****"
			//Affichage des dates
			if( p.start != null){
				temp += "\n date : "+p.start.day+" "+p.start.month+" to "+p.end.day+" "+p.end.month
			}
			/*if(p.periodicityLitteral != null){
				temp+= "\n each "+p.periodicity+" "+p.periodicityLitteral
			}*/
			if(p.allocations.size != 0){
				temp += "\n List of ressources :"
				for(a : p.allocations){
					temp += "\n\tresource "+a.resource.name+" for "+a.duration+" hours"
				}
			}
			if(p.rules.size != 0){
				temp += "\n List of rules :" 
				for ( r : p.rules){
					for( predi : r.predicates){
						if(predi.linkedActivity != null){
							temp += "\n\t after "+predi.linkedActivity.name
						}
						if(predi.linkedDate != null){
							temp += "\n\t t "+predi.linkedSymbol+" "+predi.linkedDate.day+" "+predi.linkedDate.month
						}
						if( predi.linkedDate == null && predi.linkedSymbol == null && predi.linkedActivity == null){
							temp += "\n\t seed maturity"
						}
					}
				}
			}
			
			temp += "\n"
			res += temp
		}
		
		println(res)
	}
}