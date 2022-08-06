//
//  ContentView.swift
//  CoordinatorSUI
//
//  Created by Dmitriy Soloshenko on 06.08.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var coordinator = Coordinator
    
    var body: some View {
        ZStack {
            coordinator.container.view
            if coordinator.modalVisibled {
                coordinator.modalView
                    .transition(.move(edge: .bottom))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
