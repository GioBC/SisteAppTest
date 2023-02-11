//
//  ContentView.swift
//  SisteCreditoApp
//
//  Created by Giovanny Beltran on 8/02/23.
//

import SwiftUI

struct ContentView: View {
    
    //@ObservedRealmObject var group: Group
    
    @StateObject var viewModel: UserDataViewModel = UserDataViewModel(repository: DataRepository(httpClient: AFHTTPClient()))
    
    init(viewModel: UserDataViewModel = UserDataViewModel(repository: DataRepository(httpClient: AFHTTPClient()))) {
        _viewModel = StateObject(wrappedValue: viewModel)
       // _group = ObservedRealmObject(wrappedValue: group)
    }

    var body: some View {
            NavigationView {
                LoadingView(isShowing: $viewModel.activityIndicator) {
                    List(viewModel.filtereUsers, id: \.self) { user in
                    NavigationLink(destination: UserDetailView(
                        viewModel: viewModel,
                        id: user.id,
                        name: user.name,
                        phone: user.phone,
                        email: user.email)) {
                            Text(user.name)
                        }
                        
                    }.searchable(text: $viewModel.searchText)
                        .onChange(of: viewModel.searchText) { search in
                            viewModel.filtereUsers = viewModel.users.filter({ $0.name.starts(with: search)})
                        }
            }
            .onAppear {
                viewModel.getUsers()
                //group.users.append(UserObject(value: viewModel.users))
            }.navigationBarTitle(Constants.users)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}


