
import UIKit

@objc protocol ModelCarRoutingLogic
{
  func routeToVehicles(segue: UIStoryboardSegue?)
}

protocol ModelCarDataPassing
{
  var dataStore: ModelCarDataStore? { get set}
}

class ModelCarRouter: NSObject, ModelCarRoutingLogic, ModelCarDataPassing
{
  weak var viewController: ModelCarViewController?
  var dataStore: ModelCarDataStore?
  
  // MARK: Routing
  
  func routeToVehicles(segue: UIStoryboardSegue?)
  {
    if let segue = segue {
      let destinationVC = segue.destination as! SpecificVehicleViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    } else {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let destinationVC = storyboard.instantiateViewController(withIdentifier: "SpecificVehicleViewController") as! SpecificVehicleViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
      navigateToSomewhere(source: viewController!, destination: destinationVC)
    }
  }

  
  func navigateToSomewhere(source: ModelCarViewController, destination: SpecificVehicleViewController)
  {
    source.show(destination, sender: nil)
  }

  func passDataToSomewhere(source: ModelCarDataStore, destination: inout SpecificVehicleDataStore)
  {
    destination.idVehicle = source.idVehicle
    destination.id = source.id
  }
}
