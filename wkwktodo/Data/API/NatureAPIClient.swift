//
//  NatureAPI C.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/26.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift

class NatureAPIClient {
    private let baseURL = ""
    static func getEmotgionValue(with text: String) -> Observable<Float> {
        print(text)
        return Observable<Float>
            .create { observer in
                let randomFloat = Float.random(in: 1...10000)
                observer.onNext(randomFloat)
                return Disposables.create()
            }
    }
}
