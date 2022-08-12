//%attributes = {}
If (False:C215)
	//Project Method Name:      Create_UPCE_Array
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/08/2009 16:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(BARC_al_Checksums;0)
	//ARRAY TEXT(BARC_at_Patterns;0)
	//ARRAY TEXT(BARC_at_Patterns2;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Create_UPCE_Array")

ARRAY TEXT:C222(BARC_at_Patterns; 40)
ARRAY TEXT:C222(BARC_at_Patterns2; 40)  // not needed for UPCE
ARRAY LONGINT:C221(BARC_al_Checksums; 0)  // not needed for UPCE

If (BARC_at_Patterns{0}#"000111")
	
	BARC_at_Patterns{0}:="000111"
	
	//  array holds 4 blocks, each 0-9 (10-19, etc)
	// a = odd/even table if 1st digit is 0  (odd = 1, even = 0)
	// b = odd/even table if 1st digit is 1
	// c = 1st digit block, odd
	// d = 1st digit block, even
	
	BARC_at_Patterns{0}:="000111"
	BARC_at_Patterns{1}:="001011"
	BARC_at_Patterns{2}:="001101"
	BARC_at_Patterns{3}:="001110"
	BARC_at_Patterns{4}:="010011"
	BARC_at_Patterns{5}:="011001"
	BARC_at_Patterns{6}:="011100"
	BARC_at_Patterns{7}:="010101"
	BARC_at_Patterns{8}:="010110"
	BARC_at_Patterns{9}:="011010"
	
	BARC_at_Patterns{10}:="111000"
	BARC_at_Patterns{11}:="110100"
	BARC_at_Patterns{12}:="110010"
	BARC_at_Patterns{13}:="110001"
	BARC_at_Patterns{14}:="101100"
	BARC_at_Patterns{15}:="100110"
	BARC_at_Patterns{16}:="100011"
	BARC_at_Patterns{17}:="101010"
	BARC_at_Patterns{18}:="101001"
	BARC_at_Patterns{19}:="100101"
	
	BARC_at_Patterns{20}:="0001101"
	BARC_at_Patterns{21}:="0011001"
	BARC_at_Patterns{22}:="0010011"
	BARC_at_Patterns{23}:="0111101"
	BARC_at_Patterns{24}:="0100011"
	BARC_at_Patterns{25}:="0110001"
	BARC_at_Patterns{26}:="0101111"
	BARC_at_Patterns{27}:="0111011"
	BARC_at_Patterns{28}:="0110111"
	BARC_at_Patterns{29}:="0001011"
	
	BARC_at_Patterns{30}:="0100111"
	BARC_at_Patterns{31}:="0110011"
	BARC_at_Patterns{32}:="0011011"
	BARC_at_Patterns{33}:="0100001"
	BARC_at_Patterns{34}:="0011101"
	BARC_at_Patterns{35}:="0111001"
	BARC_at_Patterns{36}:="0000101"
	BARC_at_Patterns{37}:="0010001"
	BARC_at_Patterns{38}:="0001001"
	BARC_at_Patterns{39}:="0010111"
End if 
ERR_MethodTrackerReturn("Create_UPCE_Array"; $_t_oldMethodName)