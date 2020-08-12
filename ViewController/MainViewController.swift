import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    
    var viewModel: ViewModelType = {
        return PokemonViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        // understand what this does
        self.viewModel.bind(updateHandler: {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        })
        self.viewModel.fetchPokes()
    }
    
    private func setUp() {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.reuseId)
        
        self.view.addSubview(tableView)
        tableView.boundToSuperView()
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.reuseId, for: indexPath) as? MyTableViewCell else {
            return UITableViewCell()
        }
        
        cell.pokemonName?.text = self.viewModel.name(index: indexPath.row)
        
        return cell
    }
    

}

