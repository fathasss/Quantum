namespace HawkingRadiationSimilation {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    operation Main() : Result[] {

        use qubits =  Qubit[3];

        let falling = qubits[0];       //Particle falling into a black hole
        let core = qubits[1];          //Particle inside a black hole
        let radiation = qubits[2];     //Hawking Radiation

        //The particle falling into the black hole and the information inside it are entangled
        H(falling);
        CNOT(falling, core);


        //Black holes emit Hawking radiation
        H(radiation);                    //Superposition
        CNOT(core, radiation);

        //Measurement
        let results = [
            M(falling),
            M(core),
            M(radiation)
        ];

        ResetAll(qubits);
        return results;
    }
}

