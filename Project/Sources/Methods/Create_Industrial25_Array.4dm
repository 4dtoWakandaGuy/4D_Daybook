//%attributes = {}
If (False:C215)
	//Project Method Name:      Create_Industrial25_Array
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

$_t_oldMethodName:=ERR_MethodTracker("Create_Industrial25_Array")

// creates the need arrays for Industrial 2 of 5 (also used for Interleaved 2 of 5)

ARRAY TEXT:C222(BARC_at_Patterns; 10)
ARRAY TEXT:C222(BARC_at_Patterns2; 10)  // not needed for Code39

If (BARC_at_Patterns{0}#"101011011010")
	ARRAY LONGINT:C221(BARC_al_Checksums; 0)  // used for checksum
	
	Set_Barcode_Pattern(0; "101011011010")
	Set_Barcode_Pattern(1; "110101010110")
	Set_Barcode_Pattern(2; "101101010110")
	Set_Barcode_Pattern(3; "110110101010")
	Set_Barcode_Pattern(4; "101011010110")
	Set_Barcode_Pattern(5; "110101101010")
	Set_Barcode_Pattern(6; "101101101010")
	Set_Barcode_Pattern(7; "101010110110")
	Set_Barcode_Pattern(8; "110101011010")
	Set_Barcode_Pattern(9; "101101011010")
End if 
ERR_MethodTrackerReturn("Create_Industrial25_Array"; $_t_oldMethodName)