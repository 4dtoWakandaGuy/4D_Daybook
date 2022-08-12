//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_fileprefs2array
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/04/2010 10:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(WS_abo_NumberHasBackslash;0)
	//ARRAY BOOLEAN(WS_abo_NumberIncludesOfficeCode;0)
	//ARRAY BOOLEAN(WS_abo_NumberUsesMultiNumber;0)
	//ARRAY INTEGER(WS_aI_NumberHasBackslash;0)
	//ARRAY INTEGER(WS_aI_NumberIncludesOfficecode;0)
	//ARRAY INTEGER(WS_aI_Numberofleadingzeros;0)
	//ARRAY INTEGER(WS_aI_NumberTableID;0)
	//ARRAY INTEGER(WS_aI_NumberUsesMultiNumber;0)
	//ARRAY LONGINT(WS_al_NumberCurrentValue;0)
	//ARRAY LONGINT(WS_al_RecordNumbers;0)
	//ARRAY TEXT(WS_at_TableName;0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("WS_fileprefs2array")
//this method loads info from the files table to a group of arrays
ARRAY INTEGER:C220(WS_aI_NumberTableID; 0)
ARRAY TEXT:C222(WS_at_TableName; 0)
ARRAY LONGINT:C221(WS_al_NumberCurrentValue; 0)
ARRAY BOOLEAN:C223(WS_abo_NumberIncludesOfficeCode; 0)
ARRAY BOOLEAN:C223(WS_abo_NumberHasBackslash; 0)
ARRAY INTEGER:C220(WS_aI_Numberofleadingzeros; 0)
ARRAY BOOLEAN:C223(WS_abo_NumberUsesMultiNumber; 0)
ARRAY INTEGER:C220(WS_aI_NumberIncludesOfficecode; 1)
ARRAY INTEGER:C220(WS_aI_NumberHasBackslash; 1)
ARRAY INTEGER:C220(WS_aI_NumberUsesMultiNumber; 1)
ARRAY LONGINT:C221(WS_al_RecordNumbers; 0)
QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1>0)

SELECTION TO ARRAY:C260([IDENTIFIERS:16]; WS_al_RecordNumbers; [IDENTIFIERS:16]Table_Number:1; WS_aI_NumberTableID; [IDENTIFIERS:16]Name:3; WS_at_TableName; [IDENTIFIERS:16]Number:2; WS_al_NumberCurrentValue; [IDENTIFIERS:16]Office_Code:4; WS_abo_NumberIncludesOfficeCode)
SELECTION TO ARRAY:C260([IDENTIFIERS:16]Backslash:5; WS_abo_NumberHasBackslash; [IDENTIFIERS:16]Leading_Zeros:6; WS_aI_Numberofleadingzeros; [IDENTIFIERS:16]Multiple_Numbers:7; WS_abo_NumberUsesMultiNumber)
ARRAY INTEGER:C220(WS_aI_NumberIncludesOfficecode; Size of array:C274(WS_abo_NumberIncludesOfficeCode))
ARRAY INTEGER:C220(WS_aI_NumberHasBackslash; Size of array:C274(WS_abo_NumberIncludesOfficeCode))
ARRAY INTEGER:C220(WS_aI_NumberUsesMultiNumber; Size of array:C274(WS_abo_NumberIncludesOfficeCode))
For ($_l_Index; 1; Size of array:C274(WS_aI_NumberUsesMultiNumber))
	WS_aI_NumberUsesMultiNumber{$_l_Index}:=Num:C11(WS_abo_NumberUsesMultiNumber{$_l_Index})
	WS_aI_NumberHasBackslash{$_l_Index}:=Num:C11(WS_abo_NumberHasBackslash{$_l_Index})
	WS_aI_NumberIncludesOfficecode{$_l_Index}:=Num:C11(WS_abo_NumberIncludesOfficeCode{$_l_Index})
End for 
OBJECT SET FORMAT:C236(WS_aI_NumberUsesMultiNumber; "Yes;;No")
OBJECT SET FORMAT:C236(WS_aI_NumberHasBackslash; "/;;")
OBJECT SET FORMAT:C236(WS_aI_NumberIncludesOfficecode; "Yes;;No")
ERR_MethodTrackerReturn("WS_fileprefs2array"; $_t_oldMethodName)
