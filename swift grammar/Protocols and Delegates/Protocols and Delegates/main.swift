
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation(){
        print("Please tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    
    init(handller: EmergencyCallHandler) {
        handller.delegate = self
    }
    
    func performCPR() {
        print("The Paramedic does chest compression, 30 per seconds ")
    }
}

class Docter: AdvancedLifeSupport {
    
    init(handller: EmergencyCallHandler) {
        handller.delegate = self
    }
    
    func performCPR() {
        print("The Docter does chest compression, 30 per seconds ")
    }
    
    func useStethscope(){
        print("Listening the heart sounds.")
    }
}

class Surgeon: Docter {
    override func performCPR() {
        super.performCPR()
        print("Stay alive by the BeeGees")
    }
    
    func useDrill() {
        print("Drrrrrrr")
    }
}

let emilio = EmergencyCallHandler()
//let pete = Paramedic(handller: emilio)
let sam = Surgeon(handller: emilio)

emilio.assessSituation()
emilio.medicalEmergency()

