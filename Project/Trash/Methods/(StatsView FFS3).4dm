//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView FFS3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 14:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_QueryString; 0)
	ARRAY TEXT:C222($_at_UniqueCodeFinal; 0)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray)
	C_POINTER:C301($1; vFilePtr)
	C_TEXT:C284($_t_oldMethodName; $UC)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView FFS3")
//StatsView FFS3 - finds the actual records from a FurthFld_Selection
//see also FurthFld_Find2

ARRAY TEXT:C222($_at_UniqueCodeFinal; 0)
SELECTION TO ARRAY:C260([CUSTOM_FIELDS:98]Unique_Code:2; $_at_UniqueCodeFinal)
$_l_SizeofArray:=Size of array:C274($_at_UniqueCodeFinal)

Case of 
	: ($_l_SizeofArray=0)
		REDUCE SELECTION:C351(vFilePtr->; 0)
	: ($_l_SizeofArray=1)
		QUERY:C277(vFilePtr->; $1->=Substring:C12($_at_UniqueCodeFinal{1}; 4))
	Else 
		
		ARRAY TEXT:C222($_at_QueryString; 0)
		For ($_l_Index; 1; Size of array:C274($_at_UniqueCodeFinal))
			APPEND TO ARRAY:C911($_at_QueryString; Substring:C12($_at_UniqueCodeFinal{$_l_Index}; 4))
		End for 
		QUERY WITH ARRAY:C644($1->; $_at_QueryString)
		CREATE SET:C116(vFilePtr->; "FF")
		
End case 
ERR_MethodTrackerReturn("StatsView FFS3"; $_t_oldMethodName)
