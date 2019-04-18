
import UIKit

protocol SpecificVehicleBusinessLogic
{
  func doSomething(request: SpecificVehicle.Something.Request)
    func specificVehicle(specificList: [SpecificVehicleList])
}

protocol SpecificVehicleDataStore
{
  var id: (Int, String) { get set }
  var idVehicle: String {get set}
  var idDescriptionVehicle: String {get set}
    
}

class SpecificVehicleInteractor: SpecificVehicleBusinessLogic, SpecificVehicleDataStore
{
    
    func specificVehicle(specificList: [SpecificVehicleList]) {
        presenter?.listVehicles(specific: specificList)
    }
    
    var id: (Int, String) = (0, "")
    var idVehicle: String = ""
    var idDescriptionVehicle: String = ""

    
  var presenter: SpecificVehiclePresentationLogic?
  var worker: SpecificVehicleWorker?
  
  // MARK: Do something
  
  func doSomething(request: SpecificVehicle.Something.Request)
  {
    worker = SpecificVehicleWorker()
    worker?.get(id: id.0, idVeichle: idVehicle, callback: { (response) in
        self.specificVehicle(specificList: response)
    })
    print(id, idVehicle)
    let response = SpecificVehicle.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
