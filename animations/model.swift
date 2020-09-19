//
//  model.swift
//  animations
//
//  Created by Кирилл Файфер on 18.09.2020.
//  Copyright © 2020 Кирилл Файфер. All rights reserved.
//

import Foundation

class Animation {
    let preset: String
    let curve: String
    let count: Int
    
    init (preset: String, curve: String, count: Int) {
        self.preset = preset
        self.curve = curve
        self.count = count
    }
}

extension Animation {
   static func getAnimations () -> [Animation] {
        return [Animation(preset: "slideLeft", curve: "easeInCirc", count: 0),
                Animation(preset: "fadeOut", curve: "easeInQuad", count: 1),
                Animation(preset: "zoomIn", curve: "easeOutQuart", count: 2),
                Animation(preset: "pop", curve: "easeInBack", count: 3),
                Animation(preset: "squeezeRight", curve: "easeIn", count: 4)]
    }
}












