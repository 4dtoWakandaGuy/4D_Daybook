If (False:C215)
	//object Name: [USER]User_In.Variable2
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
	//ARRAY TEXT(DB_at_FontNames;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (DB_at_FontNames>0)
			[USER:15]Printing Font:102:=DB_at_FontNames{DB_at_FontNames}
		End if 
		
	Else 
		//ALERT(String($_l_event))
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Variable2"; $_t_oldMethodName)
