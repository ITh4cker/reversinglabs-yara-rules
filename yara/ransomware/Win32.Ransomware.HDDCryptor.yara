rule Win32_Ransomware_HDDCryptor : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"
        tc_detection_type   = "Ransomware"
        tc_detection_name   = "HDDCryptor"
        tc_detection_factor = 5

    strings:

        $deploy_components = {
            B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 85 ?? 
            ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 66 83 BD ?? ?? ?? ?? ?? 6A ?? 53 0F 85 ?? ?? ?? ?? FF 
            15 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? BA ?? ?? ?? ?? 8B CB E8 ?? ?? ?? ?? 6A ?? 68 ?? 
            ?? ?? ?? BA ?? ?? ?? ?? 8B CB 8B F0 E8 ?? ?? ?? ?? 8B F8 6A ?? 0F AF FE 68 ?? ?? ?? 
            ?? BA ?? ?? ?? ?? 8B CB E8 ?? ?? ?? ?? 8B F0 6A ?? 0F AF F7 68 ?? ?? ?? ?? BA ?? ?? 
            ?? ?? 8B CB E8 ?? ?? ?? ?? 8B F8 6A ?? 0F AF FE 68 ?? ?? ?? ?? BA ?? ?? ?? ?? 8B CB 
            E8 ?? ?? ?? ?? 8B F0 6A ?? 0F AF F7 68 ?? ?? ?? ?? BA ?? ?? ?? ?? 8B CB E8 ?? ?? ?? 
            ?? 6A ?? 68 ?? ?? ?? ?? E9 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? BA ?? 
            ?? ?? ?? 8B CB E8 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? BA ?? ?? ?? ?? 8B CB 8B F0 E8 ?? 
            ?? ?? ?? 8B F8 6A ?? 0F AF FE 68 ?? ?? ?? ?? BA ?? ?? ?? ?? 8B CB E8 ?? ?? ?? ?? 8B 
            F0 6A ?? 0F AF F7 68 ?? ?? ?? ?? BA ?? ?? ?? ?? 8B CB E8 ?? ?? ?? ?? 8B F8 6A ?? 0F 
            AF FE 68 ?? ?? ?? ?? BA ?? ?? ?? ?? 8B CB E8 ?? ?? ?? ?? 8B F0 6A ?? 0F AF F7 68 ?? 
            ?? ?? ?? BA ?? ?? ?? ?? 8B CB E8 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? 8B F8 BA ?? ?? ?? 
            ?? 0F AF FE 8B CB E8
        }

        $get_shares_info = {
            E8 ?? ?? ?? ?? 83 C4 ?? 8D 4C 24 ?? E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 35 ?? ?? ?? ?? 
            68 ?? ?? ?? ?? 85 C0 75 ?? FF 15 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? B9 ?? ?? ?? ?? 
            E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? FF D6 68 ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? FF D6 68 ?? ?? ?? ?? EB ?? FF 15 ?? ?? 
            ?? ?? 85 C0 75 ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 
            ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 68 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? FF D6 8D 44 24 ?? 50 C7 44 24 ?? 
            ?? ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? 
            FF 15
        }

        $encrypt_discs = {
            68 ?? ?? ?? ?? FF 74 24 ?? 0F 57 C0 66 0F 7F 44 24 ?? C7 44 24 ?? ?? ?? ?? ?? FF 15 
            ?? ?? ?? ?? FF 15 ?? ?? ?? ?? FF 74 24 ?? FF 15 ?? ?? ?? ?? B9 ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 33 C9 EB ?? 8D 49 ?? 0F B7 81 ?? ?? ?? ?? 66 89 84 0C ?? ?? ?? ?? 8D 49 ?? 66 
            85 C0 75 ?? 8D 8C 24 ?? ?? ?? ?? 83 C1 ?? 66 8B 41 ?? 8D 49 ?? 66 85 C0 75 ?? A1 ?? 
            ?? ?? ?? 89 01 A1 ?? ?? ?? ?? 89 41 ?? A1 ?? ?? ?? ?? 89 41 ?? A1 ?? ?? ?? ?? 89 41 
            ?? A1 ?? ?? ?? ?? 89 41 ?? 0F B7 05 ?? ?? ?? ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? 66 89 41 
            ?? 8D 84 24 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 6A ?? FF 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 
            D7 B9 ?? ?? ?? ?? E8
        }

        $create_diskcryptor_service = {
            83 EC ?? 53 55 56 57 68 ?? ?? ?? ?? 33 ED 8B F2 55 55 8B F9 FF 15 ?? ?? ?? ?? 85 C0 
            74 ?? 55 55 55 55 55 FF 74 24 ?? 55 6A ?? 5B 53 6A ?? 68 ?? ?? ?? ?? 56 57 50 FF 15 
            ?? ?? ?? ?? 8B F0 89 5C 24 ?? B8 ?? ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? 89 44 24 ?? 33 
            C9 89 44 24 ?? 41 8D 44 24 ?? 89 4C 24 ?? 89 44 24 ?? 8D 44 24 ?? 50 53 56 89 4C 24 
            ?? C7 44 24 ?? ?? ?? ?? ?? 89 6C 24 ?? FF 15 ?? ?? ?? ?? 8B C6 5F 5E 5D 5B 83 C4 ?? 
            C3 
        }
        
        $extract_diskcryptor_from_resources = {
            81 EC ?? ?? ?? ?? A1 ?? ?? ?? ?? 33 C4 89 84 24 ?? ?? ?? ?? 53 55 56 8B B4 24 ?? ?? 
            ?? ?? 33 C0 57 50 89 54 24 ?? 8B E9 FF 15 ?? ?? ?? ?? 8B 8C 24 ?? ?? ?? ?? 8B D8 56 
            0F B7 C9 51 53 FF 15 ?? ?? ?? ?? 8B F0 56 53 FF 15 ?? ?? ?? ?? 56 53 8B F8 FF 15 ?? 
            ?? ?? ?? 57 89 44 24 ?? FF 15 ?? ?? ?? ?? FF 74 24 ?? 8B F0 E8 ?? ?? ?? ?? 59 FF 74 
            24 ?? 8B D8 56 53 E8 ?? ?? ?? ?? 8B 54 24 ?? 33 FF 83 C4 ?? 8B CF 85 D2 7E ?? 8A 04 
            19 3C ?? 7C ?? 3C ?? 7F ?? 04 ?? 3C ?? 76 ?? 2C ?? 88 04 19 41 3B CA 7C ?? 33 C0 68 
            ?? ?? ?? ?? 66 89 44 24 ?? 8D 44 24 ?? 57 50 E8 ?? ?? ?? ?? 83 C4 ?? 8B F5 66 8B 45 
            ?? 83 C5 ?? 66 3B C7 75 ?? 8D 7C 24 ?? 2B EE 83 EF ?? 33 C9 66 8B 47 ?? 83 C7 ?? 66 
            3B C1 75 ?? 8B CD C1 E9 ?? F3 A5 8B CD 83 E1 ?? F3 A4 8D 7C 24 ?? 83 EF ?? 33 ED 66 
            8B 47 ?? 8D 7F ?? 66 3B C5 75 ?? A1 ?? ?? ?? ?? 8B 54 24 ?? 8B F2 89 07 66 8B 02 83 
            C2 ?? 66 3B C5 75 ?? 8D 7C 24 ?? 2B D6 83 EF ?? 66 8B 47 ?? 83 C7 ?? 66 3B C5 75 ?? 
            8B CA 8D 44 24 ?? C1 E9 ?? F3 A5 55 55 6A ?? 55 55 8B CA 83 E1 ?? 68 ?? ?? ?? ?? F3 
            A4 50 FF 15 ?? ?? ?? ?? 8B F0 83 FE ?? 74 ?? 55 8D 44 24 ?? 50 FF 74 24 ?? 53 56 FF 
            15 ?? ?? ?? ?? 56 FF 15 ?? ?? ?? ?? 33 C0 40 EB ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 33 
            C0 8B 8C 24 ?? ?? ?? ?? 5F 5E 5D 5B 33 CC E8 ?? ?? ?? ?? 81 C4 ?? ?? ?? ?? C3 
        }
        
        $encrypt_files_using_diskcryptor_p1 = {
            55 8B EC 83 E4 ?? 6A ?? 68 ?? ?? ?? ?? 64 A1 ?? ?? ?? ?? 50 81 EC ?? ?? ?? ?? A1 ?? 
            ?? ?? ?? 33 C4 89 84 24 ?? ?? ?? ?? 53 56 57 A1 ?? ?? ?? ?? 33 C4 50 8D 84 24 ?? ?? 
            ?? ?? 64 A3 ?? ?? ?? ?? 8B 1D ?? ?? ?? ?? 68 ?? ?? ?? ?? FF D3 83 7D ?? ?? 73 ?? B9 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 6A ?? FF 15 ?? ?? ?? ?? 50 FF 15 ?? 
            ?? ?? ?? 8B 75 ?? BA ?? ?? ?? ?? 8B 4E ?? 8A 01 41 88 02 42 84 C0 75 ?? 8B 4E ?? BA 
            ?? ?? ?? ?? 8A 01 41 88 02 42 84 C0 75 ?? 6A ?? 59 BE ?? ?? ?? ?? C7 05 ?? ?? ?? ?? 
            ?? ?? ?? ?? 8D BC 24 ?? ?? ?? ?? C7 05 ?? ?? ?? ?? ?? ?? ?? ?? F3 A5 68 ?? ?? ?? ?? 
            33 F6 8D 84 24 ?? ?? ?? ?? 56 50 E8 ?? ?? ?? ?? 83 C4 ?? 8D 8C 24 ?? ?? ?? ?? E8 ?? 
            ?? ?? ?? 68 ?? ?? ?? ?? 8D 4C 24 ?? E8 ?? ?? ?? ?? 8D 54 24 ?? 89 B4 24 ?? ?? ?? ?? 
            8D 4C 24 ?? E8 ?? ?? ?? ?? 56 6A ?? 8D 4C 24 ?? C6 84 24 ?? ?? ?? ?? ?? E8 ?? ?? ?? 
            ?? 83 7C 24 ?? ?? 8D 44 24 ?? 56 0F 43 44 24 ?? 56 6A ?? 56 56 68 ?? ?? ?? ?? 50 FF 
            15 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF D3 8D 44 24 ?? C7 44 24 ?? ?? ?? ?? ?? 33 DB C7 44
        }

        $encrypt_files_using_diskcryptor_p2 = {
            24 ?? ?? ?? ?? ?? 50 89 5C 24 ?? 89 5C 24 ?? FF 15 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? 
            ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 50 53 FF 15 ?? 
            ?? ?? ?? FF 15 ?? ?? ?? ?? 8B F0 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 8B D0 59 59 85 D2 
            75 ?? 68 ?? ?? ?? ?? 56 E8 ?? ?? ?? ?? 59 59 8B D0 8D BC 24 ?? ?? ?? ?? 83 EF ?? 66 
            8B 47 ?? 8D 7F ?? 66 3B C3 75 ?? A1 ?? ?? ?? ?? 83 C2 ?? 89 07 8B F2 66 8B 02 83 C2 
            ?? 66 3B C3 75 ?? 8D BC 24 ?? ?? ?? ?? 2B D6 83 EF ?? 66 8B 47 ?? 83 C7 ?? 66 3B C3 
            75 ?? 8B CA 8D 84 24 ?? ?? ?? ?? C1 E9 ?? F3 A5 8B CA 83 E1 ?? F3 A4 51 50 83 EC ?? 
            8B CC 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8D 4C 24 ?? E8 ?? ?? ?? ?? 83 C4 ?? 8B F0 C6 84 
            24 ?? ?? ?? ?? ?? 83 7E ?? ?? 72 ?? 8B 36 83 EC ?? 8B CC 68 ?? ?? ?? ?? E8 ?? ?? ?? 
            ?? 8D 8C 24 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 83 78 ?? ?? 72 ?? 8B 00 8B D6 8B C8 
            E8 ?? ?? ?? ?? 59 59 53 6A ?? 8D 4C 24 ?? 8B F0 E8 ?? ?? ?? ?? 53 6A ?? 8D 4C 24 ?? 
            C6 84 24 ?? ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 F6 74 ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 8B F3 EB ?? FF 15 ?? ?? ?? ?? 8B F0 53 6A ?? 8D 4C 24 ?? E8 ?? ?? ?? ?? 
            8B C6 EB ?? 53 6A ?? 8D 4C 24 ?? E8 ?? ?? ?? ?? 33 C0 8B 8C 24 ?? ?? ?? ?? 64 89 0D 
            ?? ?? ?? ?? 59 5F 5E 5B 8B 8C 24 ?? ?? ?? ?? 33 CC E8 ?? ?? ?? ?? 8B E5 5D C3 
        }

        $reboot = {
            55 8B EC 83 EC ?? A1 ?? ?? ?? ?? 33 C5 89 45 ?? 56 8D 45 ?? 50 6A ?? FF 15 ?? ?? ?? 
            ?? 50 FF 15 ?? ?? ?? ?? 85 C0 75 ?? 33 C0 EB ?? 8D 45 ?? 33 F6 50 68 ?? ?? ?? ?? 56 
            FF 15 ?? ?? ?? ?? 56 56 56 8D 45 ?? C7 45 ?? ?? ?? ?? ?? 50 56 FF 75 ?? C7 45 ?? ?? 
            ?? ?? ?? FF 15 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 85 C0 75 ?? 68 ?? ?? ?? ?? 6A ?? FF 15 
            ?? ?? ?? ?? F7 D8 1B C0 F7 D8 8B 4D ?? 33 CD 5E E8 ?? ?? ?? ?? 8B E5 5D C3 
        }

    condition:
        uint16(0) == 0x5A4D and
        (
            ( 
                (
                    $deploy_components
                ) and
                (
                    $get_shares_info
                ) and
                (
                    $encrypt_discs
                )
            ) or
            (
                (
                    $extract_diskcryptor_from_resources
                ) and
                (
                    $create_diskcryptor_service
                ) and
                (
                    all of ($encrypt_files_using_diskcryptor_p*)
                ) and
                (
                    $reboot
                )
            )
        )
}