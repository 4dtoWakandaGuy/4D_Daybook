//%attributes = {}
If (False:C215)
	//Project Method Name:      AddFormat_DeleteFromSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2010 15:54
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

$_t_oldMethodName:=ERR_MethodTracker("AddFormat_DeleteFromSelection")
CREATE SET:C116([ADDRESS_FORMATS:74]; "$temp")

USE SET:C118("ListboxSet0")
READ WRITE:C146([ADDRESS_FORMATS:74])
If (Records in selection:C76([ADDRESS_FORMATS:74])>0)
	Are_You_Sure
	If (OK=1)
		Minor_DelRecords(->[ADDRESS_FORMATS:74]; ->[ADDRESS_FORMATS:74]Format_Code:1; "Address Formats")
		DELETE SELECTION:C66([ADDRESS_FORMATS:74])
	End if 
	USE SET:C118("$Temp")
	
End if 
ERR_MethodTrackerReturn("AddFormat_DeleteFromSelection"; $_t_oldMethodName)