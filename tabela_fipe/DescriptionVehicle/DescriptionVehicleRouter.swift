import UIKit

@objc protocol DescriptionVehicleRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol DescriptionVehicleDataPassing
{
  var dataStore: DescriptionVehicleDataStore? { get }
}

class DescriptionVehicleRouter: NSObject, DescriptionVehicleRoutingLogic, DescriptionVehicleDataPassing
{
  weak var viewController: DescriptionVehicleViewController?
  var dataStore: DescriptionVehicleDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: DescriptionVehicleViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: DescriptionVehicleDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
