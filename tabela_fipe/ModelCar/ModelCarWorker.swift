
import UIKit
import Alamofire

class ModelCarWorker
{
    func get(id:Int, callback: @escaping (_ response: [ModelCarsList]) -> Void){
        let url = URL(string: "https://fipeapi.appspot.com/api/1/carros/veiculos/\(id).json")!
        Alamofire.request(url)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(_):
                    do {
                        let carsList = try JSONDecoder().decode([ModelCarsList].self, from: response.data!)
                        callback(carsList)
                    } catch let error {
                        print(error)
                    }
                case .failure(let error):
                    print(error)
                }
            })
    }
}
