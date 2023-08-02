
protocol SwimBehavior{
    func swim()
}

class ProfessionalSwimmer: SwimBehavior {
    func swim() {
        print("professional swimmer")
    }
}

class NonSwimmer: SwimBehavior {
    func swim() {
        print("non swimmer")
    }
}

protocol DiveBehavior {
    func dive()
}

class ProfessionalDiver: DiveBehavior {
    func dive() {
        print("profession diver")
    }
}

class NewbieDiver : DiveBehavior {
    func dive() {
        print("newbie diver")
    }
}

class NonDiving: DiveBehavior {
    func dive() {
        print("Non diving")
    }
}


class Human {
    var diveBehavior: DiveBehavior!
    var swimBehavior: SwimBehavior!
    
    func performSwim() {
        swimBehavior.swim()
    }
    
    func performDive() {
        diveBehavior.dive()
    }
    
    func setSwimBegavior(sb: SwimBehavior) {
        self.swimBehavior = sb
    }
    
    func setDiveBegavior(db: DiveBehavior) {
        self.diveBehavior = db
    }
    
    func run() {
        print("running")
    }
}

let human = Human()
human.setDiveBegavior(db: NewbieDiver())
human.performDive()

human.setSwimBegavior(sb: ProfessionalSwimmer())
human.performSwim()

