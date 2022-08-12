//%attributes = {}
If (False:C215)
	//Project Method Name:      MState_CalcRel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MState_CalcRel")
QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=[COMPANIES:2]Company_Code:1)
CREATE SET:C116([INVOICES:39]; "Extra")
INTERSECTION:C121("Extra"; "Master2"; "Extra")
USE SET:C118("Extra")
FIRST RECORD:C50([INVOICES:39])
RELATE ONE:C42([INVOICES:39]Contact_Code:3)
ERR_MethodTrackerReturn("MState_CalcRel"; $_t_oldMethodName)