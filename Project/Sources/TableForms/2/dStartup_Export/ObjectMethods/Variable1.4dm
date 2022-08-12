If (False:C215)
	//object Name: [COMPANIES]dStartup_Export.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo1; vNo2)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStartup_Export.Variable1"; Form event code:C388)
If (vText#"")
	If ((vNo1>0) & (vNo2>0) & (vNo1<256) & (vNo2<256))
		ACCEPT:C269
	Else 
		Gen_Alert("Please specify valid Field and Record Delimiters in the range 1 to 255"; "Try again")
	End if 
Else 
	Gen_Alert("Please specify a Listing Name"; "Try again")
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStartup_Export.Variable1"; $_t_oldMethodName)
