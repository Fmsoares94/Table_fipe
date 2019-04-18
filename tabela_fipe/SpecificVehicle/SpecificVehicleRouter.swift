
import UIKit

@objc protocol SpecificVehicleRoutingLogic
{
  func routeToDescriptionSegue(segue: UIStoryboardSegue?)
}

protocol SpecificVehicleDataPassing
{
  var dataStore: SpecificVehicleDataStore? { get set }
}

class SpecificVehicleRouter: NSObject, SpecificVehicleRoutingLogic, SpecificVehicleDataPassing
{
  weak var viewController: SpecificVehicleViewController?
  var dataStore: SpecificVehicleDataStore?
  
  func routeToDescriptionSegue(segue: UIStoryboardSegue?)
  {
    if let segue = segue {
      let destinationVC = segue.destination as! DescriptionVehicleViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    } else {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let destinationVC = storyboard.instantiateViewController(withIdentifier: "DescriptionVehicleViewController") as! DescriptionVehicleViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
      navigateToSomewhere(source: viewController!, destination: destinationVC)
    }
  }
  
  func navigateToSomewhere(source: SpecificVehicleViewController, destination: DescriptionVehicleViewController)
  {
    source.show(destination, sender: nil)
  }
  
  
  func passDataToSomewhere(source: SpecificVehicleDataStore, destination: inout DescriptionVehicleDataStore)
  {
    destination.id = source.id
    destination.idDescriptionVehicle = source.idDescriptionVehicle
    destination.idVehicle = source.idVehicle
  }
}
