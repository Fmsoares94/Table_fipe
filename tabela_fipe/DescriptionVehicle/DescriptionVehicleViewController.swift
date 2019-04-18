
import UIKit

protocol DescriptionVehicleDisplayLogic: class
{
  func listVehicle(viewModel: DescriptionList)
}

class DescriptionVehicleViewController: UIViewController, DescriptionVehicleDisplayLogic
{
  var interactor: DescriptionVehicleBusinessLogic?
  var router: (NSObjectProtocol & DescriptionVehicleRoutingLogic & DescriptionVehicleDataPassing)?

    @IBOutlet weak var lbBrands: UILabel!
    @IBOutlet weak var lbReference: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbFuel: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    var descriptionVehicle = DescriptionList()
    
    
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = DescriptionVehicleInteractor()
    let presenter = DescriptionVehiclePresenter()
    let router = DescriptionVehicleRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    interactor?.doSomething()
  }
  
  func listVehicle(viewModel: DescriptionList)
  {
    descriptionVehicle = viewModel
    print(descriptionVehicle)
    if let reference = descriptionVehicle.referencia,
    let name = descriptionVehicle.name,
    let price = descriptionVehicle.preco,
    let fuel = descriptionVehicle.combustivel,
    let fipeCode = descriptionVehicle.fipe_codigo {
        lbReference.text = reference
        lbName.text = name
        lbPrice.text = price
        lbFuel.text = fuel
        lbBrands.text = fipeCode
    }
 }


}
