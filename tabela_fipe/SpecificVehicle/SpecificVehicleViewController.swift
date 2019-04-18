
import UIKit

protocol SpecificVehicleDisplayLogic: class
{
  func displaySomething(viewModel: SpecificVehicle.Something.ViewModel)
    func specificListCars(list: [SpecificVehicleList])
}

class SpecificVehicleViewController: UIViewController, SpecificVehicleDisplayLogic
{
    func specificListCars(list: [SpecificVehicleList]) {
        CarsList = list
        tableViewSpecific.reloadData()
    }
    
  var interactor: SpecificVehicleBusinessLogic?
  var router: (NSObjectProtocol & SpecificVehicleRoutingLogic & SpecificVehicleDataPassing)?
    var CarsList = [SpecificVehicleList]()
    @IBOutlet weak var tableViewSpecific: UITableView!
    
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
    let interactor = SpecificVehicleInteractor()
    let presenter = SpecificVehiclePresenter()
    let router = SpecificVehicleRouter()
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
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
    tableViewSpecific.delegate = self
    tableViewSpecific.dataSource = self
    let uiNib = UINib(nibName: "MarcasTableViewCell", bundle: nil)
    tableViewSpecific.register(uiNib, forCellReuseIdentifier: "MarcasCell")
    self.navigationController?.title = "ADIDAS"
  }
  
  func doSomething()
  {
    let request = SpecificVehicle.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: SpecificVehicle.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}

extension SpecificVehicleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CarsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarcasCell") as! MarcasTableViewCell
        if let name = CarsList[indexPath.row].name {
            cell.lbNameBrand.text = name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let idDescriptionVehicle = CarsList[indexPath.row].id {
            router?.dataStore?.idDescriptionVehicle = idDescriptionVehicle
            self.performSegue(withIdentifier: "DescriptionSegue", sender: nil)
        }
    }
    
    
}
