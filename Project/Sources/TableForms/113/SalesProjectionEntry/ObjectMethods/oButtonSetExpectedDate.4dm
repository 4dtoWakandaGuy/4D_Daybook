If (False:C215)
	//object Name: [SALES_PROJECTION]SalesProjectionEntry.Highlight Button1
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].SalesProjectionEntry.Highlight Button1"; Form event code:C388)
SP_D_FromDate:=[SALES_PROJECTION:113]Expected_date:16
GEN_CalInProcess(0; [SALES_PROJECTION:113]Expected_date:16; "SP_D_FromDate")
[SALES_PROJECTION:113]Expected_date:16:=SP_D_FromDate
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].SalesProjectionEntry.Highlight Button1"; $_t_oldMethodName)