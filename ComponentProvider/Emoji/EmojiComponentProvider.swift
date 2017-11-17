//
//  EmojiComponentProvider.swift
//  ComponentProvider
//
//  Created by 許郁棋 on 17/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - EmojiComponentProvider

import UIKit

public final class EmojiComponentProvider: ComponentProvider {

    // MARK: Property

    public final var emojiComponent: EmojiComponent {

        didSet {

            setUpEmojiComponent(
                emojiComponent,
                for: emojiViewController
            )

        }

    }

    public final let emojiViewController = EmojiViewController()

    public final var component: Component { return emojiComponent }

    public final var componentViewController: UIViewController { return emojiViewController }

    public final weak var componentProviderDelegate: ComponentProviderDelegate?

    public final var contentSize: CGSize = .zero

    // MARK: Init

    public init() {

        self.emojiComponent = EmojiComponent(emoji: nil)

        setUpEmojiComponent(
            emojiComponent,
            for: emojiViewController
        )

    }

    // MARK: Update

    public final func update() {

        let view = emojiViewController.view!

        view.backgroundColor = .black

        view.frame = CGRect(
            origin: .zero,
            size: contentSize
        )

        componentProviderDelegate?.componentProviderDidUpdate(self)

    }

    // MARK: Set Up

    fileprivate final func setUpEmojiComponent(
        _ component: EmojiComponent,
        for viewController: EmojiViewController
    ) { viewController.label.text = component.emoji }

}
