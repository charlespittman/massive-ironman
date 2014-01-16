SUM  EQU  0x08
     ORG  0x09
N    DB   3
NUM1 DB   7,-8,10

     ORG  0x80
     MOVE N,R1
     MOVE #NUM1,R2
     MOVE #0,R0
LOOP ADD  (R2),R0
     ADD  #1,R2
     ADD  #-1,R1
     BGTZ LOOP
     MOVE R0,SUM
STOP BRA  STOP

