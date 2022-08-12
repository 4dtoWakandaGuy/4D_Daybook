//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_SelQual
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_SelQual")
QUERY:C277([INFORMATION:55]; [INFORMATION:55]Company_Code:7=[COMPANIES:2]Company_Code:1)
CREATE SET:C116([INFORMATION:55]; "Extra")
INTERSECTION:C121("Master"; "Extra"; "Extra")
If (Records in set:C195("Extra")>0)
	$0:=True:C214
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Comp_SelQual"; $_t_oldMethodName)