rule Win32_Ransomware_Sage : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"
        tc_detection_type   = "Ransomware"
        tc_detection_name   = "Sage"
        tc_detection_factor = 5

    strings:

        $remote_connection = {
            83 EC ?? 8B 44 24 ?? 53 55 56 57 8B 7C 24 ?? 8B 77 ?? 50 E8 ?? ?? ?? ?? 8B 4C 24 ?? 
            8B D8 51 89 5C 24 ?? E8 ?? ?? ?? ?? 83 C4 ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 89 44 24 
            ?? C7 44 24 ?? ?? ?? ?? ?? 89 77 ?? FF 15 ?? ?? ?? ?? 8B E8 89 6C 24 ?? 85 ED 0F 84 
            ?? ?? ?? ?? 8B 74 24 ?? 6A ?? 56 53 55 FF 15 ?? ?? ?? ?? 8B D8 89 5C 24 ?? 85 DB 0F 
            84 ?? ?? ?? ?? 8B 4C 24 ?? 33 C0 BA ?? ?? ?? ?? 66 3B F2 0F 95 C0 48 25 ?? ?? ?? ?? 
            50 6A ?? 6A ?? 6A ?? 51 68 ?? ?? ?? ?? 53 FF 15 ?? ?? ?? ?? 8B F0 85 F6 0F 84 ?? ?? 
            ?? ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 56 FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? 
            ?? 6A ?? 56 FF 15 ?? ?? ?? ?? 85 C0 74 ?? 8B 1D ?? ?? ?? ?? 8B 2D ?? ?? ?? ?? 8B FF 
            8D 54 24 ?? 52 56 FF D3 8D 44 24 ?? 50 8B 44 24 ?? 50 50 57 E8 ?? ?? ?? ?? 83 C4 ?? 
            50 56 FF D5 85 C0 0F 84 ?? ?? ?? ?? 83 7C 24 ?? ?? 75 ?? 6A ?? 8D 4C 24 ?? 51 8D 54 
            24 ?? 52 6A ?? 68 ?? ?? ?? ?? 56 C7 44 24 ?? ?? ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? FF 
            15 ?? ?? ?? ?? 8B 44 24 ?? 89 44 24 ?? 8B 5C 24 ?? 8B 6C 24 ?? 56 FF 15 ?? ?? ?? ?? 
            53 FF 15 ?? ?? ?? ?? 55 FF 15 ?? ?? ?? ?? 8B 5C 24 ?? 85 DB 74 ?? 53 E8 ?? ?? ?? ?? 
            83 C4 ?? 8B 44 24 ?? 5F 5E 5D 5B 85 C0 74 ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 8B 04 24 83 
            C4 ?? C3 57 E8 ?? ?? ?? ?? 83 C4
        }

        $encrypt_files = {
            83 EC ?? 53 8B 1D ?? ?? ?? ?? 55 8B 6C 24 ?? 56 57 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 68 
            ?? ?? ?? ?? 8D 7D ?? 57 FF D3 8B F0 83 FE ?? 74 ?? 8D 44 24 ?? 50 56 FF 15 ?? ?? ?? 
            ?? 89 44 24 ?? 3D ?? ?? ?? ?? 0F 87 ?? ?? ?? ?? 83 7C 24 ?? ?? 0F 85 ?? ?? ?? ?? 8B 
            4C 24 ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? 51 FF D3 8B D8 83 FB ?? 75 ?? 
            56 FF 15 ?? ?? ?? ?? 5F 5E 5D B8 ?? ?? ?? ?? 5B 83 C4 ?? C3 8B 54 24 ?? 6A ?? 52 57 
            56 53 E8 ?? ?? ?? ?? 83 C4 ?? 56 8B 35 ?? ?? ?? ?? 8B E8 FF D6 53 FF D6 85 ED 79 ?? 
            8B 44 24 ?? 50 FF 15 ?? ?? ?? ?? 5F 5E 8B C5 5D 5B 83 C4 ?? C3 57 E8 ?? ?? ?? ?? 8B 
            F0 56 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 57 8B D8 FF 15 ?? ?? ?? ?? 8B 4C 24 ?? 
            6A ?? 53 51 EB ?? 8B 4C 24 ?? BA ?? ?? ?? ?? 3B 55 ?? 1B C0 83 C0 ?? 50 51 57 56 56 
            E8 ?? ?? ?? ?? 83 C4 ?? 56 8B D8 FF 15 ?? ?? ?? ?? 85 DB 79 ?? 5F 5E 5D 8B C3 5B 83 
            C4 ?? C3 57 E8 ?? ?? ?? ?? 8B F0 56 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 6A ?? 8B 
            D8 53 57 FF 15 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 5F 5E 5D 33 
            C0 5B 83 C4 ?? C3 
        }

        $find_files = {
            53 55 8B 2D ?? ?? ?? ?? 56 57 33 FF 57 57 FF D5 8B F0 85 F6 74 ?? 85 FF 74 ?? 57 E8 
            ?? ?? ?? ?? 83 C4 ?? 8D 44 36 ?? 50 6A ?? 8B DE E8 ?? ?? ?? ?? 83 C4 ?? 8B F8 57 56 
            FF D5 8B F0 3B DE 72 ?? 66 83 3F ?? 8B DF 0F 84 ?? ?? ?? ?? 8B 6C 24 ?? 53 8B FB FF 
            15 ?? ?? ?? ?? 8B 35 ?? ?? ?? ?? 68 ?? ?? ?? ?? 57 8D 5C 43 ?? FF D6 85 C0 74 ?? 68 
            ?? ?? ?? ?? 57 FF D6 85 C0 74 ?? 57 FF 15 ?? ?? ?? ?? BA ?? ?? ?? ?? 8B C8 D3 E2 F6 
            C2 ?? 74 ?? 6A ?? 6A ?? E8 ?? ?? ?? ?? 57 8B F0 E8 ?? ?? ?? ?? 6A ?? 89 06 8D 46 ?? 
            6A ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 8D 4E ?? 51 C7 46 ?? ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 
            8D 56 ?? 52 E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 56 55 89 46 ?? E8 ?? ?? ?? 
            ?? 83 C4 ?? 66 83 3B ?? 0F 85 ?? ?? ?? ?? 5F 5E 5D 5B C3 
        }
        
    condition:
        uint16(0) == 0x5A4D and
        (
            $find_files
        ) and
        (
            $encrypt_files
        ) and
        (
            $remote_connection
        )
}