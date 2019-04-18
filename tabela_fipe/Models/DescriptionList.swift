
import Foundation

struct DescriptionList: Codable {
    
    var id: String?
    var ano_modelo: String?
    var marca: String?
    var name: String?
    var veiculo: String?
    var preco: String?
    var combustivel: String?
    var referencia: String?
    var fipe_codigo: String?
    var key: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case ano_modelo
        case name
        case veiculo
        case preco
        case combustivel
        case referencia
        case fipe_codigo
        case key
    }
}
