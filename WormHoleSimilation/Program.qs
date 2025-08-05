namespace WormHoleSimilation {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    operation Main() : Result[] {

        use traveler = Qubit[3];

        within {
            H(traveler[0]);
            H(traveler[1]);
            H(traveler[2]);
        } apply {
            CNOT(traveler[0], traveler[1]);
            CNOT(traveler[1], traveler[2]);
            H(traveler[1]);
        }

        Rz(1.23, traveler[0]);
        Ry(0.87, traveler[1]);
        Rz(0.45, traveler[2]);

        let results = [
            M(traveler[0]),
            M(traveler[1]),
            M(traveler[2])
        ];

        ResetAll(traveler);
        return results;
    }
}

