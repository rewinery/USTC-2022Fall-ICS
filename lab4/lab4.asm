.ORIG	x3000
        AND R1, R1, #0
        ADD R1, R1, #15
        AND R7, R7, #0

LOOP    LD R0, DATA     ; R0 ��ָ��
        AND R2, R2, #0  ; �� R2 ��¼ÿһ��ѭ���е����ֵ
        NOT R4, R2
        ADD R4, R4, #1
        ADD R7, R7, #15 ; 
        ADD R7, R7, #1  ; R7 <- 15

SUBLOOP LDR R3, R0, #0
        ADD R5, R4, R3
        BRnz VALT       ; if(R3 <= R2)   goto 'VALT'
        ADD R2, R3, #0  ; if(R3 > R2)   R3 <- R2
        NOT R4, R2
        ADD R4, R4, #1  ; ���¶� R2 ����     
        ADD R6, R0, #0  ; R6 ��¼�µ�ǰ���ֵ�ĵ�ַ   

VALT    ADD R0, R0, #1  ; ָ������
        ADD R7, R7, #-1  ; Сѭ������һ��
        BRzp SUBLOOP     ; Сѭ��ִ�� 16 �Σ��ҳ���ǰ����һ�����֣� if(R7 >= 0) goto SUBLOOP
        
        LD R4, RESULT   ; 
        ADD R4, R4, R1
        STR R2, R4, #0  ; R4 ��ʱ���ڴ��λ��
        STR R7, R6, #0  ; ���Ѿ��ù��ĵ�ǰѭ��������ֵ���Ϊ 0

        ADD R1, R1, #-1 ; ��ѭ����������һ��
        BRzp LOOP       ; if(R1 >= 0) goto LOOP
        
        AND R0, R0, #0
        AND R1, R1, #0
        AND R2, R2, #0
        LD R3, RESULTA
        LD R4, RESULT   ; ָ��
        ADD R4, R4, #15
        ADD R1, R1, #4  ; 4 ���п����������
        LD	R7,	GETA
        NOT R7, R7
        ADD R7, R7, #1  ; ȡ -85 �Ĳ���
STATA   LDR R5, R4, #0  ; ��������������ж�ȡ
        ADD R5, R5, R7
        BRn ENDA        ; if(score < 85) goto ENDA
        ADD R2, R2, #1  ; R2++
        ADD R4, R4, #-1 ; R4--
        ADD R1, R1, #-1 ; R1--
        BRp STATA
ENDA    STR R2, R3, #0  ; �洢����
        ADD R1, R1, #4

        AND R2, R2, #0
        LD	R7,	GETB
        NOT R7, R7
        ADD R7, R7, #1  ; ȡ -75 �Ĳ���
STATB   LDR R5, R4, #0  ; ��������������ж�ȡ
        ADD R5, R5, R7
        BRn ENDB        ; if(score < 75) goto ENDB
        ADD R2, R2, #1  ; R2++
        ADD R4, R4, #-1 ; R4--
        ADD R1, R1, #-1 ; R1--
        BRp STATB
ENDB    STR R2, R3, #1  ; �洢����
        ADD R1, R1, #4
        HALT



INF     .FILL	x7FFF

GETA    .FILL	#85
GETB    .FILL	#75

DATA    .FILL	x4000 ; ����ָ��
RESULT  .FILL	x5000 ; �洢������ĳɼ�
RESULTA .FILL	x5100 ; �洢 A �� B
.END