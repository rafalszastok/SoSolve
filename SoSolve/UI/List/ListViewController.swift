//
//  ListViewController.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import UIKit

final class ListViewController: UIViewController {

    private var viewModel: ListViewModel!

    private lazy var listView: ListView = {
        return ListView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.soSolve.layoutInstall(subview: listView)
        viewModel.input(event: .viewDidLoad)
    }

    func inject(viewModel: ListViewModel) {
        self.viewModel = viewModel
    }
}

extension ListViewController: ListViewModelDelegate {
    
    func show(snapshot: GalleryListDataSourceSnapshot) {
        listView.dataSource.apply(snapshot, animatingDifferences: true)
    }


}
