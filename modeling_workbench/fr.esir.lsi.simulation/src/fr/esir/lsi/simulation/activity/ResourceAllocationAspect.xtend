package fr.esir.lsi.simulation.activity

import activity.ResourceAllocation
import fr.inria.diverse.k3.al.annotationprocessor.Aspect
import activity.ResourceType

@Aspect(className=ResourceAllocation)
class ResourceAllocationAspect {
	
	
	def void setDuration(int i){
		_self.duration = i
	}
	
	def void setResourceType(ResourceType type){
		_self.resource = type
	}
}