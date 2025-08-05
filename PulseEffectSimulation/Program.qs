namespace PulseEffectSimilation {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;

    operation ApplyRxPulse() : Result{
        
        let theta = PI() / 4.0;
        use q = Qubit();

        // |0⟩ -> |+⟩ ile başla
        H(q);

        //Z rotasyonu (Z pulse)
        R(PauliZ,theta,q);

        H(q);
        let result = M(q);

        Reset(q);
        return result;
    }
}

