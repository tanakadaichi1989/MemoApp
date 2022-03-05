//
//  ContentView.swift
//  MemoApp
//
//  Created by 田中大地 on 2022/03/05.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @EnvironmentObject var memoVM: MemoViewModel
    @State var enteredText: String = ""
    
    var body: some View {
        var memos = memoVM.memos.sorted { $01.postedDate < $1.postedDate }
        
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter Text", text: $enteredText)
                        .padding(7)
                        .border(.gray)
                        .cornerRadius(5)
                    
                    Button(action: {
                        addMemo(text: enteredText)
                    },label: {
                        Text("Add")
                            .bold()
                    }
                    )
                        .buttonStyle(.borderedProminent)
                }
                .padding()
                
                List(memos){ memo in
                    VStack(alignment: .leading){
                        Text(memo.text)
                        Text((memo.postedDate.description))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .navigationTitle("Memo")
            }
            
        }
    }
    
    private func addMemo(text: String){
        memoVM.add(text: text)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .environmentObject(MemoViewModel())
    }
}
