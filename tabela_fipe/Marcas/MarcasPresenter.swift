
import UIKit

protocol MarcasPresentationLogic
{
  func presentSomething(response: Int)
    func response(brandCars: [MarcasList])
}

class MarcasPresenter: MarcasPresentationLogic
{
    func response(brandCars:[MarcasList]) {
        viewController?.listBrandCars(list: brandCars)
    }
    
  weak var viewController: MarcasDisplayLogic?
  
  func presentSomething(response: Int)
  {
    viewController?.displaySomething(viewModel: response)
  }
}
