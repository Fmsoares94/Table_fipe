
import UIKit

protocol DescriptionVehiclePresentationLogic
{
  func VehicleList(response: DescriptionList)
}

class DescriptionVehiclePresenter: DescriptionVehiclePresentationLogic
{
  weak var viewController: DescriptionVehicleDisplayLogic?

  
  func VehicleList(response: DescriptionList)
  {
    viewController?.listVehicle(viewModel: response)
  }
}
