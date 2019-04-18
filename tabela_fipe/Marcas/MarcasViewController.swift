import UIKit

protocol MarcasDisplayLogic: class
{
  func displaySomething(viewModel: Int)
    func listBrandCars(list: [MarcasList])
}

class MarcasViewController: UIViewController, MarcasDisplayLogic
{
    func listBrandCars(list: [MarcasList]) {
        listBrandCars = list
        tableViewMarcas.reloadData()
    }
    var listBrandCars = [MarcasList]()
  var interactor: MarcasBusinessLogic?
  var router: (NSObjectProtocol & MarcasRoutingLogic & MarcasDataPassing)?

    @IBOutlet weak var tableViewMarcas: UITableView!
  
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
    let interactor = MarcasInteractor()
    let presenter = MarcasPresenter()
    let router = MarcasRouter()
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
    interactor?.doSomething()
    tableViewMarcas.dataSource = self
    tableViewMarcas.delegate = self
    tableViewMarcas.rowHeight = UITableView.automaticDimension
    tableViewMarcas.estimatedRowHeight = 104
    let uiNib = UINib(nibName: "MarcasTableViewCell", bundle: nil)
    tableViewMarcas.register(uiNib, forCellReuseIdentifier: "MarcasCell")
  }
  
  func displaySomething(viewModel: Int)
  {
    print(viewModel)
    
 }
}

extension MarcasViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBrandCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarcasCell") as! MarcasTableViewCell
        cell.lbNameBrand.text = listBrandCars[indexPath.item].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let id = listBrandCars[indexPath.row].id, let name = listBrandCars[indexPath.row].name {
            router?.dataStore?.id = (id, name)
            self.performSegue(withIdentifier: "ModelCar", sender: nil)
        }
    }
}
