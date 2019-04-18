
import UIKit

protocol ModelCarDisplayLogic: class
{
  func displaySomething(viewModel: [ModelCarsList])
}

class ModelCarViewController: UIViewController, ModelCarDisplayLogic
{
    func displaySomething(viewModel: [ModelCarsList]) {
        listModelsCars = viewModel
        
        tableViewModelsCar.reloadData()
    }
    
  var interactor: ModelCarBusinessLogic?
  var router: (NSObjectProtocol & ModelCarRoutingLogic & ModelCarDataPassing)?
  var listModelsCars = [ModelCarsList]()
    @IBOutlet weak var tableViewModelsCar: UITableView!
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
  
  private func setup()
  {
    let viewController = self
    let interactor = ModelCarInteractor()
    let presenter = ModelCarPresenter()
    let router = ModelCarRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
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
    tableViewModelsCar.delegate = self
    tableViewModelsCar.dataSource = self
    let uiNib = UINib(nibName: "MarcasTableViewCell", bundle: nil)
    tableViewModelsCar.register(uiNib, forCellReuseIdentifier: "MarcasCell")
  }

    func doSomething()
  {
    let request = ModelCar.Something.Request()
    interactor?.doSomething(request: request)
  }
}

extension ModelCarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModelsCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarcasCell") as! MarcasTableViewCell
        if let name = listModelsCars[indexPath.item].fipeName {
            cell.lbNameBrand.text = name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let idVehicle = listModelsCars[indexPath.row].id {
            router?.dataStore?.idVehicle = idVehicle
        self.performSegue(withIdentifier: "Vehicles", sender: nil)
        }
    }
}
