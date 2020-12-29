//
//  ViewController.swift
//  Networking-Alamofire
//
//  Created by Juan Capponi on 12/29/20.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    private let networkingClient = NetworkingClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func getData(_ sender: Any) {
        
        //https://jsonplaceholder.typicode.com/posts
        //https://jsonplaceholder.typicode.com/posts/15
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/") else {
            return
        }
        
        networkingClient.execute(url: url) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                self.textView.text = json.description
            }
        }
    }
}

