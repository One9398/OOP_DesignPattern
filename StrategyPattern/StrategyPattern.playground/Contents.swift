//: Playground - noun: a place where people can play

import Foundation

//: 实现方式: 面向Interface编程(在Swift中就是Protocol), 而不是面向Implementation编程

//: #### 实例应用一
//: 一个Duck父类下有许多不同类型的Duck,具有不同的行为如有的Duck不会飞,有的Duck不会叫等等,,,需要让这些Duck容易扩展和修改,以及容易扩展新的行为和子类.

protocol FlyBehavior {
    func fly()
}

protocol QuarkBehavior {
    func quark()
}

class FlyWithWings: FlyBehavior {
    func fly() {
        print("I'm flying !")
    }
}

class FlyNoWay: FlyBehavior {
    func fly() {
        print("I can't fly !")
    }
}

class Quark: QuarkBehavior {
    func quark() {
        print("I'm quark !")
    }
}

class MuteQuarl: QuarkBehavior {
    func quark() {
        print("I can't quark !")
    }
}

class Duck {
    var flyBehavior: FlyBehavior?
    var quarkBehavior: QuarkBehavior?
    
    // 构造方法
    init() {
    }
    
    // 动态改变行为
    func setFlyBehavior(behavior: FlyBehavior) {
        flyBehavior = behavior
    }
    
    func setQuarkBehavior(behavior: QuarkBehavior) {
        quarkBehavior = behavior
    }
    
    // 公共行为
    func swim() {
        print("\(self) is swiming !")
    }
    
    // 个性行为
    func performFly() {
        flyBehavior?.fly()
    }
    
    func performQuark() {
        quarkBehavior?.quark()
    }
}

class ModelDuck: Duck {
    override init() {
        super.init()
        
        flyBehavior = FlyWithWings()
        quarkBehavior = Quark()
    }
}

let modelDuck = ModelDuck()
modelDuck.swim()
modelDuck.performFly()
modelDuck.performQuark()

class LittleDuck: Duck {
    override init() {
        super.init()
        
        flyBehavior = FlyNoWay()
        quarkBehavior = Quark()
    }
}

let littleDuck = LittleDuck()
littleDuck.swim()
littleDuck.performQuark()
littleDuck.performFly()

//littleDuck grows up, Now It can fly !
littleDuck.setFlyBehavior(FlyWithWings()) // 让对象的行为进行动态修改.
littleDuck.performFly()


//: #### 实例应用二
protocol WeaponBehavior {
    func useWeapon()
}

class KinfeBehavior: WeaponBehavior {
    func useWeapon() {
        print("weapon is kinfe")
    }
}

class BowAndArrowBehavior: WeaponBehavior {
    func useWeapon() {
        print("weapon is Bow and Arrow")
    }
}

class SwordBehavior: WeaponBehavior {
    func useWeapon() {
        print("weapon is Sword")
    }
}

class Character {
    var weapon: WeaponBehavior?
    
    func setWeapon(behavior: WeaponBehavior) {
        weapon = behavior
    }
    
    func fighlt() {
       weapon?.useWeapon()
    }
}

class Queen: Character {
    override init() {
        super.init()
        weapon = BowAndArrowBehavior()
    }
}

class King: Character {
    override init() {
        super.init()
        weapon = KinfeBehavior()
    }
}

class Knight: Character {
    override init() {
        super.init()
        weapon = SwordBehavior()
    }
}

let king = King()
king.fighlt()

let queen = Queen()
queen.fighlt()

let knight = Knight()
king.fighlt()
