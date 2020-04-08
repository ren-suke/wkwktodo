//
//  FeedBackGenerator.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/25.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FeedbackGenerator {
    class func notificationOccurred(_ notificationType: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(notificationType)
    }
    class func impactOccurred(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

extension ControlEvent {
    func notificationOccurred(_ notificationType: UINotificationFeedbackGenerator.FeedbackType) -> Observable<Element> {
        return self.do(onNext: { _ in
            FeedbackGenerator.notificationOccurred(notificationType)
        })
    }
    func impactOccurred(_ style: UIImpactFeedbackGenerator.FeedbackStyle) -> Observable<Element> {
        return self.do(onNext: { _ in
            FeedbackGenerator.impactOccurred(style)
        })
    }
}
