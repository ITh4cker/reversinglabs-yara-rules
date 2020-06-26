rule Win32_Ransomware_BandarChor : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"
        tc_detection_type   = "Ransomware"
        tc_detection_name   = "BandarChor"
        tc_detection_factor = 5

    strings:
        $file_extensions_1 = { 
            55 8B EC B9 ?? ?? ?? ?? 6A ?? 6A ?? 49 75 F9 51 53 89 55 ?? 8B D8 8B 45 ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 8B 15 ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 30 64 89 20 8D 85 ?? ?? ?? ?? B9 ?? ?? ?? ?? 8B 55 ?? E8 ?? ?? ?? ?? 
            8B 85 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 4D ?? 8B 95 ?? 
            ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 83 E0 ?? 83 F8 ?? 0F 85 F9 00 00 00 8D 95 ?? ?? ?? ?? 8B 85 ?? ?? ?? 
            ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 
            E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? E8 ?? 
            ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? ?? 
            ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8B 55 ?? 8B C3 E8 4F FE FF FF E9 ?? ?? ?? ?? 8D 95
        }

        $file_extensions_2 = { 
            ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? 
            E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 
            ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? 
            ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? 
            ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? 
            ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? 
            ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? 
            ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8
        }

        $file_extensions_3 = { 
            8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? 
            ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? 
            ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 
            85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? 
            ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 
            8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? 
            ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 
            ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 
            8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 
            45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8
        }

        $file_extensions_4 = {  
            0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? 
            ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 
            95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 
            ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 
            84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? 
            ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? 
            E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84
        }

        $file_extensions_5 = {  
            ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? 
            ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 
            ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? 
            ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 
            BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? 
            ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84
            }
           
        $parse_server_commands = {
            83 F9 ?? 0F 84 E0 00 00 00 50 53 56 57 89 C3 89 D6 89 CF 31 D2 8A 06 8A 56 ?? 3C ?? 74 25 3C ?? 74 3E 3C ?? 74 51 3C ?? 
            74 5C 3C ?? 74 76 3C ?? 0F 84 84 00 00 00 3C ?? 0F 84 8B 00 00 00 E9 97 00 00 00 83 F9 ?? 89 D8 7F 0A E8 ?? ?? ?? ?? E9 
            91 00 00 00 89 CA E8 ?? ?? ?? ?? E9 85 00 00 00 83 F9 ?? 89 D8 7F 07 E8 ?? ?? ?? ?? EB 77 89 CA E8 ?? ?? ?? ?? EB 6E 89 
            D8 83 C3 ?? E8 ?? ?? ?? ?? 4F 7F F3 EB 5F 55 89 D5 8B 54 2E ?? 89 D8 03 5C 2E ?? 8B 4C 2E ?? 8B 12 E8 62 FF FF FF 4F 7F 
            E8 5D EB 41 55 89 D5 89 D8 03 5C 2E ?? 89 F2 E8 ?? ?? ?? ?? 4F 7F F0 5D EB 2B 89 D8 83 C3 ?? E8 ?? ?? ?? ?? 4F 7F F3 EB 
            1C 89 D8 89 F2 83 C3 ?? E8 ?? ?? ?? ?? 4F 7F F1 EB 0B 5F 5E 5B 58 B0 ?? E9 ?? ?? ?? ?? 5F 5E 5B 58 C3 8B C0 B9 ?? ?? ?? 
            ?? E9 0A FF FF FF C3
        } 
          
    condition:
        uint16(0) == 0x5A4D and
        (($file_extensions_1 and $file_extensions_2 and $file_extensions_3 and
        $file_extensions_4 and $file_extensions_5) and
        $parse_server_commands)
}