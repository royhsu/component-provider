//
//  PostListTableViewController.swift
//  ComponentProvider
//
//  Created by Roy Hsu on 13/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - PostListTableViewController

import UIKit

public final class PostListTableViewController: UITableViewController {

    // MARK: Property

    public final weak var postDataProvider: PostDataProvider?

    // MARK: Init

    public init() {

        super.init(
            nibName: nil,
            bundle: nil
        )

    }

    public required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }

    // MARK: View Life Cycle

    public final override func viewDidLoad() {

        super.viewDidLoad()

        setUpTableView(tableView)

    }

    // MARK: Set Up

    fileprivate final func setUpTableView(_ tableView: UITableView) {

        tableView.register(
            UINib(
                nibName: PostTableViewCell.identifier,
                bundle: nil
            ),
            forCellReuseIdentifier: PostTableViewCell.identifier
        )

        tableView.estimatedRowHeight = 122.0

        tableView.rowHeight = UITableViewAutomaticDimension

    }

    // MARK: UITableViewDataSource

    public final override func numberOfSections(in tableView: UITableView) -> Int {

        return postDataProvider?.numberOfPosts() ?? 0

    }

    public final override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    )
    -> Int { return 1 }

    public final override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    )
    -> UITableViewCell {

        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(
            withIdentifier: PostTableViewCell.identifier,
            for: indexPath
        ) as! PostTableViewCell
        // swiftlint:enable force_cast

        let post = postDataProvider?.post(at: indexPath)

        // Note: Prevent using the built-in properties inside a cell for self-sizing, such as textLabel, detailTextLabel, imageView.
        // Reference: https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithSelf-SizingTableViewCells.html

        cell.contentLabel?.text = post?.content ?? ""

        cell.selectionStyle = .none

        cell.backgroundColor = .clear

        return cell

    }

}
