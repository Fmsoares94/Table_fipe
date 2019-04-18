
import UIKit
import Alamofire

class MarcasWorker
{
    func get(callback: @escaping (_ response: [MarcasList]) -> Void){
        let url = URL(string: "https://fipeapi.appspot.com/api/1/carros/marcas.json")!
        Alamofire.request(url)
        .responseJSON(completionHandler: { response in
        switch response.result {
        case .success(_):
        do {
        let listMarcas = try JSONDecoder().decode([MarcasList].self, from: response.data!)
        callback(listMarcas)
        } catch let error {
        print(error)
        }
        case .failure(let error):
        print(error)
        }
        })
    }
}
