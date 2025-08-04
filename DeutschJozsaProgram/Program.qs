namespace DeutschJozsaProgram {

    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation RunDeutschJozsa() : Result[] {
        let n = 3; // 3 qubitlik bir fonksiyon kullanalım
        use inputQubits = Qubit[n];
        use outputQubit = Qubit();

        // Başlangıç durumu hazırlama
        ApplyToEach(H, inputQubits);
        X(outputQubit);
        H(outputQubit);

        // Oracle (Sabit ya da Dengeli fonksiyon burada belirleniyor)
        BalancedOracle(inputQubits, outputQubit);
        // ConstantOracle(inputQubits, outputQubit);

        // Hadamard tekrar
        ApplyToEach(H, inputQubits);

        // Ölçüm
        let results = MResetEachZ(inputQubits);
        Reset(outputQubit);

        return results;
    }
    // Sabit (Constant) Oracle – tüm sonuçlar aynı (örneğin: 0 döndürür hep)
    operation ConstantOracle(input : Qubit[], output : Qubit) : Unit {
        // Do nothing (sürekli 0 döndürüyor)
    }

    // Dengeli (Balanced) Oracle – çıktı girdinin paritesine göre değişir
    operation BalancedOracle(input : Qubit[], output : Qubit) : Unit {
        for q in input {
            CNOT(q, output);
        }
    }
}

