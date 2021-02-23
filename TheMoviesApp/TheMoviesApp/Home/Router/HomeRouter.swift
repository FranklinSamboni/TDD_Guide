//
//  HomeRouter.swift
//  TheMoviesApp
//
//  Created by Sach on 13/02/21.
//
//esta clase creara objeto a Home y tambien srive de router.
import Foundation
import UIKit
class HomeRouter {
    var viewController: UIViewController{
        return createViewController()
    }
    
    private var sourceView: UIViewController?
    
    private func createViewController() -> UIViewController {
        let view = HomeView(nibName: "HomeView", bundle: Bundle.main)
        return view
    }
    
    func setSourceView(_ sourceView: UIViewController?){
        guard let view = sourceView else { fatalError("error desconocido") }
        self.sourceView = view        
    }
}
