If (False:C215)
	//object Name: [SALES_PROJECTION]Target_EntryForm.Highlight Button1
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
	C_DATE:C307(SP_D_FromDate)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].Target_EntryForm.Highlight Button1"; Form event code:C388)
SP_D_FromDate:=[SALES_PROJECTION:113]ProjectionFromDate:22
GEN_CalInProcess(0; [SALES_PROJECTION:113]ProjectionFromDate:22; "SP_D_FromDate")
[SALES_PROJECTION:113]ProjectionFromDate:22:=SP_D_FromDate
If ([SALES_PROJECTION:113]ProjectiontoDate:23=!00-00-00!)
	[SALES_PROJECTION:113]ProjectiontoDate:23:=[SALES_PROJECTION:113]ProjectionFromDate:22
End if 
If ([SALES_PROJECTION:113]ProjectionFromDate:22>[SALES_PROJECTION:113]ProjectiontoDate:23)
	[SALES_PROJECTION:113]ProjectiontoDate:23:=[SALES_PROJECTION:113]ProjectionFromDate:22
	//  ALERT("Note: The to date has been changed")
	Gen_Alert("Note: The to date has been changed.")
End if 
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].Target_EntryForm.Highlight Button1"; $_t_oldMethodName)
