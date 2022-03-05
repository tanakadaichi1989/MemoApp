//
//  MemoAppApp.swift
//  MemoApp
//
//  Created by 田中大地 on 2022/03/05.
//

import SwiftUI

@main
struct MemoAppApp: App {
    @StateObject private var viewModel = MemoViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
