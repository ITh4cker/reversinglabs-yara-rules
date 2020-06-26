rule Win32_Ransomware_HydraCrypt : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"
        tc_detection_type   = "Ransomware"
        tc_detection_name   = "HydraCrypt"
        tc_detection_factor = 5

    strings:

        $remote_connection_1 = {
            55 8B EC 83 EC ?? 53 56 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 BE ?? ?? ?? ?? 56 
            33 DB 53 53 6A ?? 68 ?? ?? ?? ?? FF D0 68 ?? ?? ?? ?? 6A ?? 89 45 ?? E8 ?? ?? ?? ?? 
            59 59 53 53 6A ?? 53 53 6A ?? FF 75 ?? FF 75 ?? FF D0 89 45 ?? 3B C3 0F 84 ?? ?? ?? 
            ?? 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 53 56 53 53 68 ?? ?? ?? ?? FF 75 ?? 68 
            ?? ?? ?? ?? FF 75 ?? FF D0 89 45 ?? 3B C3 0F 84 ?? ?? ?? ?? 57 68 ?? ?? ?? ?? 6A ?? 
            E8 ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? 6A ?? FF D0 8B F0 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? 
            ?? FF 75 ?? 56 E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? FF 75 ?? 56 E8 ?? ?? 
            ?? ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? FF 75 ?? 56 E8 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 
            BF ?? ?? ?? ?? 57 89 45 ?? E8 ?? ?? ?? ?? FF 75 ?? 56 50 57 FF 75 ?? E8 ?? ?? ?? ?? 
            83 C4 ?? 5F 39 5D ?? 74 ?? FF 75 ?? E8 ?? ?? ?? ?? 59 39 5D ?? 74 ?? FF 75 ?? E8 ?? 
            ?? ?? ?? 59 39 5D ?? 5E 5B 74 ?? FF 75 ?? E8 ?? ?? ?? ?? 59 C9 C3 
        }

        $remote_connection_2 = {
            55 8B EC 83 EC ?? 53 56 57 6A ?? 59 68 ?? ?? ?? ?? 33 DB BE ?? ?? ?? ?? 8D 7D ?? 6A 
            ?? 89 5D ?? F3 A5 E8 ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? 53 53 53 8D 4D ?? 51 FF D0 8B 
            F8 3B FB 75 ?? 33 C0 E9 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 53 68 
            ?? ?? ?? ?? 53 53 FF 75 ?? 57 FF D0 8B F0 3B F3 75 ?? 53 E8 ?? ?? ?? ?? 59 EB ?? 68 
            ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 6A ?? 8D 4D ?? 51 FF D0 68 ?? ?? ?? ?? 6A ?? 
            E8 ?? ?? ?? ?? 59 59 8D 4D ?? 51 6A ?? 8D 4D ?? 51 56 FF D0 39 5D ?? 75 ?? 57 E8 ?? 
            ?? ?? ?? 56 E8 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 33 C0 83 C4 ?? 40 EB ?? 68 ?? ?? 
            ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? 8D 4D ?? 51 FF D0 33 C9 3B C8 1B C0 
            F7 D8 5F 5E 5B C9 C3 
        }

        $remote_connection_3 = {
            55 8B EC 81 EC ?? ?? ?? ?? 53 56 57 BE ?? ?? ?? ?? 8D 7D ?? A5 A5 33 DB 66 A5 53 8D 
            45 ?? 53 50 A4 E8 ?? ?? ?? ?? 59 50 E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 
            68 ?? ?? ?? ?? 6A ?? 89 45 ?? E8 ?? ?? ?? ?? 83 C4 ?? BE ?? ?? ?? ?? 56 53 FF D0 56 
            50 89 45 ?? E8 ?? ?? ?? ?? 8D 45 ?? 50 E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? 
            ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? 6A ?? FF D0 BF ?? ?? ?? ?? 57 50 89 45 ?? E8 ?? ?? ?? 
            ?? 59 59 85 DB 7E ?? 68 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 59 59 8B C3 6A ?? 99 59 
            F7 F9 85 D2 75 ?? 68 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? 6A ?? 
            E8 ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 51 FF D0 8B 45 ?? 0F B6 04 03 
            50 8D 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 50 FF 55 ?? 8D 85 ?? ?? ?? ?? 50 FF 75 ?? E8 ?? 
            ?? ?? ?? 83 C4 ?? 43 3B DE 7C ?? E8 ?? ?? ?? ?? 8B F0 E8 ?? ?? ?? ?? 50 56 8D 85 ?? 
            ?? ?? ?? 68 ?? ?? ?? ?? 50 FF 55 ?? 83 C4 ?? 83 7D ?? ?? BB ?? ?? ?? ?? BE ?? ?? ?? 
            ?? 75 ?? 53 56 57 8D 85 ?? ?? ?? ?? 50 FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? 83 7D ?? ?? 
            75 ?? 53 56 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? 5F 
            5E 5B C9 C3 
        }

        $encrypt_files_1 = {
            8A 45 ?? 04 ?? 66 98 66 89 45 ?? 0F B7 C0 50 8D 45 ?? 68 ?? ?? ?? ?? 50 FF 55 ?? 68 
            ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 83 C4 ?? 8D 4D ?? 51 FF D0 8B F0 83 FE ?? 74 ?? 83 
            FE ?? 74 ?? 83 FE ?? 75 ?? FF 75 ?? 8D 45 ?? 68 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 83 C4 
            ?? 83 FE ?? 74 ?? 83 FE ?? 75 ?? 8D 45 ?? 50 E8 ?? ?? ?? ?? 59 57 6A ?? E8 ?? ?? ?? 
            ?? 59 59 68 ?? ?? ?? ?? FF D0 FF 45 ?? 83 7D ?? ?? 0F 8C ?? ?? ?? ?? 83 3D ?? ?? ?? 
            ?? ?? 75 ?? 53 E8 ?? ?? ?? ?? 59 E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 59 BE 
            ?? ?? ?? ?? 56 6A ?? E8 ?? ?? ?? ?? 59 59 53 53 8D 8D ?? ?? ?? ?? 51 53 FF D0 8D 85 
            ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 59 E8 ?? ?? ?? ?? 83 F8 ?? 74 ?? 83 F8 ?? 74 ?? 83 F8 
            ?? 74 ?? 83 F8 ?? 74 ?? 83 F8 ?? 75 ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 3D ?? ?? ?? ?? 
            75 ?? E8 ?? ?? ?? ?? EB ?? 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 53 FF D0 56 6A 
            ?? E8 ?? ?? ?? ?? 59 59 53 6A ?? 8D 8D ?? ?? ?? ?? 51 53 FF D0 8D 85 ?? ?? ?? ?? 50 
            8D 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 50 FF 55 ?? 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 83 
            C4 ?? 6A ?? 53 53 8D 8D ?? ?? ?? ?? 51 68 ?? ?? ?? ?? 53 FF D0 57 6A ?? E8 ?? ?? ?? 
            ?? 59 59 68 ?? ?? ?? ?? FF D0 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 53 FF D0 5F 
            5E 33 C0 5B C9 C2 
        }

        $encrypt_files_2 = {
            55 8B EC 81 EC ?? ?? ?? ?? 53 56 57 BE ?? ?? ?? ?? 8D 7D ?? A5 A5 33 DB 66 A5 53 8D 
            45 ?? 53 50 A4 E8 ?? ?? ?? ?? 59 50 E8 ?? ?? ?? ?? BE ?? ?? ?? ?? 8D 7D ?? A5 A5 89 
            45 ?? 8D 45 ?? 50 66 A5 E8 ?? ?? ?? ?? 50 FF 75 ?? E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A 
            ?? 89 45 ?? E8 ?? ?? ?? ?? 83 C4 ?? 53 FF D0 BE ?? ?? ?? ?? 8D 7D ?? A5 A5 66 A5 BE 
            ?? ?? ?? ?? 8D 7D ?? A5 A5 A5 53 89 45 ?? 8D 45 ?? 53 50 66 A5 E8 ?? ?? ?? ?? 59 50 
            E8 ?? ?? ?? ?? 8B F0 8D 45 ?? 50 E8 ?? ?? ?? ?? 50 56 E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 
            6A ?? 89 45 ?? E8 ?? ?? ?? ?? 83 C4 ?? 53 6A ?? 8D 8D ?? ?? ?? ?? 51 53 FF D0 BF ?? 
            ?? ?? ?? 57 8D 85 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 FF 55 ?? 68 ?? 
            ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 83 C4 ?? 53 8D 8D ?? ?? ?? ?? 51 FF D0 68 ?? ?? ?? ?? 
            6A ?? E8 ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? 53 53 FF D0 8B F0 53 56 E8 ?? ?? ?? ?? 59 
            59 85 C0 74 ?? 56 E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 83 C4 ?? 53 FF 
            D0 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 51 FF
        }

        $encrypt_files_3 = { 
            D0 E8 ?? ?? ?? ?? 50 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? E8 ?? 
            ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 51 FF D0 85 C0 75 ?? BE ?? ?? ?? 
            ?? EB ?? 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? FF D0 56 E8 ?? ?? 
            ?? ?? 59 3C ?? 75 ?? BE ?? ?? ?? ?? 56 6A ?? E8 ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? 68 
            ?? ?? ?? ?? FF D0 56 6A ?? E8 ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF D0 
            E8 ?? ?? ?? ?? 56 6A ?? E8 ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 51 FF 
            D0 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 51 FF 
            D0 8D 85 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? 
            ?? ?? 83 C4 ?? 53 6A ?? 8D 8D ?? ?? ?? ?? 51 53 FF D0 68 ?? ?? ?? ?? 57 8D 85 ?? ?? 
            ?? ?? 50 BE ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 56 50 FF 55 ?? 68 ?? ?? ?? ?? 57 8D 85 ?? 
            ?? ?? ?? 50 8D 85 ?? ?? ?? ?? 56 50 FF 55 ?? 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 83 
            C4 ?? 68 ?? ?? ?? ?? FF D0 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? 
            ?? ?? 50 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? BE ?? ?? ?? ?? 8D 7D ?? A5 68 ?? ?? ?? 
            ?? 6A ?? 66 A5 E8 ?? ?? ?? ?? 83 C4 ?? 53 FF D0 6A ?? FF 75 ?? A3 ?? ?? ?? ?? FF 55 
            ?? 6A ?? FF 75 ?? 8B F0 FF 55 ?? FF 75 ?? 89 45 ?? 53 E8 ?? ?? ?? ?? 8D 45 ?? 50 FF
        }

        $encrypt_files_4 = { 
            35 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 66 85 C0 75 ?? 33 C0 40 E9 ?? ?? ?? ?? 8B 3D 
            ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 8B C8 8B 45 ?? 53 57 99 53 53 
            2B C2 68 ?? ?? ?? ?? D1 F8 2D ?? ?? ?? ?? 68 ?? ?? ?? ?? 50 8B C6 99 2B C2 D1 F8 2D 
            ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 45 ?? 50 53 FF D1 A3 ?? ?? ?? ?? E8 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? 
            8D 8D ?? ?? ?? ?? 51 FF D0 E8 ?? ?? ?? ?? 50 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 68 
            ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 51 FF D0 
            BE ?? ?? ?? ?? 85 C0 75 ?? 56 6A ?? E8 ?? ?? ?? ?? 59 59 53 53 53 68 ?? ?? ?? ?? 53 
            53 FF D0 56 6A ?? E8 ?? ?? ?? ?? 59 59 53 53 53 68 ?? ?? ?? ?? 53 53 FF D0 39 1D ?? 
            ?? ?? ?? 75 ?? 6A ?? 58 EB ?? 6A ?? 59 33 C0 68 ?? ?? ?? ?? 89 5D ?? 8D 7D ?? 6A ?? 
            F3 AB E8 ?? ?? ?? ?? 59 59 6A ?? FF D0 EB ?? 83 F8 ?? 74 ?? 68 ?? ?? ?? ?? 6A ?? E8 
            ?? ?? ?? ?? 59 59 8D 4D ?? 51 FF D0 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 8D 4D 
            ?? 51 FF D0 6A ?? 59 8D 75 ?? BF ?? ?? ?? ?? F3 A5 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? 
            ?? 59 59 53 53 53 8D 4D ?? 51 FF D0 3B C3 75 ?? 8B 45 ?? 5F 5E 5B C9 C2 ?? ?? 6A ?? 
            E9
        }

        $remote_connection_4 = {
            55 8B EC 51 51 53 56 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 33 F6 56 56 56 6A ?? 
            68 ?? ?? ?? ?? FF D0 68 ?? ?? ?? ?? 6A ?? 8B D8 E8 ?? ?? ?? ?? 59 59 56 56 6A ?? 56 
            56 6A ?? FF 75 ?? 53 FF D0 68 ?? ?? ?? ?? 6A ?? 89 45 ?? E8 ?? ?? ?? ?? 59 59 56 68 
            ?? ?? ?? ?? 56 56 68 ?? ?? ?? ?? FF 75 ?? 68 ?? ?? ?? ?? FF 75 ?? FF D0 68 ?? ?? ?? 
            ?? 6A ?? 89 45 ?? E8 ?? ?? ?? ?? 59 59 56 56 56 56 FF 75 ?? FF D0 53 E8 ?? ?? ?? ?? 
            FF 75 ?? E8 ?? ?? ?? ?? FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? 5E 5B C9 C3 
        }

        $remote_connection_5 = {
            55 8B EC 81 EC ?? ?? ?? ?? 53 56 57 33 FF 68 ?? ?? ?? ?? 47 57 E8 ?? ?? ?? ?? 59 59 
            68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 51 FF D0 FF 75 ?? 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? 
            ?? BE ?? ?? ?? ?? 56 57 E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 51 
            FF D0 56 57 E8 ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 51 FF D0 56 57 E8 
            ?? ?? ?? ?? 59 59 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 51 FF D0 68 ?? ?? ?? ?? 6A ?? E8 
            ?? ?? ?? ?? 59 59 8D 8D ?? ?? ?? ?? 51 6A ?? FF D0 BE ?? ?? ?? ?? 85 C0 74 ?? 56 57 
            E8 ?? ?? ?? ?? 59 59 6A ?? FF D0 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 59 59 6A ?? 57 
            6A ?? FF D0 8B D8 85 DB 7D ?? 56 57 E8 ?? ?? ?? ?? 59 59 6A ?? FF D0 68 ?? ?? ?? ?? 
            E8 ?? ?? ?? ?? C7 04 24 ?? ?? ?? ?? 6A ?? 8B F0 E8 ?? ?? ?? ?? 59 59 6A ?? 8D 4D ?? 
            51 FF D0 6A ?? 58 66 89 45 ?? 8B 46 ?? 8B 00 8B 00 6A ?? 89 45 ?? E8 ?? ?? ?? ?? 66 
            89 45 ?? 6A ?? 8D 45 ?? 50 53 E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 57 E8 ?? ?? ?? ?? 83 C4 
            ?? 8D 8D ?? ?? ?? ?? 51 FF D0 6A ?? 50 8D 85 ?? ?? ?? ?? 50 53 E8 ?? ?? ?? ?? 53 E8 
            ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 83 C4 ?? FF D0 5F 5E 5B C9 C3 
        }

    condition:
        uint16(0) == 0x5A4D and
        (
            (
                $encrypt_files_1 and
                $remote_connection_1 and
                $remote_connection_2 and
                $remote_connection_3
            ) or
            (
                $encrypt_files_2 and
                $encrypt_files_3 and
                $encrypt_files_4 and
                $remote_connection_4 and
                $remote_connection_5
            )
        )
}