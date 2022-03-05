//
//  MemoViewModel.swift
//  MemoApp
//
//  Created by 田中大地 on 2022/03/05.
//

import Foundation

class MemoViewModel: ObservableObject {
    @Published var memos: [Memo] = Array(Memo.findAll())
    
    func add(text: String){
        guard !text.isEmpty else { return }
        let memo = Memo()
        memo.text = text
        self.memos.append(memo)
        Memo.add(memo)
    }
}
