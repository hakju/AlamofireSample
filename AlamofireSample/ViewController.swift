import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFilms()
    }

    func fetchFilms() {
        AF.request("https://swapi.dev/api/films")
        .validate()
        .responseDecodable(of: Films.self) { (response) in
            guard let films = response.value else { return }
            print(films.all[2].title)
        }
    }
}
