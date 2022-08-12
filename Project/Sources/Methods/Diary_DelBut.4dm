//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_DelBut
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
	C_LONGINT:C283(MOD_l_CurrentModuleAccess)
	C_TEXT:C284($_t_oldMethodName; $Lay)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DelBut")
OK:=0

MESSAGES OFF:C175
If (MOD_l_CurrentModuleAccess<3)
	COPY NAMED SELECTION:C331([DIARY:12]; "$Or")
	COPY NAMED SELECTION:C331([DIARY:12]; "$Sel")
	READ WRITE:C146([DIARY:12])
	USE NAMED SELECTION:C332("$Sel")
	//see also OrderI_OutDel2
	Are_You_Sure
	If (OK=1)
		FIRST RECORD:C50([DIARY:12])
		If (Records in selection:C76([DIARY:12])>1)
			DELETE SELECTION:C66([DIARY:12])
		Else 
			
			DELETE RECORD:C58([DIARY:12])
		End if 
	End if 
	
	
End if 
UNLOAD RECORD:C212([DIARY:12])
READ ONLY:C145([DIARY:12])
CLEAR NAMED SELECTION:C333("$Sel")
USE NAMED SELECTION:C332("$Or")
MESSAGES ON:C181
ERR_MethodTrackerReturn("Diary_DelBut"; $_t_oldMethodName)