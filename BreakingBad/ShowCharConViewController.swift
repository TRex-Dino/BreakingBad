//
//  ShowCharConViewController.swift
//  BreakingBad
//
//  Created by Dmitry on 06.05.2021.
//

import UIKit

class ShowCharConViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var showLabel: UILabel!
    
    var char: Char!
    private var spinnerView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        spinnerView = showSpinner(in: view)
//        print(char)
//        DispatchQueue.global().async {
//            guard let url = URL(string: (self.char?.img)!) else { return }
//            guard let data = try? Data(contentsOf: url) else { return }
//            DispatchQueue.main.async {
//                self.imageView.image = UIImage(data: data)
//            }
        
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        if let name = char.name {
            
            showLabel.text = name
        }
    }
    
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }

}
