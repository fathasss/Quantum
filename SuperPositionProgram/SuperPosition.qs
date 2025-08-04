namespace SuperPositionProgram {
    
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    operation SuperPosition() : Result {

        use q = Qubit();    // Qubit tahsis et

        H(q);   // Süperpozisyon oluştur

        let result = M(q);  // Ölçüm

        Reset(q);   // Qubit'i temizle

        return result;
    }
}

