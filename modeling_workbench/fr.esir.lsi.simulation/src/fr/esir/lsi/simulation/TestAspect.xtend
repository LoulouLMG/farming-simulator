package fr.esir.lsi.simulation

import exploitation.Exploitation
import exploitation.ExploitationPackage
import exploitation.Surface
import exploitation.impl.ExploitationFactoryImpl
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl

import static extension fr.esir.lsi.simulation.exploitation.ExploitationAspect.*

class TestAspect {

	public def run() {
		var fact = ExploitationFactoryImpl.init

		var Exploitation exploitationTest = fact.createExploitation
		exploitationTest.name = "TestExploitation"

		exploitationTest.display

		var Surface s = fact.createSurface

		exploitationTest.add(s)

		exploitationTest.displaySurfaces

	}

	public def runWithModel() {

		var exp = initExploitation

		exp.compile

	}

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

	def static void main(String[] args) {

		new TestAspect().runWithModel

	}
}
