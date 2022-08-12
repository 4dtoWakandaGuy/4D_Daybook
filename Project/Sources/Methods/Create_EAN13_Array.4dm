//%attributes = {}
If (False:C215)
	//Project Method Name:      Create_EAN13_Array
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

$_t_oldMethodName:=ERR_MethodTracker("Create_EAN13_Array")

ARRAY TEXT:C222(BARC_at_Patterns; 40)
ARRAY TEXT:C222(BARC_at_Patterns2; 40)  // not needed for EAN13

If (BARC_at_Patterns{0}#"111111")
	
	BARC_at_Patterns{0}:="111111"
	ARRAY LONGINT:C221(BARC_al_Checksums; 0)  // not needed for EAN13
	
	//  array holds 4 blocks, each 0-9 (10-19, etc)
	// a = odd/even table for 1st digit to select table
	// b = 1st digit block, odd
	// c = 1st digit block, even
	// d = 2nd digit block
	
	BARC_at_Patterns{0}:="111111"
	BARC_at_Patterns{1}:="110100"
	BARC_at_Patterns{2}:="110010"
	BARC_at_Patterns{3}:="110001"
	BARC_at_Patterns{4}:="101100"
	BARC_at_Patterns{5}:="100110"
	BARC_at_Patterns{6}:="100011"
	BARC_at_Patterns{7}:="101010"
	BARC_at_Patterns{8}:="101001"
	BARC_at_Patterns{9}:="100101"
	
	BARC_at_Patterns{10}:="0001101"
	BARC_at_Patterns{11}:="0011001"
	BARC_at_Patterns{12}:="0010011"
	BARC_at_Patterns{13}:="0111101"
	BARC_at_Patterns{14}:="0100011"
	BARC_at_Patterns{15}:="0110001"
	BARC_at_Patterns{16}:="0101111"
	BARC_at_Patterns{17}:="0111011"
	BARC_at_Patterns{18}:="0110111"
	BARC_at_Patterns{19}:="0001011"
	
	BARC_at_Patterns{20}:="0100111"
	BARC_at_Patterns{21}:="0110011"
	BARC_at_Patterns{22}:="0011011"
	BARC_at_Patterns{23}:="0100001"
	BARC_at_Patterns{24}:="0011101"
	BARC_at_Patterns{25}:="0111001"
	BARC_at_Patterns{26}:="0000101"
	BARC_at_Patterns{27}:="0010001"
	BARC_at_Patterns{28}:="0001001"
	BARC_at_Patterns{29}:="0010111"
	
	BARC_at_Patterns{30}:="1110010"
	BARC_at_Patterns{31}:="1100110"
	BARC_at_Patterns{32}:="1101100"
	BARC_at_Patterns{33}:="1000010"
	BARC_at_Patterns{34}:="1011100"
	BARC_at_Patterns{35}:="1001110"
	BARC_at_Patterns{36}:="1010000"
	BARC_at_Patterns{37}:="1000100"
	BARC_at_Patterns{38}:="1001000"
	BARC_at_Patterns{39}:="1110100"
	
End if 
ERR_MethodTrackerReturn("Create_EAN13_Array"; $_t_oldMethodName)