rule Win32_Ransomware_Satan : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"
        tc_detection_type   = "Ransomware"
        tc_detection_name   = "Satan"
        tc_detection_factor = 5

    strings:

        $remote_connection = {
            55 8B EC B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? A1 ?? ?? ?? ?? 33 C5 89 45 ?? 53 56 57 68 ?? 
            ?? ?? ?? 8D 85 ?? ?? ?? ?? 6A ?? 50 E8 ?? ?? ?? ?? 6A ?? 8D 85 ?? ?? ?? ?? 6A ?? 50 
            E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 83 
            C4 ?? 8D 85 ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 8D 85 ?? ?? 
            ?? ?? 89 85 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 89 85 
            ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 
            6A ?? 68 ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? C7 
            85 ?? ?? ?? ?? ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? 
            ?? FF 15 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? FF 15 ?? ?? ?? ?? 6A ?? FF B5 ?? 
            ?? ?? ?? 89 85 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 50 C7 45 ?? ?? ?? 
            ?? ?? FF 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? 
            89 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 8B 1D ?? ?? ?? ?? 8B F0 6A ?? 
            6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 56 FF D3 8B 3D ?? ?? ?? ?? 6A ?? 56 FF D7 8D 45 ?? 50 
            8D 45 ?? 50 8D 45 ?? 50 6A ?? 68 ?? ?? ?? ?? 56 FF 15 ?? ?? ?? ?? 56 FF 15 ?? ?? ?? 
            ?? 68 ?? ?? ?? ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF B5 
            ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 50 89 85 ?? ?? ?? 
            ?? FF D3 8B 9D ?? ?? ?? ?? 6A ?? 53 FF D7 68 ?? ?? ?? ?? 33 FF E8 ?? ?? ?? ?? 83 C4 
            ?? 8B F0 57 68 ?? ?? ?? ?? 6A ?? 57 6A ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 15 ?? ?? 
            ?? ?? 89 85 ?? ?? ?? ?? 39 7D ?? 76 ?? 68 ?? ?? ?? ?? 6A ?? 56 E8 ?? ?? ?? ?? 83 C4 
            ?? 8D 45 ?? 50 68 ?? ?? ?? ?? 56 53 FF 15 ?? ?? ?? ?? 8B 45 ?? 8D 4D ?? 6A ?? 51 50 
            56 FF B5 ?? ?? ?? ?? 03 F8 FF 15 ?? ?? ?? ?? 39 7D ?? 77 ?? 8B 85 ?? ?? ?? ?? 50 FF 
            15 ?? ?? ?? ?? 6A ?? 56 E8 ?? ?? ?? ?? 8B 35 ?? ?? ?? ?? 83 C4 ?? 53 FF D6 FF B5 ?? 
            ?? ?? ?? FF D6 FF B5 ?? ?? ?? ?? FF D6 8B 4D ?? 5F 5E 33 CD 5B E8 ?? ?? ?? ?? 8B E5 
            5D C3 
        }

        $search_processes = {
            6A ?? 6A ?? FF 15 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? 
            ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? 
            ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? 
            ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? 
            ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? 51 50 
            FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8B 3D ?? ?? ?? ?? 8B 1D ?? ?? ?? ?? 0F 1F 
            44 00 ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 6A ?? 8D 85 ?? ?? ?? ?? 
            50 FF 15 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 33 F6 8B 4C B5 ?? 
            8D 85 ?? ?? ?? ?? 0F 1F 44 00 ?? 8A 11 3A 10 75 ?? 84 D2 74 ?? 8A 51 ?? 3A 50 ?? 75 
            ?? 83 C1 ?? 83 C0 ?? 84 D2 75 ?? 33 C0 EB ?? 1B C0 83 C8 ?? 85 C0 75 ?? FF B5 ?? ?? 
            ?? ?? 50 68 ?? ?? ?? ?? FF D7 6A ?? 50 FF D3 46 83 FE ?? 76 ?? 8D 85 ?? ?? ?? ?? 50 
            FF B5 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? 8B 4D ?? 5F 5E 33 CD 5B 
            E8 ?? ?? ?? ?? 8B E5 5D C3 
        }

        $encrypt_files = {
            55 8B EC 6A ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 64 A1 ?? ?? ?? ?? 50 83 EC ?? A1 ?? ?? 
            ?? ?? 31 45 ?? 33 C5 89 45 ?? 53 56 57 50 8D 45 ?? 64 A3 ?? ?? ?? ?? 89 4D ?? 8B 4D 
            ?? 8B 45 ?? 89 45 ?? 8B 45 ?? 89 45 ?? C6 45 ?? ?? C7 45 ?? ?? ?? ?? ?? 83 CB ?? 89 
            5D ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? 33 F6 89 75 ?? 89 75 ?? 56 68 ?? ?? 
            ?? ?? 6A ?? 56 6A ?? 6A ?? 51 8B 3D ?? ?? ?? ?? FF D7 89 45 ?? 3B C3 0F 84 ?? ?? ?? 
            ?? 56 68 ?? ?? ?? ?? 6A ?? 56 6A ?? 6A ?? FF 75 ?? FF D7 8B D8 89 5D ?? 83 FB ?? 0F 
            84 ?? ?? ?? ?? 8B 7D ?? 8B 07 85 C0 0F 84 ?? ?? ?? ?? 8D 4D ?? 51 56 56 68 ?? ?? ?? 
            ?? 50 FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 56 FF 75 ?? FF 15 ?? ?? ?? ?? 50 FF 
            75 ?? FF 75 ?? FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8D 45 ?? 50 68 ?? ?? ?? ?? 
            FF 75 ?? 68 ?? ?? ?? ?? FF 37 FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 68 ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? 83 C4 ?? 8B F0 89 75 ?? 85 F6 0F 84 ?? ?? ?? ?? 32 C0 89 45 ?? 88 
            45 ?? 33 FF 89 7D ?? C7 45 ?? ?? ?? ?? ?? 6A ?? 8D 45 ?? 50 68 ?? ?? ?? ?? 56 FF 75 
            ?? FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8B 45 ?? 0F B6 C0 81 7D ?? ?? ?? ?? ?? 
            B9 ?? ?? ?? ?? 0F 42 C1 89 45 ?? 88 45 ?? 68 ?? ?? ?? ?? 8D 4D ?? 51 56 6A ?? 0F B6 
            C0 50 6A ?? FF 75 ?? FF 15 ?? ?? ?? ?? 85 C0 74 ?? 85 FF 75 ?? 57 8D 45 ?? 50 68 ?? 
            ?? ?? ?? FF 35 ?? ?? ?? ?? 53 FF 15 ?? ?? ?? ?? 6A ?? 8D 45 ?? 50 FF 75 ?? 56 53 FF 
            15 ?? ?? ?? ?? 85 C0 74 ?? 47 89 7D ?? 8B 45 ?? 84 C0 0F 84 ?? ?? ?? ?? 80 7D ?? ?? 
            74 ?? 83 05 ?? ?? ?? ?? ?? C6 45 ?? ?? C7 45 ?? ?? ?? ?? ?? E8 ?? ?? ?? ?? 8A 45 ?? 
            8B 4D ?? 64 89 0D ?? ?? ?? ?? 59 5F 5E 5B 8B 4D ?? 33 CD E8 ?? ?? ?? ?? 8B E5 5D C2 
        }

        $search_files_in_specific_folders_p1 = {
            51 8D 85 ?? ?? ?? ?? 8B CE 50 E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 83 
            C4 ?? 8B F0 F6 85 ?? ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 80 7D ?? ?? 0F 84 ?? ?? ?? ?? 68 
            ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 
            ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 
            ?? 85 C0 0F 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? 
            ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? ?? ?? ?? 68 ?? ?? 
            ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? 
            ?? ?? 83 C4 ?? 85 C0 0F 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 85 
            C0 0F 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? ?? ?? 
            ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 
            56 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 
            83 C4 ?? 85 C0 0F 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 
            85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? ?? ?? ?? 68 
            ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 
            ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 
            ?? 85 C0 0F 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? 
            ?? ?? ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 0F 85 ?? ?? ?? ?? 83 FF
        }

        $search_files_in_specific_folders_p2 = {
            75 ?? FF 75 ?? 8D 55 ?? 8B CB 57 FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B F0 83 C4 ?? 85 
            F6 0F 85 ?? ?? ?? ?? E9 ?? ?? ?? ?? 83 FF ?? 0F 85 ?? ?? ?? ?? FF 75 ?? 8D 55 ?? 8B 
            CB 57 FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B F0 83 C4 ?? 85 F6 0F 85 ?? ?? ?? ?? E9 ?? 
            ?? ?? ?? 80 BD ?? ?? ?? ?? ?? 75 ?? 33 C9 EB ?? 8D 8D ?? ?? ?? ?? 8D 51 ?? 8A 01 41 
            84 C0 75 ?? 2B CA 51 8D 85 ?? ?? ?? ?? 50 8D 4D ?? E8 ?? ?? ?? ?? 6A ?? 83 EC ?? 8D 
            4D ?? E8 ?? ?? ?? ?? 6A ?? 40 8D 4D ?? 50 8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 8B F0 
            8D 45 ?? 3B C6 74 ?? 8B 45 ?? 83 F8 ?? 72 ?? 40 6A ?? 50 FF 75 ?? E8 ?? ?? ?? ?? 83 
            C4 ?? 56 8D 4D ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C6 45 ?? ?? E8 ?? ?? ?? 
            ?? 8B 85 ?? ?? ?? ?? 83 F8 ?? 72 ?? 40 6A ?? 50 FF B5 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 
            C4 ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? C7 85 ?? ?? ?? ?? ?? ?? ?? ?? C6 85 ?? ?? ?? ?? 
            ?? 8D 8D ?? ?? ?? ?? C6 45 ?? ?? E8 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 
            EC ?? C6 45 ?? ?? 8D 4D ?? 54 E8 ?? ?? ?? ?? 83 EC ?? 8D 4D ?? 54 E8 ?? ?? ?? ?? 83 
            EC ?? 8D 4D ?? 54 E8 ?? ?? ?? ?? BA ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 
            C4 ?? 8D 8D ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 FF ?? 75 ?? 8B 8D ?? ?? ?? ?? 8D 45 ?? 50 
            8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 8D 4D ?? C6 45 ?? ?? 51 8B C8 E8 ?? ?? ?? ?? 84 
            C0 8D 8D ?? ?? ?? ?? 0F 94 C3 EB ?? 83 FF ?? 75 ?? 8B 8D ?? ?? ?? ?? 8D 45 ?? 50 8D 
            85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 8D 4D ?? C6 45 ?? ?? 51 8B C8 E8 ?? ?? ?? ?? 8A D8
        }

        $search_files_in_specific_folders_p3 = {
            8D 8D ?? ?? ?? ?? C6 45 ?? ?? E8 ?? ?? ?? ?? 84 DB 8B 9D ?? ?? ?? ?? 74 ?? 8D 45 ?? 
            8B CB 50 E8 ?? ?? ?? ?? 8B B5 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 56 FF 15 ?? ?? ?? ?? 
            83 F8 ?? 0F 84 ?? ?? ?? ?? 56 FF 15 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 8B F0 83 FE ?? 75 
            ?? 33 F6 8D 4D ?? E8 ?? ?? ?? ?? 8B 45 ?? 83 F8 ?? 72 ?? 40 6A ?? 50 FF B5 ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? 83 C4 ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C6 85 ?? ?? ?? 
            ?? ?? 8D 8D ?? ?? ?? ?? C6 45 ?? ?? E8 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            8B 45 ?? 83 F8 ?? 72 ?? 40 6A ?? 50 FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? C7 45 ?? ?? ?? 
            ?? ?? C7 45 ?? ?? ?? ?? ?? C6 45 ?? ?? 8D 4D ?? C6 45 ?? ?? E8 ?? ?? ?? ?? 8D 4D ?? 
            E8 ?? ?? ?? ?? 8B 45 ?? 83 F8 ?? 72 ?? 40 6A ?? 50 FF 75 ?? E8 ?? ?? ?? ?? 83 C4 ?? 
            C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C6 45 ?? ?? 8D 4D ?? C6 45 ?? ?? E8 ?? ?? 
            ?? ?? 8D 4D ?? E8 ?? ?? ?? ?? 8B 45 ?? 83 F8 ?? 72 ?? 40 6A ?? 50 FF 75 ?? E8 ?? ?? 
            ?? ?? 83 C4 ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? C6 45 ?? ?? 8D 4D ?? C7 45 
            ?? ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 4D ?? E8 ?? ?? ?? ?? 8B C6 8B 4D ?? 64 89 0D ?? ?? 
            ?? ?? 59 5F 5E 5B 8B 4D ?? 33 CD E8 ?? ?? ?? ?? 8B E5 5D C3 
        }

    condition:
        uint16(0) == 0x5A4D and 
        (
            $search_processes and 
            (
                all of ($search_files_in_specific_folders_p*)
            ) and 
            $encrypt_files and 
            $remote_connection
        )
}