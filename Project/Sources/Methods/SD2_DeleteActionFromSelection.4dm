//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DeleteActionFromSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   17/08/2010 15:37
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

$_t_oldMethodName:=ERR_MethodTracker("SD2_DeleteActionFromSelection")
CREATE SET:C116([ACTIONS:13]; "$temp")

USE SET:C118("ListboxSet0")
READ WRITE:C146([ACTIONS:13])
If (Records in selection:C76([ACTIONS:13])>0)
	Are_You_Sure
	If (OK=1)
		Minor_DelRecords(->[ACTIONS:13]; ->[ACTIONS:13]Action_Code:1; "Actions")
		DELETE SELECTION:C66([ACTIONS:13])
	End if 
	USE SET:C118("$Temp")
	
End if 
ERR_MethodTrackerReturn("SD2_DeleteActionFromSelection"; $_t_oldMethodName)