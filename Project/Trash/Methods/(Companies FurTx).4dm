//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies FurTx
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies FurTx")
$0:=""
FIRST RECORD:C50([COMPANIES_RECORD_ANALYSIS:146])
For ($_l_Index; 1; Records in selection:C76([COMPANIES_RECORD_ANALYSIS:146]))
	$0:=$0+[COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1+" "
	NEXT RECORD:C51([COMPANIES_RECORD_ANALYSIS:146])
	
End for 
If ($0#"")
	$0:=Substring:C12($0; 1; Length:C16($0)-1)
End if 
ERR_MethodTrackerReturn("Companies FurTx"; $_t_oldMethodName)