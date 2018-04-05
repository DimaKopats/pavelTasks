
final class Machine {
    enum State {
        case notRunning
        case ready
        case running
    }
    
    private(set) var state: State = .ready
    
    func startMachine() {
        print("Proccess starting...")
        state = .ready
        state = .running
        print("MACHINE IS RUNNING")
    }
    
    func stopMachine() {
        print("Proccess finishing...")
        state = .notRunning
        print("MACHINE STOPPED")
    }
}

final class RequestManager {
    var isConnected: Bool = false
    
    func connectToTerminal() {
        print("Conecting to terminal")
        isConnected = true
    }
    
    func disconnectToTerminal() {
        print("Disconecting to terminal")
        isConnected = false
    }
    
    func getStatusRequest(for machine: Machine) -> Machine.State {
        print("Sending status request...")
        return machine.state
    }
    
    func sendStartRequest(for machine: Machine) {
        print("Sending request to start the machine...")
        machine.startMachine()
    }
    
    func sendStopRequest(for machine: Machine) {
        print("Sending request to stop the machine...")
        machine.stopMachine()
    }
}



protocol Facade {
    func startMachine()
}

final class ConcreteFacade: Facade {
    func startMachine() {
        let machine = Machine()
        let manager = RequestManager()
        
        if !manager.isConnected {
            manager.connectToTerminal()
        }
        
        if manager.getStatusRequest(for: machine) == .ready {
            print("MACHINE IS READY")
            manager.sendStartRequest(for: machine)
        }
    }
}

let simpleInterface = ConcreteFacade()
simpleInterface.startMachine()


















