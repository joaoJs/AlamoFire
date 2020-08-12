import Alamofire

final class AlamoFireManager {
    
    private let url = "https://pokeapi.co/api/v2/pokemon/?limit=150"

    static var shared = AlamoFireManager()
    
    private init() { }
    
}

extension AlamoFireManager {
    
    func fetchPokes(completion: @escaping (ResponseObj?) -> ()) {
        
        AF.request(url)
            .validate()
            .responseDecodable(of: ResponseObj.self) { (response) in
                guard let data = response.value else {
                    completion(nil)
                    return
                }
                completion(data)
        }
        
    }
    
    
}
