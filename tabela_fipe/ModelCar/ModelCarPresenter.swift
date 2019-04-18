

import UIKit

protocol ModelCarPresentationLogic
{
    func responseListCars(ListCarsFilter:[ModelCarsList])
}

class ModelCarPresenter: ModelCarPresentationLogic
{
    func responseListCars(ListCarsFilter: [ModelCarsList]) {
        viewController?.displaySomething(viewModel: ListCarsFilter)
    }
    
  weak var viewController: ModelCarDisplayLogic?
}
