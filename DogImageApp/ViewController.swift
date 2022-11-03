
import UIKit
import Alamofire
import Kingfisher

struct dogApiResponce: Codable {
    let message: String
    let status: String
}


class ViewController: UIViewController {
    
    
    @IBOutlet weak var dogImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getDogPhotos()
    }
    
    @IBAction func reloadDogs(_ sender: Any) {
        getDogPhotos()
    }
    func getDogPhotos() {

            AF.request(
                Constants.shared.dogUrl
            ).responseDecodable(of:dogApiResponce.self) { response in

                switch response.result {
                case .success(let value):
                    // print(value.message)
                    // print(value.status)
                    let photoUrl = URL(string: value.message)!
                    self.dogImageView.kf.setImage(with: photoUrl)

                case .failure(let error):
                    print("error", error)
                }
            }
        }
}
