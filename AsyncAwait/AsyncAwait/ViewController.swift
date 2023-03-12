//
//  ViewController.swift
//  AsyncAwait
//
//  Created by Keonsu Jin on 2023/03/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClicked() {
        
        self.f0311()

    }
    
    //MARK: 0311
    func f0311() {
        guard let url = URL(string: "https://reqres.in/api/users?page=1") else { return }
        
        // #1
//        MyModelClass.requestImageURL1(reqURL: url) { [weak self] urlString in
//            DispatchQueue.global().async {
//                guard
//                    let url = URL(string: urlString),
//                    let imgData = try? Data(contentsOf: url)
//                else { return }
//                DispatchQueue.main.async {
//                    self?.imgView.image = UIImage(data: imgData)
//                }
//            }
//        }

        // #2
        Task {
            guard
                let imgURL = try? await MyModelClass.requestImageURL2(reqURL: url),
                let url = URL(string: imgURL),
                let imgdata = try? Data(contentsOf: url)
            else { return }

            self.imgView.image = UIImage(data: imgdata)
        }
    }

}

