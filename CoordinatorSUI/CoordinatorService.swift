//
//  CoordinatorService.swift
//  CoordinatorSUI
//
//  Created by Dmitriy Soloshenko on 06.08.2022.
//

import SwiftUI

let Coordinator = CoordinatorService.instance

struct ContainerView : View {
    var view : AnyView

    init<V>(view: V) where V: View {
        self.view = AnyView(view)
    }

    var body: some View {
        view
       }
}


final class CoordinatorService: ObservableObject {
    
    enum State {
        case root
        case end
    }
    
    static let instance = CoordinatorService()
    
    @Published var modalVisibled = false
    @Published var modalView : ContainerView!
    @Published var container : ContainerView!

    private var stack  = [ContainerView]()
    
    private init() {
        self.push(view: ColoredView(index: 0))
    }

    func pop() {
        guard self.stack.count > 1 else { return }
        self.stack.remove(at: self.stack.count - 1)
        guard let last = self.stack.last else { return }
        self.container = last
    }
    
    func push<V: View>(view: V) {
        let containered = ContainerView(view: view)
        self.stack += [containered]
        self.container = containered
    }
    
    
    func modal<V: View>(view: V) {
        self.modalView = ContainerView(view: view)
        withAnimation {
            self.modalVisibled.toggle()
        }
    }

    func close() {
        withAnimation {
            self.modalVisibled.toggle()
        }
    }
    
    func next(state: State) {
        switch state {
            case .root :
                self.stack.removeAll()
                self.push(view: ColoredView())
            case.end:
                self.push(view: ColoredView(index: 6))
        }
    }
}
