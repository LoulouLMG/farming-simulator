package fr.esir.lsi.simulation;

import exploitation.Exploitation;
import exploitation.ExploitationPackage;
import fr.esir.lsi.simulation.exploitation.ExploitationAspect;
import java.util.Map;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;
import org.eclipse.xtext.xbase.lib.InputOutput;

@SuppressWarnings("all")
public class Simulation {
  public Exploitation initExploitation() {
    XMIResourceFactoryImpl fact = new XMIResourceFactoryImpl();
    boolean _containsKey = EPackage.Registry.INSTANCE.containsKey(ExploitationPackage.eNS_URI);
    boolean _not = (!_containsKey);
    if (_not) {
      EPackage.Registry.INSTANCE.put(ExploitationPackage.eNS_URI, ExploitationPackage.eINSTANCE);
    }
    Map<String, Object> _extensionToFactoryMap = Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap();
    _extensionToFactoryMap.put("*", fact);
    ResourceSetImpl rs = new ResourceSetImpl();
    String uriString = "../fr.esir.lsi.exploitation.example/My.exploitation";
    URI uri = URI.createFileURI(uriString);
    Resource res = rs.getResource(uri, true);
    EList<EObject> _contents = res.getContents();
    EObject _get = _contents.get(0);
    Exploitation exp = ((Exploitation) _get);
    return exp;
  }
  
  public String display() {
    String _xblockexpression = null;
    {
      Exploitation exp = this.initExploitation();
      String _name = exp.getName();
      String _plus = ("The exploitation " + _name);
      String _plus_1 = (_plus + " is irrigated : ");
      boolean _isIrrigated = ExploitationAspect.isIrrigated(exp);
      String _plus_2 = (_plus_1 + Boolean.valueOf(_isIrrigated));
      _xblockexpression = InputOutput.<String>println(_plus_2);
    }
    return _xblockexpression;
  }
  
  public boolean haveSurfacesThatNeedIrrigation() {
    boolean _xblockexpression = false;
    {
      Exploitation exp = this.initExploitation();
      _xblockexpression = ExploitationAspect.haveSurfacesThatNeedIrrigation(exp);
    }
    return _xblockexpression;
  }
  
  public static void main(final String[] args) {
    Simulation _simulation = new Simulation();
    _simulation.haveSurfacesThatNeedIrrigation();
  }
}
