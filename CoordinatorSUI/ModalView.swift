//
//  ModalView.swift
//  CoordinatorSUI
//
//  Created by Dmitriy Soloshenko on 06.08.2022.
//

import SwiftUI

struct ModalView: View {
    var color: Color = .mint

    
    var body: some View {
        ZStack {
            TitlePlace()
            HelloPlace()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
    }
    
    private func HelloPlace() -> some View {
        VStack {
            Text("Hello, World!")
        }
        .foregroundColor(.white)
    }
    
    private func TitlePlace() -> some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    Coordinator.close()
                } label: {
                    Text("❌")
                        .foregroundColor(.white)

                }
                .padding()
            }
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            Spacer()
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
