//
//  ListPrimaryColor.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/24.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

enum FolderPrimaryColorType: String {
    case red
    case orange
    case yellow
    case green
    case lightBlue
    case blue
    case bluePurple
    case rose
    case purple
    case gold
    case silver
    case pink
    
    var color: UIColor {
        switch self {
        case .red:
            return R.color.red()!
        case .orange:
            return R.color.orange()!
        case .yellow:
            return R.color.yellow()!
        case .green:
            return R.color.green()!
        case .lightBlue:
            return R.color.lightBlue()!
        case .blue:
            return R.color.blue()!
        case .bluePurple:
            return R.color.bluePurple()!
        case .rose:
            return R.color.rose()!
        case .purple:
            return R.color.purple()!
        case .gold:
            return R.color.gold()!
        case .silver:
            return R.color.silver()!
        case .pink:
            return R.color.pink()!
        }
    }
}
