If (False:C215)
	//object Name: [USER]User_In.Variable69
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
	C_LONGINT:C283(ch5; ch6; ch7)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable69"; Form event code:C388)
If (ch7=1)
	[USER:15]QA Uppers:185:=4
Else 
	If (ch6=1)
		If (ch5=1)
			[USER:15]QA Uppers:185:=3
		Else 
			[USER:15]QA Uppers:185:=2
		End if 
	Else 
		If (ch5=1)
			[USER:15]QA Uppers:185:=1
		Else 
			[USER:15]QA Uppers:185:=0
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Variable69"; $_t_oldMethodName)
