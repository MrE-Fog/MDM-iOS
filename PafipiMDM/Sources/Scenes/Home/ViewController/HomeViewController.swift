//
//  HomeViewController.swift
//  PafipiMDM
//
//  Created by Piotr Fraccaro on 10/04/2021.
//

import UIKit
import Resolver
import Core

protocol HomeViewControllerDelegate: AnyObject {
    
}

public final class HomeViewController: UIViewController {
    
    public class func create() -> HomeViewController {
        let vc = HomeViewController()
        vc.viewModel.output = vc
        return vc
    }
    
    weak var delegate: HomeViewControllerDelegate?
    
    @LazyInjected private var viewModel: HomeViewModel
    
    private var mainView: HomeView? {
        return view as? HomeView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        self.view = HomeView()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        mainView?.backgroundColor = Colors.Common.background
    }
}

// MARK: - HomeViewModelOutput

extension HomeViewController: HomeViewModelOutput {
    
}
