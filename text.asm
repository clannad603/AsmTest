Title Test Project

INCLUDE Irvine32.inc

.data
COUNT =4
BlueTextOnGray =blue +(lightGray*16)
DefaultColor = lightGray+(black*16)
arrayD SDWORD 12345678h,1A4B2000h,3434h,7AB9h
prompt BYTE "ENTER a 32-BIT SIGHNED INTERGER"

.code
main PROC
    mov eax ,BlueTextOnGray
    call SetTextColor
    call Clrscr
    mov esi,OFFSET arrayD
    mov ebx,TYPE arrayD
    mov ecx,LENGTHOF arrayD
    call DumpMem
    call Crlf
    mov ecx,COUNT
  L1:mov edx,OFFSET prompt
        call WriteString
        call ReadInt
        call Crlf

        call WriteInt
        call Crlf
        call WriteHex
        call Crlf
        call WriteBin
        call Crlf
        call Crlf
        LOOP L1

        call WaitMsg
        mov eax,DefaultColor
        call SetTextColor
        call Clrscr
    exit
main ENDP
END main