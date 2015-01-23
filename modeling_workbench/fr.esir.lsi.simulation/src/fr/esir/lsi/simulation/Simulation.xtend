package fr.esir.lsi.simulation

import activity.ActivityPackage
import activity.Model
import exploitation.Exploitation
import exploitation.ExploitationPackage
import fr.esir.lsi.exploitation.farmingdsl.FarmingStandaloneSetup
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl

import static extension fr.esir.lsi.simulation.exploitation.ExploitationAspect.*
import static extension fr.esir.lsi.simulation.exploitation.SurfaceAspect.*

class Simulation {
	static var Exploitation exp
	static var Model mod

	static def Exploitation initExploitation() {
		var fact = new XMIResourceFactoryImpl

		if (!EPackage.Registry.INSTANCE.containsKey(ExploitationPackage.eNS_URI)) {
			EPackage.Registry.INSTANCE.put(ExploitationPackage.eNS_URI, ExploitationPackage.eINSTANCE);
		}

		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("*", fact);

		var rs = new ResourceSetImpl()

		var uriString = "../fr.esir.lsi.exploitation.example/My.exploitation"
		var uri = URI.createFileURI(uriString);
		var res = rs.getResource(uri, true);
		var Exploitation exp = res.contents.get(0) as Exploitation

		return exp;
	}

	static def Model initModel() {
		var fact = new XMIResourceFactoryImpl
		

		if (!EPackage.Registry.INSTANCE.containsKey(ActivityPackage.eNS_URI)) {
			EPackage.Registry.INSTANCE.put(ActivityPackage.eNS_URI, ActivityPackage.eINSTANCE);
		}
		
		FarmingStandaloneSetup.doSetup();
	
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("*", fact);
		
		var rs = new ResourceSetImpl()

		var uriString = "../fr.esir.lsi.farmingdsl.example/example.farming"
		var uri = URI.createFileURI(uriString);
		var res = rs.getResource(uri, true);
		var Model mod = res.contents.get(0) as Model

		return mod;
	}

	def display() {

		println("The exploitation " + exp.name + " is irrigated : " + exp.isIrrigated)
	}

	def haveSurfacesThatNeedIrrigation() {

		exp.haveSurfacesThatNeedIrrigation
	}
	
	def doThing() {
		println("Ha of the Exploitation "+exp.name+" : "+exp.surface.get(0).getHa)
	}

	def static void main(String[] args) {
		exp = initExploitation
		mod = initModel

		var sim = new Simulation
		
		
		sim.doThing
	}
}
