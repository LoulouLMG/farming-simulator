package fr.esir.lsi.simulation.activity

import activity.PeriodicActivity
import fr.inria.diverse.k3.al.annotationprocessor.Aspect
import activity.ResourceAllocation

@Aspect(className=PeriodicActivity)
class PeriodicActivityAspect {
	
	
	def allocate(ResourceAllocation res){		
		_self.allocations.add(res)
	}
	
	
}