import UIKit

protocol ViewModelPropertyType {
    var count: Int {get}
    func name(index: Int) -> String
}

protocol ViewModelServiceType {
    func fetchPokes()
//    func fetchImage(index: Int, completion: @escaping (UIImage?) -> ())
}

protocol ViewModelType: ViewModelServiceType, ViewModelPropertyType {
    func bind(updateHandler: @escaping () -> ())
}


class PokemonViewModel: ViewModelType {
    
    private var pokes: [Pokemon] = [] {
        didSet {
            guard oldValue.count != self.pokes.count else { return }
            self.update?()
        }
    }
    private var update: (() -> ())?
    private let service: AlamoFireManager
    //private let cache: ImageCache
    
    init() {
        self.service = AlamoFireManager.shared
        //self.cache = cache
    }
    
    func bind(updateHandler: @escaping () -> ()) {
        self.update = updateHandler
    }
    
}

// MARK: - Network Calls
extension PokemonViewModel: ViewModelServiceType {
    
    func fetchPokes() {
        //let pageNum = (self.currentPage?.page ?? 0) + 1
        //guard pageNum <= self.currentPage?.totalPages ?? 1 else { return }
        self.service.fetchPokes{ result in
            guard let data = result else {return}
            self.pokes.append(contentsOf: data.results)
        }
        
    }

}

// MARK: - Model Properties
extension PokemonViewModel: ViewModelPropertyType {
    
    var count: Int {
        return self.pokes.count
    }
    
    func name(index: Int) -> String {
        return self.pokes[index].name
    }
    
    
}
