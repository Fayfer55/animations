//
//  ViewController.swift
//  animations
//
//  Created by Кирилл Файфер on 18.09.2020.
//  Copyright © 2020 Кирилл Файфер. All rights reserved.
//

import Spring

class AnimationsViewController: UIViewController {
    @IBOutlet var animationNameLabel: UILabel!
    @IBOutlet var animationNameButton: UIButton!
    @IBOutlet var springAnimationView: SpringView!
    
    private var animations = Animation.getAnimations()
    private var animationsCounter = 0
    
    @IBAction func startAnimations() {
        let animate = getAnimation()

        animationNameLabel.text = """
        Animation - \(animate.preset)
        Curve - \(animate.curve)
        """
        
        springAnimationView.animation = animate.preset
        springAnimationView.curve = animate.curve
        springAnimationView.animate()
        
        animationsCounter += 1
        
        let nextAnimation = getAnimation()
        
        animationNameButton.setTitle(nextAnimation.preset, for: .normal)
        
        if animationsCounter == animations.count {
            animationNameButton.setTitle("close to the end", for: .normal)
        } else if animationsCounter > animations.count {
            animationNameLabel.text = "No more animations"
            animationNameButton.setTitle("Stop clicking on me please", for: .normal)
        }
        // ещё один метод отображения анимаций последовательно, но я не придумал как
        // в данном случае делать отображение названия следующей анимации на кнопке
//       for animation in animations {
//
//                animationNameLabel.text = animation.preset
//
//                springAnimationView.animation = animation.preset
//                springAnimationView.curve = animation.curve
//                springAnimationView.animate()
//                break
//        }
//        animations.remove(at: 0)
    }
    
    private func getAnimation() -> Animation {
        var preset = ""
        var curve = ""

        for animation in animations {
            if animation.count == animationsCounter {
                preset = animation.preset
                curve = animation.curve
            }
        }
        return Animation(preset: preset, curve: curve, count: animationsCounter)
    }
}
