If (False:C215)
	//object Name: [USER]SVS_EditProductInvolved.oSVSSeveritySelector
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 11:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SVS_al_ServiceSeverityIDs;0)
	//ARRAY TEXT(SVS_at_ServiceSeverity;0)
	C_LONGINT:C283($_l_event; SVS_l_Severity)
	C_TEXT:C284($_t_oldMethodName; SVS_t_Severity)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SVS_EditProductInvolved.oSVSSeveritySelector"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SVS_t_Severity:=SVS_at_ServiceSeverity{SVS_at_ServiceSeverity}
		SVS_l_Severity:=SVS_al_ServiceSeverityIDs{SVS_at_ServiceSeverity}  //
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SVS_EditProductInvolved.oSVSSeveritySelector"; $_t_oldMethodName)
