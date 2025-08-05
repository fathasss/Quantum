namespace MagneticFieldEffectSimulation {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;

    @EntryPoint()
    operation HelloQ() : Unit {
        Message("Hello quantum world!");
    }

    operation Main () : Result {
        let gamma = 2.802e10;
        let B = 0.0001;
        let t = 1e-6;

        let theta = gamma * B * t;
        use q = Qubit();

        H(q);

        R(PauliY,theta,q);

        H(q);
        let result = M(q);

        Reset(q);
        return result;
    }
}

