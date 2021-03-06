//
//  AppDelegate.swift
//  ComponentProvider
//
//  Created by Roy Hsu on 16/11/2017.
//  Copyright © 2017 TinyWorld. All rights reserved.
//

// MARK: - AppDelegate

import UIKit

@UIApplicationMain
public final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Property

    public final var window: UIWindow?

    // MARK: UIApplicationDelegate

    public final func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    )
    -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)

        window.rootViewController = UINavigationController(
            rootViewController: LandingViewController()
        )

        window.makeKeyAndVisible()

        self.window = window

        return true

    }

}
