package fr.esir.lsi.simulation

import exploitation.Exploitation
import exploitation.ExploitationPackage
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl

import static extension fr.esir.lsi.simulation.exploitation.ExploitationAspect.*

class Simulation {

	def Exploitation initExploitation() {
		var fact = new XMIResourceFactoryImpl

		if (!EPackage.Registry.INSTANCE.containsKey(ExploitationPackage.eNS_URI)) {
			EPackage.Registry.INSTANCE.put(ExploitationPackage.eNS_URI, ExploitationPackage.eINSTANCE);
		}

		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("*", fact);

		var rs = new ResourceSetImpl()

		//var uri = URI.createURI(args.get(0));
		var uriString = "../fr.esir.lsi.exploitation.example/My.exploitation"
		var uri = URI.createFileURI(uriString);
		var res = rs.getResource(uri, true);
		var Exploitation exp = res.contents.get(0) as Exploitation

		return exp;
	}

	def display() {
		var exp = initExploitation

		println("The exploitation " + exp.name + " is irrigated : " + exp.isIrrigated)
	}
	
	def haveSurfacesThatNeedIrrigation() {
		var exp = initExploitation
		
		exp.haveSurfacesThatNeedIrrigation
	}

	def static void main(String[] args) {
		new Simulation().haveSurfacesThatNeedIrrigation

	}
}
