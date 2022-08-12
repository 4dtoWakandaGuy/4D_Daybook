If (False:C215)
	//object Name: [SALES_PROJECTION]Target_EntryForm.Variable25
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(BaddMiultiple)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].Target_EntryForm.Variable25"; Form event code:C388)
If ([SALES_PROJECTION:113]PersonnelOwnerID:4>0) | ([SALES_PROJECTION:113]PersonnelGroupID:5>0) | ([SALES_PROJECTION:113]ProjectionAdHocOwner:26#"")
	OBJECT SET VISIBLE:C603(BaddMiultiple; True:C214)
Else 
	OBJECT SET VISIBLE:C603(BaddMiultiple; False:C215)
End if 
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].Target_EntryForm.Variable25"; $_t_oldMethodName)
