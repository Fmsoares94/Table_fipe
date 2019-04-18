
import UIKit

protocol SpecificVehiclePresentationLogic
{
  func presentSomething(response: SpecificVehicle.Something.Response)
    func listVehicles(specific: [SpecificVehicleList])
}

class SpecificVehiclePresenter: SpecificVehiclePresentationLogic
{
    func listVehicles(specific: [SpecificVehicleList]) {
        viewController?.specificListCars(list: specific)
    }
    
  weak var viewController: SpecificVehicleDisplayLogic?
  
  func presentSomething(response: SpecificVehicle.Something.Response)
  {
    let viewModel = SpecificVehicle.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
