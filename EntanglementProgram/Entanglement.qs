namespace EntanglementProgram {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;

    operation Entanglement() : (Result, Result) {

        use q1 = Qubit();   //q1 qubit' i tanımlandı.
        use q2 = Qubit();   //q2 qubit' i tanımlandı.

        H(q1);  //q1 superpozisyonda

        CNOT(q1, q2); //Dolanıklık

        let result1 = M(q1);
        let result2 = M(q2);

        ResetAll([q1, q2]);

        return (result1, result2);
    }
}