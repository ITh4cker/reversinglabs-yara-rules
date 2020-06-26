import "pe"

rule Win32_Ransomware_WannaCry : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"
        tc_detection_type   = "Ransomware"
        tc_detection_name   = "WannaCry"
        tc_detection_factor = 5

    strings:
        $main_1 = {
            A0 ?? ?? ?? ?? 56 57 6A ?? 88 85 ?? ?? ?? ?? 59 33 C0 8D BD ?? ?? ?? ?? F3 AB 66 AB 
            AA 8D 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 50 53 FF 15 ?? ?? ?? ?? 8B 35 ?? ?? ?? ?? 8D 85 
            ?? ?? ?? ?? 6A ?? 50 FF D6 59 85 C0 59 74 ?? 8D 85 ?? ?? ?? ?? 6A ?? 50 FF D6 59 88 
            18 59 8D 85 ?? ?? ?? ?? 50 FF 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? 59 59 
            8D 8D ?? ?? ?? ?? E8 ?? ?? ?? ?? 53 53 53 8D 8D ?? ?? ?? ?? E8 ?? ?? ?? ?? 5F 5E 85 
            C0 74 ?? 8D 45 ?? 8D 8D ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 89 5D
        }
        
        $main_2 = {
            68 ?? ?? ?? ?? 33 DB 50 53 FF 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 59 FF 15 
            ?? ?? ?? ?? 83 38 ?? 75 ?? 68 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 8B 00 FF 70 ?? E8 ?? ?? 
            ?? ?? 59 85 C0 59 75 ?? 53 E8 ?? ?? ?? ?? 85 C0 59 74 ?? BE ?? ?? ?? ?? 53 8D 85 ?? 
            ?? ?? ?? 56 50 FF 15 ?? ?? ?? ?? 56 FF 15 ?? ?? ?? ?? 83 F8 ?? 74 ?? E8 ?? ?? ?? ?? 
            85 C0 0F 85 ?? ?? ?? ?? 8B 35 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 6A ?? 50 FF D6 59 85 C0 
            59 74 ?? 8D 85 ?? ?? ?? ?? 6A ?? 50 FF D6 59 88 18 59 8D 85 ?? ?? ?? ?? 50 FF 15 ?? 
            ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? C7 04 24 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            53 53 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 53 53 68 ?? ?? ?? ?? E8
        }
        
        $main_3 = {
            83 EC ?? 56 57 B9 ?? ?? ?? ?? BE ?? ?? ?? ?? 8D 7C 24 ?? 33 C0 F3 A5 A4 89 44 24 ?? 
            89 44 24 ?? 89 44 24 ?? 89 44 24 ?? 89 44 24 ?? 66 89 44 24 ?? 50 50 50 6A ?? 50 88 
            44 24 ?? FF 15 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? 6A ?? 8D 4C 24 ?? 8B F0 6A ?? 51 56 
            FF 15 ?? ?? ?? ?? 8B F8 56 8B 35 ?? ?? ?? ?? 85 FF 75 ?? FF D6 6A ?? FF D6 E8
        }
        
        $start_service_3 = {
            83 EC ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 6A ?? FF 15 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 83 
            38 ?? 7D ?? E8 ?? ?? ?? ?? 83 C4 ?? C3 57 68 ?? ?? ?? ?? 6A ?? 6A ?? FF 15 ?? ?? ?? 
            ?? 8B F8 85 FF 74 ?? 53 56 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 57 FF 15 ?? ?? ?? ?? 8B 1D 
            ?? ?? ?? ?? 8B F0 85 F6 74 ?? 6A ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 56 FF D3 57 FF D3 5E 
            5B 8D 44 24 ?? C7 44 24 ?? ?? ?? ?? ?? 50 C7 44 24 ?? ?? ?? ?? ?? C7 44 24 ?? ?? ?? 
            ?? ?? C7 44 24 ?? ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 5F 83 C4 ?? C3 
        }
        
        $main_4 = {
            83 EC ?? 57 68 ?? ?? ?? ?? 6A ?? 6A ?? FF 15 ?? ?? ?? ?? 8B F8 85 FF 74 ?? 53 56 68 
            ?? ?? ?? ?? 68 ?? ?? ?? ?? 57 FF 15 ?? ?? ?? ?? 8B 1D ?? ?? ?? ?? 8B F0 85 F6 74 ?? 
            6A ?? 56 E8 ?? ?? ?? ?? 83 C4 ?? 56 FF D3 57 FF D3 5E 5B 8D 44 24 ?? C7 44 24 ?? ?? 
            ?? ?? ?? 50 C7 44 24 ?? ?? ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? 
            FF 15 ?? ?? ?? ?? 33 C0 5F 83 C4 ?? C2 
        }
        
        $main_5 = {
            68 ?? ?? ?? ?? 50 53 FF 15 ?? ?? ?? ?? 8B 35 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 6A ?? 50 
            FF D6 59 85 C0 59 74 ?? 8D 85 ?? ?? ?? ?? 6A ?? 50 FF D6 59 88 18 59 8D 85 ?? ?? ?? 
            ?? 50 FF 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? 59 59 8D 8D ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 53 53 53 8D 8D ?? ?? ?? ?? E8 ?? ?? ?? ?? 5F 5E 85 C0 74 ?? 8D 45 ?? 8D 
            8D ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 89 5D ?? E8 ?? ?? ?? ?? 3B C3 74 ?? FF 75 ?? 50 E8 
            ?? ?? ?? ?? 59 3B C3 59 74 ?? 68 ?? ?? ?? ?? 50 E8
        }
        
        $main_6 = {
            FF 74 24 ?? FF 74 24 ?? FF 74 24 ?? FF 74 24 ?? E8 ?? ?? ?? ?? C2
        }
        
        $set_reg_key_6 = {
            68 ?? ?? ?? ?? F3 AB 66 AB AA 8D 44 24 ?? C7 44 24 ?? ?? ?? ?? ?? 50 FF 15 ?? ?? ?? 
            ?? 8B 2D ?? ?? ?? ?? 8B 1D ?? ?? ?? ?? 83 C4 ?? 33 FF 89 7C 24 ?? 85 FF 75 ?? 8D 4C 
            24 ?? 8D 54 24 ?? 51 52 68 ?? ?? ?? ?? EB ?? 8D 44 24 ?? 8D 4C 24 ?? 50 51 68 ?? ?? 
            ?? ?? FF 15 ?? ?? ?? ?? 8B 44 24 ?? 85 C0 0F 84 ?? ?? ?? ?? 8B 8C 24 ?? ?? ?? ?? 85 
            C9 74 ?? 8D 94 24 ?? ?? ?? ?? 52 68 ?? ?? ?? ?? FF D5 8D BC 24 ?? ?? ?? ?? 83 C9 ?? 
            33 C0 F2 AE F7 D1 8D 84 24 ?? ?? ?? ?? 51 8B 4C 24 ?? 50 6A ?? 6A ?? 68 ?? ?? ?? ?? 
            51 FF D3 8B 7C 24 ?? 8B F0 F7 DE 1B F6 46 EB ?? 8D 54 24 ?? 8D 8C 24 ?? ?? ?? ?? 52 
            51 6A ?? 6A ?? 68 ?? ?? ?? ?? 50 C7 44 24 ?? ?? ?? ?? ?? FF 15 
        }
        
        $download_tor_6 = {
            81 EC ?? ?? ?? ?? 53 55 56 57 E8 ?? ?? ?? ?? 84 C0 0F 85 ?? ?? ?? ?? A0 ?? ?? ?? ?? 
            B9 ?? ?? ?? ?? 88 44 24 ?? 33 C0 8D 7C 24 ?? 8B 35 ?? ?? ?? ?? F3 AB 68 ?? ?? ?? ?? 
            68 ?? ?? ?? ?? 66 AB 68 ?? ?? ?? ?? 8D 4C 24 ?? 33 ED 68 ?? ?? ?? ?? 51 89 2D ?? ?? 
            ?? ?? 89 2D ?? ?? ?? ?? AA FF D6 8B 1D ?? ?? ?? ?? 83 C4 ?? 8D 54 24 ?? 52 FF D3 83 
            F8 ?? 0F 85 ?? ?? ?? ?? 55 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 84 
            C0 75 ?? 5F 5E 5D 5B 81 C4 ?? ?? ?? ?? C3 A0 ?? ?? ?? ?? B9 ?? ?? ?? ?? 88 84 24 ?? 
            ?? ?? ?? 33 C0 8D BC 24 ?? ?? ?? ?? 68 ?? ?? ?? ?? F3 AB 66 AB 68 ?? ?? ?? ?? 68 ?? 
            ?? ?? ?? 8D 8C 24 ?? ?? ?? ?? 68 ?? ?? ?? ?? 51 AA FF D6 83 C4 ?? 8D 94 24 ?? ?? ?? 
            ?? 52 FF D3 83 F8 ?? 75 ?? 5F 5E 5D 32 C0 5B 81 C4 ?? ?? ?? ?? C3 
        }
        
        $main_7 = {
            68 ?? ?? ?? ?? 50 53 FF 15 ?? ?? ?? ?? 8B 35 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 6A ?? 50 
            FF D6 59 85 C0 59 74 ?? 8D 85 ?? ?? ?? ?? 6A ?? 50 FF D6 59 88 18 59 8D 85 ?? ?? ?? 
            ?? 50 FF 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? 59 59 8D 8D ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 53 53 53 8D 8D ?? ?? ?? ?? E8 ?? ?? ?? ?? 5F 5E 85 C0 74 ?? 8D 45 ?? 8D 
            8D ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 53 8F 45 ?? E8 ?? ?? ?? ?? 39 44 24 ?? 74 ?? 89 44 
            24 ?? 83 EC ?? 2B C3 58 74 ?? FF 75 ?? 50 E8 ?? ?? ?? ?? 59 89 44 24 ?? 83 EC ?? 2B 
            C3 58 59 74 ?? 68 ?? ?? ?? ?? 50 E8 
        }
        
        $main_8 = {
            68 ?? ?? ?? ?? F3 AB 66 AB AA 8D 44 24 ?? 50 6A ?? FF 15 ?? ?? ?? ?? 8B 35 ?? ?? ?? 
            ?? 8D 4C 24 ?? 6A ?? 51 FF D6 83 C4 ?? 85 C0 74 ?? 8D 54 24 ?? 6A ?? 52 FF D6 83 C4 
            ?? C6 00 ?? 8D 44 24 ?? 50 FF 15 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 83 C4 ?? 8D 8C 24 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? 6A ?? 6A ?? 6A ?? 8D 8C 24 ?? ?? ?? ?? E8 ?? ?? ?? ?? 5F 
            5E 85 C0 74 ?? 8D 4C 24 ?? C7 44 24 ?? ?? ?? ?? ?? 51 68 ?? ?? ?? ?? 8D 8C 24 ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? 85 C0 74 ?? 8B 54 24 ?? 52 50 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 74 
            ?? 68 ?? ?? ?? ?? 50 E8 
        }

        $entrypoint_all = {
            55 8B EC 6A ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 64 A1 ?? ?? ?? ?? 50 64 89 25 ?? ?? ?? 
            ?? 83 EC ?? 53 56 57 89 65 ?? 33 DB 89 5D ?? 6A ?? FF 15 ?? ?? ?? ?? 59 83 0D ?? ?? 
            ?? ?? ?? 83 0D ?? ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 8B 0D ?? ?? ?? ?? 89 08 FF 15 ?? ?? 
            ?? ?? 8B 0D ?? ?? ?? ?? 89 08 A1 ?? ?? ?? ?? 8B 00 A3 ?? ?? ?? ?? E8 ?? ?? ?? ?? 39 
            1D ?? ?? ?? ?? 75 ?? 68 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 59 E8 ?? ?? ?? ?? 68 ?? ?? ?? 
            ?? 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? A1 ?? ?? ?? ?? 89 45 ?? 8D 45 ?? 50 FF 35 ?? ?? ?? 
            ?? 8D 45 ?? 50 8D 45 ?? 50 8D 45 ?? 50 FF 15 
        }

    condition:
        uint16(0) == 0x5A4D and 
        ($entrypoint_all at pe.entry_point) and 
        ($main_1 or $main_2 or ($main_3 and $start_service_3) or $main_4 or $main_5 or ($main_6 and ($set_reg_key_6 or $download_tor_6)) or $main_7 or $main_8)
}