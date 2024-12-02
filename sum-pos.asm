include irvine32.inc
.data
    array DWORD 5, -3, 12, 0, -7, 9, 4, -1  ; Sample array
    arraySize DWORD LENGTHOF array           ; Length of the array
    sum DWORD 0                              ; To store the sum of positive numbers
    count DWORD 0                            ; To store the count of positive numbers

.code
main PROC
    ; Initialize registers
    mov ecx, arraySize      ; Set loop counter (number of elements)
    mov esi, 0              ; ESI as index (starting at 0)
    mov sum, 0              ; Clear sum
    mov count, 0            ; Clear count

start_loop:
    cmp ecx, 0              ; Check if loop should end
    jz display_results      ; If counter is 0, jump to display results

    mov eax, array[esi*4]   ; Load current array element into EAX
    cmp eax, 0              ; Compare element with 0
    jle skip                ; If less or equal to 0, skip addition

    add sum, eax            ; Add the positive number to sum
    inc count               ; Increment count of positive numbers

skip:
    inc esi                 ; Move to the next element
    dec ecx                 ; Decrease loop counter
    jmp start_loop          ; Repeat loop

display_results:
    ; Display sum of positive numbers
    mov eax, sum
    call WriteInt           ; Display the sum
    call Crlf               ; New line

    ; Display count of positive numbers
    mov eax, count
    call WriteInt           ; Display the count
    call Crlf               ; New line

    call Exit               ; Exit the program
main ENDP
END main
