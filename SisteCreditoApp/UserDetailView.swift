//
//  UserDetailView.swift
//  SisteCreditoApp
//
//  Created by Giovanny Beltran on 8/02/23.
//

import SwiftUI

struct UserDetailView: View {
    
    var name: String
    var phone: String
    var email: String
    var id: Int
    @StateObject var viewModel: UserDataViewModel
    
    init(
        viewModel: UserDataViewModel = UserDataViewModel(repository: DataRepository(httpClient: AFHTTPClient())),
        id: Int,
        name: String,
        phone: String,
        email: String) {
            self.name = name
            self.phone = phone
            self.email = email
            self.id = id
            _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        Text(Constants.phone)
                        Text(phone)
                    }
                    VStack {
                        Text(Constants.email)
                        Text(email)
                    }
                }
                
                Text(Constants.publcations)
                    .bold()
                    .padding(.top, 5)
                    .underline(color: Color.black)
                
                LoadingView(isShowing: $viewModel.activityIndicator) {
                    List(viewModel.userDetail, id: \.self) { userDetail in
                        Text(userDetail.title)
                            .bold()
                        Text(userDetail.body)
                    }
                }
            }
        }.navigationTitle(name)
            .onAppear {
                viewModel.getUserDetail(id: id)
            }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(id: 0, name: "", phone: "", email: "").environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
