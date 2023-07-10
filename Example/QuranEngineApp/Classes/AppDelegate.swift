//
//  AppDelegate.swift
//  QuranEngineApp
//
//  Created by Mohamed Afifi on 2023-06-24.
//

import AppStructureFeature
import Logging
import NoorFont
import NoorUI
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: Internal

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FontName.registerFonts()
        LoggingSystem.bootstrap(StreamLogHandler.standardError)
        AsyncTextLabelSystem.bootstrap(FixedTextNode.init)

        Task {
            // Eagerly load download manager to handle any background downloads.
            async let download: () = container.downloadManager.start()

            // Begin fetching resources immediately upon the application's start-up.
            async let readingResources: () = container.readingResources.startLoadingResources()
            _ = await [download, readingResources]
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

    func application(
        _ application: UIApplication,
        handleEventsForBackgroundURLSession identifier: String,
        completionHandler: @escaping () -> Void
    ) {
        let downloadManager = container.downloadManager
        downloadManager.setBackgroundSessionCompletion(completionHandler)
    }

    // MARK: Private

    private let container = Container.shared
}
