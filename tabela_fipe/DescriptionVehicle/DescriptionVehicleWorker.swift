
import UIKit
import Alamofire

class DescriptionVehicleWorker
{
    func get(id:Int, idVeichle: String, idDescription: String, callback: @escaping (_ response: DescriptionList) -> Void){
        let url = URL(string: "https://fipeapi.appspot.com/api/1/carros/veiculo/\(id)/\(idVeichle)/\(idDescription).json")!
        Alamofire.request(url)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(_):
                    do {
                        let descriptionList = try JSONDecoder().decode(DescriptionList.self, from: response.data!)
                        callback(descriptionList)
                    } catch let error {
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                }
            })
    }

}
