namespace LarmorEffectSimulation {

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Diagnostics;

    operation Main() : Result {
        let duration = 1.0;
        let magneticField = 1.0;
        let gamma = 2.8e10;

        let omega = gamma * magneticField;
        let theta = omega * duration;

        use q = Qubit();
        H(q);

        Rx(theta,q);

        H(q);
        
        let result = M(q);

        Reset(q);
        return result;
      
    }
}

