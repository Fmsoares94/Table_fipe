import UIKit

protocol DescriptionVehicleBusinessLogic
{
  func descriptionVehicle(request: DescriptionList)
    func doSomething()
}

protocol DescriptionVehicleDataStore
{
    var id: (Int, String) { get set }
    var idVehicle: String { get set }
    var idDescriptionVehicle: String { get set }
}

class DescriptionVehicleInteractor: DescriptionVehicleBusinessLogic, DescriptionVehicleDataStore
{
    func descriptionVehicle(request: DescriptionList) {
        presenter?.VehicleList(response: request)
    }
    
    var id: (Int, String) = (0, "")
    var idVehicle: String = ""
    var idDescriptionVehicle: String = ""
    
    
  var presenter: DescriptionVehiclePresentationLogic?
  var worker: DescriptionVehicleWorker?
    
  func doSomething()
  {
    worker = DescriptionVehicleWorker()
    worker?.get(id: id.0, idVeichle: idVehicle, idDescription: idDescriptionVehicle, callback: { (response) in
        self.presenter?.VehicleList(response: response)
    })
  }
}
