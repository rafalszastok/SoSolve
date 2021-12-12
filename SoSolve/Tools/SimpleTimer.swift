//
//  SimpleTimer.swift
//  SoSolve
//
//  Created by Rafal Szastok on 12/12/2021.
//

import Foundation

public final class SimpleTimer {
    private class TimerTarget {
        var action: (() -> Void)?

        @objc func timerTick(sender _: Any?) {
            action?()
        }
    }

    private let timer: Timer
    private let timerTarget: TimerTarget?

    public var action: (() -> Void)? {
        get {
            return timerTarget?.action
        }
        set {
            timerTarget?.action = newValue
        }
    }

    public init(
        delay: TimeInterval,
        repeats: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        let timerTarget = TimerTarget()
        timerTarget.action = action

        let timer = Timer.scheduledTimer(
            timeInterval: delay,
            target: timerTarget,
            selector: #selector(timerTarget.timerTick),
            userInfo: nil,
            repeats: repeats
        )

        self.timer = timer
        self.timerTarget = timerTarget
    }

    deinit {
        timer.invalidate()
    }
}
