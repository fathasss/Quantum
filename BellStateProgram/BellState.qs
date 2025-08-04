namespace BellStateProgram {
    
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Measurement;

    operation BellState() : (Result, Result) {

        use (q0, q1) = (Qubit(), Qubit());

        // Bell durumu oluştur
        H(q0);
        CNOT(q0,q1);

        let r1 = M(q0);
        let r2 = M(q1);

        ResetAll([q0,q1]);

        return (r1,r2);
    }
}