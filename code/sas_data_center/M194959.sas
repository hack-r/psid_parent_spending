/* PSID DATA CENTER *****************************************************
   JOBID            : 194959                            
   OUTPUT_DATA_TYPE : ASCII                             
   STATEMENTS       : SAS Statements                    
   N_OF_VARIABLES   : 14                                
   N_OF_OBSERVATIONS: 3563                              
   MAX_REC_LENGTH   : 49                                
   DATE & TIME      : August 3, 2015 @ 14:23:15
************************************************************************/

FILENAME M194959 "[path]\M194959.txt" ;

DATA M194959 ;
   ATTRIB
      ER30001  FORMAT=F4.   LABEL="CHILD: 1968 INTERVI_EW NUMBER"           
      ER30002  FORMAT=F3.   LABEL="CHILD: PERSON NUMBER 68"                 
      PCGID_97 FORMAT=F4.   LABEL="PCG 1997: 1968 INTERVIEW NUMBER"         
      PCGPN_97 FORMAT=F3.   LABEL="PCG 1997: PERSON NUMBER 68"              
      OCGID_97 FORMAT=F4.   LABEL="OCG 1997: 1968 INTERVIEW NUMBER"         
      OCGPN_97 FORMAT=F3.   LABEL="OCG 1997: PERSON NUMBER 68"              
      PCGID_02 FORMAT=F4.   LABEL="PCG 2002: 1968 INTERVIEW NUMBER"         
      PCGPN_02 FORMAT=F3.   LABEL="PCG 2002: PERSON NUMBER 68"              
      OCGID_02 FORMAT=F4.   LABEL="OCG 2002: 1968 INTERVIEW NUMBER"         
      OCGPN_02 FORMAT=F3.   LABEL="OCG 2002: PERSON NUMBER 68"              
      PCGID_07 FORMAT=F4.   LABEL="PCG 2007: 1968 INTERVIEW NUMBER"         
      PCGPN_07 FORMAT=F3.   LABEL="PCG 2007: PERSON NUMBER 68"              
      OCGID_07 FORMAT=F4.   LABEL="OCG 2007: 1968 INTERVIEW NUMBER"         
      OCGPN_07 FORMAT=F3.   LABEL="OCG 2007: PERSON NUMBER 68"              
   ;
   INFILE M194959 LRECL = 49 ; 
   INPUT 
      ER30001      1 - 4     ER30002      5 - 7     PCGID_97     8 - 11   
      PCGPN_97    12 - 14    OCGID_97    15 - 18    OCGPN_97    19 - 21   
      PCGID_02    22 - 25    PCGPN_02    26 - 28    OCGID_02    29 - 32   
      OCGPN_02    33 - 35    PCGID_07    36 - 39    PCGPN_07    40 - 42   
      OCGID_07    43 - 46    OCGPN_07    47 - 49   
   ;
run ;
