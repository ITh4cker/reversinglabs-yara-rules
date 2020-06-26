rule Win32_Ransomware_JSWorm : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"
        tc_detection_type   = "Ransomware"
        tc_detection_name   = "JSWorm"
        tc_detection_factor = 5

    strings:

        $find_files = {
            68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 89 BD ?? ?? ?? ?? 50 FF D6 85 C0 0F 84 ?? ?? ?? ?? 
            68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 FF D6 85 C0 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 
            85 ?? ?? ?? ?? 50 FF D6 85 C0 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 
            FF D6 85 C0 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 FF D6 85 C0 0F 84 
            ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 FF D6 85 C0 0F 84 ?? ?? ?? ?? 68 ?? 
            ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 FF D6 85 C0 0F 84 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? A8 ?? 
            0F 85 ?? ?? ?? ?? A8 ?? 0F 84 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 8D 95 ?? ?? ?? ?? 8D 
            8D ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 8B F0 C6 45 ?? ?? 8B 4E ?? 8B 56 ?? 3B CA 73 
            ?? 8D 41 ?? 89 46 ?? 8B C6 83 FA ?? 72 ?? 8B 06 C7 04 48 ?? ?? ?? ?? EB ?? 6A ?? C6 
            85 ?? ?? ?? ?? ?? 8B CE FF B5 ?? ?? ?? ?? 6A ?? E8 
        }

        $find_drives = {
            68 ?? ?? ?? ?? 6A ?? FF 15 ?? ?? ?? ?? 80 3D ?? ?? ?? ?? ?? BE ?? ?? ?? ?? 0F 84 ?? 
            ?? ?? ?? 8B CE C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C6 45 ?? ?? 8D 51 ?? 8A 01 
            41 84 C0 75 ?? 2B CA 51 56 8D 4D ?? E8 ?? ?? ?? ?? 83 EC ?? C7 45 ?? ?? ?? ?? ?? 8B 
            CC 89 65 ?? 33 C0 6A ?? 68 ?? ?? ?? ?? C7 41 ?? ?? ?? ?? ?? C7 41 ?? ?? ?? ?? ?? 66 
            89 01 E8 ?? ?? ?? ?? 83 EC ?? C6 45 ?? ?? 8D 55 ?? 8B CC E8 ?? ?? ?? ?? C6 45 ?? ?? 
            E8 ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 83 C4 ?? 8B 55 ?? 83 FA ?? 72 ?? 8B 4D ?? 42 8B 
            C1 81 FA ?? ?? ?? ?? 72 ?? 8B 49 ?? 83 C2 ?? 2B C1 83 C0 ?? 83 F8 ?? 77 ?? 52 51 E8 
            ?? ?? ?? ?? 83 C4 ?? 8B C6 8D 50 ?? 8A 08 40 84 C9 75 ?? 2B C2 46 03 F0 38 0E 0F 85 
            ?? ?? ?? ?? 8B 4D ?? 64 89 0D ?? ?? ?? ?? 59 5E 8B 4D ?? 33 CD E8 ?? ?? ?? ?? 8B E5 
            5D C3 E8 ?? ?? ?? ?? E8 
        }

        $encrypt_files_p1 = {
            8B 00 50 FF 15 ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? 8B F0 83 FA ?? 72 ?? 8B 8D ?? ?? ?? ?? 
            42 8B C1 81 FA ?? ?? ?? ?? 72 ?? 8B 49 ?? 83 C2 ?? 2B C1 83 C0 ?? 83 F8 ?? 0F 87 ?? 
            ?? ?? ?? 52 51 E8 ?? ?? ?? ?? 83 C4 ?? C7 45 ?? ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? C7 85 
            ?? ?? ?? ?? ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? C6 85 ?? ?? ?? ?? ?? 83 FA ?? 
            72 ?? 8B 8D ?? ?? ?? ?? 8D 14 55 ?? ?? ?? ?? 8B C1 81 FA ?? ?? ?? ?? 72 ?? 8B 49 ?? 
            83 C2 ?? 2B C1 83 C0 ?? 83 F8 ?? 0F 87 ?? ?? ?? ?? 52 51 E8 ?? ?? ?? ?? 83 C4 ?? 8B 
            CB C7 85 ?? ?? ?? ?? ?? ?? ?? ?? 83 E6 ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? 33 C0 66 89 
            85 ?? ?? ?? ?? 8D 51 ?? 66 8B 01 83 C1 ?? 66 85 C0 75 ?? 2B CA D1 F9 51 53 8D 8D ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 83 78 ?? ?? 72 ?? 8B 00 56 50 FF 15 ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? 83 FA 
            ?? 72 ?? 8B 8D ?? ?? ?? ?? 42 8B C1 81 FA ?? ?? ?? ?? 72 ?? 8B 49 ?? 83 C2 ?? 2B C1 
            83 C0 ?? 83 F8 ?? 0F 87 ?? ?? ?? ?? 52 51 E8 ?? ?? ?? ?? 83 C4 ?? C7 45 ?? ?? ?? ?? 
            ?? 8B 95 ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? C6 
            85 ?? ?? ?? ?? ?? 83 FA ?? 72 ?? 8B 8D ?? ?? ?? ?? 8D 14 55 ?? ?? ?? ?? 8B C1 81 FA 
            ?? ?? ?? ?? 72 ?? 8B 49 ?? 83 C2 ?? 2B C1 83 C0 ?? 83 F8 ?? 0F 87 ?? ?? ?? ?? 52 51 
            E8 ?? ?? ?? ?? 83 C4 ?? 6A ?? 68 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? 53 FF 
            15 ?? ?? ?? ?? 8B D8 8D 45 ?? 50 53 89 9D ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 83 7D ?? ?? 
            0F 8C ?? ?? ?? ?? 7F ?? 81 7D ?? ?? ?? ?? ?? 0F 86 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 53 
            FF 15 ?? ?? ?? ?? 6A ?? 8D 45 ?? 50 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 53 FF 15 ?? ?? ?? 
            ?? 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 6A ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? C7 85 ?? ?? ?? 
            ?? ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? 68 ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 83 C4 ?? 8B F8 89 BD ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? 57 E8 ?? ?? ?? ?? 
            B9 ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? BE ?? ?? ?? ?? 83 C4 ?? F3 A5 8D 8D ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? 33 F6 
        }


        $encrypt_files_p2 = {
            8B 86 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 8B 86 ?? ?? ?? ?? 89 85 ?? ?? 
            ?? ?? 8D 85 ?? ?? ?? ?? 50 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 89 
            86 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 89 86 ?? ?? ?? ?? 83 C6 ?? 81 FE ?? ?? ?? ?? 7C ?? 
            6A ?? 6A ?? 6A ?? 53 FF 15 ?? ?? ?? ?? 6A ?? 8D 45 ?? 50 FF 75 ?? 68 ?? ?? ?? ?? 53 
            FF 15 ?? ?? ?? ?? 53 FF 15 ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? 83 EC ?? 8B F4 8B CA 33 C0 
            C7 46 ?? ?? ?? ?? ?? 8D 79 ?? C7 46 ?? ?? ?? ?? ?? 66 89 06 66 8B 01 83 C1 ?? 66 85 
            C0 75 ?? E9 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 53 8B 1D ?? ?? ?? ?? FF D3 6A ?? 8D 45 ?? 
            50 FF 75 ?? 68 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 85 
            ?? ?? ?? ?? 6A ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? C7 85 ?? 
            ?? ?? ?? ?? ?? ?? ?? 68 ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 8B 
            F8 89 BD ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? 57 E8 ?? ?? ?? ?? 83 C4 ?? C7 85 ?? ?? ?? 
            ?? ?? ?? ?? ?? B9 ?? ?? ?? ?? BE ?? ?? ?? ?? F3 A5 8B 45 ?? 8D 8D ?? ?? ?? ?? 50 68 
            ?? ?? ?? ?? 50 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B B5 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 56 
            FF D3 6A ?? 8D 45 ?? 50 FF 75 ?? 68 ?? ?? ?? ?? 56 FF 15 ?? ?? ?? ?? 56 FF 15
        }

    condition:
        uint16(0) == 0x5A4D and $find_drives and $find_files and (all of ($encrypt_files_p*))
}