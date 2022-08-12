If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oSVSResponseTimetype
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_ResponseTypes;0)
	C_LONGINT:C283($_l_event; SVS_l_MaxResponseTime)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oSVSResponseTimetype"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (SVS_at_ResponseTypes=1)
				[SERVICE_CALLS:20]Response_Time:21:=?00:00:00?+(SVS_l_MaxResponseTime*60)
			: (SVS_at_ResponseTypes=2)
				[SERVICE_CALLS:20]Response_Time:21:=?00:00:00?+(SVS_l_MaxResponseTime*60)*60
			: (SVS_at_ResponseTypes=3)
				[SERVICE_CALLS:20]Response_Time:21:=?00:00:00?+((SVS_l_MaxResponseTime*60)*60)*24
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oSVSResponseTimetype"; $_t_oldMethodName)
