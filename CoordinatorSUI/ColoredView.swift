//
//  ColoredView.swift
//  CoordinatorSUI
//
//  Created by Dmitriy Soloshenko on 06.08.2022.
//

import SwiftUI

struct ColoredView: View {
    var index: Int = 0

    private (set) var colors:[Color] = [.red, .orange, .yellow, .green, .teal, .blue, .purple]
    
    var body: some View {
        ZStack {
            TitlePlace()
            HelloPlace()
            NextPlace()
            ModalaPlace()
            CoordinatorPlace()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(viewColor)
    }
    
    private var viewColor: Color {
        return colors[index]
    }
    
    private func HelloPlace() -> some View {
        VStack {
            Text("Hello, World!")
            Text("Index \(index)")
        }
        .foregroundColor(.white)
    }
    
    private func TitlePlace() -> some View {
        VStack {
            HStack {
                if index > 0 {
                    Button {
                        Coordinator.pop()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)

                    }
                    .padding()
                }
                Spacer()
            }
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            Spacer()
        }
    }
    
    private func NextPlace() -> some View {
        VStack {
            if index < colors.count - 1 {
                Button {
                    Coordinator.push(view: ColoredView(index: index + 1))

                } label: {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                }
            }
        }
        .offset(y: 44)
    }

    private func ModalaPlace() -> some View {
        VStack {
            Button {
                Coordinator.modal(view: ModalView())
            } label: {
                Text("SHOW MODAL")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
        }
        .offset(y: 120)
    }

    private func CoordinatorPlace() -> some View {
        HStack {
            Button {
                Coordinator.next(state: .root)
            } label: {
                Text("ROOT")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
            .padding()
            .border(.white, width: 1)

            Button {
                Coordinator.next(state: .end)
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

struct ColoredView_Previews: PreviewProvider {
    static var previews: some View {
        ColoredView(index: 0)
    }
}
