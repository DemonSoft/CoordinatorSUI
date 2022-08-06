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
            CoordinatorPlace()
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
    
    private func CoordinatorPlace() -> some View {
        HStack {
            Button {
                Coordinator.next(state: .root)
                Coordinator.close()
            } label: {
                Text("ROOT")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
            .padding()
            .border(.white, width: 1)

            Button {
                Coordinator.next(state: .end)
                Coordinator.close()
            } label: {
                Text("END")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
            .padding()
            .border(.white, width: 1)
        }
        .offset(y: 200)
    }

}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
