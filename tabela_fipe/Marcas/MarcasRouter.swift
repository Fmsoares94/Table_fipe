
import UIKit

@objc protocol MarcasRoutingLogic
{
  func routeToModelCar(segue: UIStoryboardSegue?)
}

protocol MarcasDataPassing
{
  var dataStore: MarcasDataStore? { get set}
}

class MarcasRouter: NSObject, MarcasRoutingLogic, MarcasDataPassing
{
  weak var viewController: MarcasViewController?
  var dataStore: MarcasDataStore?
  
    func routeToModelCar(segue: UIStoryboardSegue?)
  {
    if let segue = segue {
      let destinationVC = segue.destination as! ModelCarViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    } else {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let destinationVC = storyboard.instantiateViewController(withIdentifier: "ModelCarViewController") as! ModelCarViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
      navigateToSomewhere(source: viewController!, destination: destinationVC)
    }
  }
  
  func navigateToSomewhere(source: MarcasViewController, destination: ModelCarViewController)
  {
    source.show(destination, sender: nil)
  }
  
  
  func passDataToSomewhere(source: MarcasDataStore, destination: inout ModelCarDataStore)
  {
    destination.id = source.id
    
    }
 }
