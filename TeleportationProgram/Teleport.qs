namespace TeleportationProgram {

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Measurement;


    operation Teleport() : Result {
        
        // 3 qubit kullanıyoruz: 
        // q0 - Alice’in elindeki teleport edilecek qubit
        // q1 - Alice’in dolanık çiftteki qubiti
        // q2 - Bob’un dolanık çiftteki qubiti
        use (q0, q1, q2) = (Qubit(), Qubit(), Qubit());

        // 1. Adım: Alice teleport edilecek qubit’e rastgele bir süperpozisyon uygulasın
        H(q0); // q0 artık |+> durumunda (süperpozisyon)

        // 2. Adım: q1 ve q2’yi dolanık hale getir (Bell pair)
        H(q1);
        CNOT(q1, q2);

        // 3. Adım: Alice, q0 ve q1’i ölçer (Bell measurement)
        CNOT(q0, q1);
        H(q0);

        let m0 = M(q0);
        let m1 = M(q1);

        // 4. Adım: Ölçüm sonuçlarına göre Bob düzeltme yapar
        if (m1 == One) {
            Z(q2);
        }

        if (m0 == One) {
            X(q2);
        }

        // 5. Adım: q2 artık q0’ın ilk durumunu taşıyor, ölçelim
        let result = M(q2);

        // Qubit’leri sıfırla
        ResetAll([q0, q1, q2]);

        return result;
    }
}