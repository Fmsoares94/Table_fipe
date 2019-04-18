
import UIKit
import Alamofire

class SpecificVehicleWorker
{
    func get(id:Int, idVeichle: String, callback: @escaping (_ response: [SpecificVehicleList]) -> Void){
        let url = URL(string: "https://fipeapi.appspot.com/api/1/carros/veiculo/\(id)/\(idVeichle).json")!
        Alamofire.request(url)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(_):
                    do {
                        let specificVeichle = try JSONDecoder().decode([SpecificVehicleList].self, from: response.data!)
                        callback(specificVeichle)
                    } catch let error {
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                }
            })
    }
}
