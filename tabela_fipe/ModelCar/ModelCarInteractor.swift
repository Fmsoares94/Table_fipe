
import UIKit

protocol ModelCarBusinessLogic
{
  func doSomething(request: ModelCar.Something.Request)
    func filterListCars(CarsList: [ModelCarsList])
}

protocol ModelCarDataStore
{
    var id: (Int, String) { get set }
    var idVehicle: String { get set }
}

class ModelCarInteractor: ModelCarBusinessLogic, ModelCarDataStore
{
    
    
    func filterListCars(CarsList: [ModelCarsList]) {
//
      let listFilterCars = CarsList.filter({ (list) -> Bool in
        guard let marca = list.marca else {
            return false
        }
        return marca == id.1
        
      })
        presenter?.responseListCars(ListCarsFilter: listFilterCars)
    }
    
  var presenter: ModelCarPresentationLogic?
  var worker: ModelCarWorker?
    var id: (Int, String) = (0,"")
    var idVehicle: String = ""
    
  func doSomething(request: ModelCar.Something.Request)
  {
    worker = ModelCarWorker()
    worker?.get(id: id.0,callback: { (response) in
        self.filterListCars(CarsList: response)
    })
  }
}
