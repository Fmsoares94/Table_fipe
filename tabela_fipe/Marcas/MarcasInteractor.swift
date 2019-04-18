
import UIKit

protocol MarcasBusinessLogic
{
  func doSomething()
 
}

protocol MarcasDataStore
{
  var id: (Int, String) { get set }
}

class MarcasInteractor: MarcasBusinessLogic, MarcasDataStore
{
    
  var presenter: MarcasPresentationLogic?
  var worker: MarcasWorker?
  var id: (Int, String) = (0,"")
  
  func doSomething()
  {
    worker = MarcasWorker()
    worker?.get(callback: { (response) in
        self.presenter?.response(brandCars: response)
    })
  }
}
