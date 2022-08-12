If (False:C215)
	//object Name: [DOCUMENTS]Letters_inW.Field2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].Letters_inW.Field2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		
		If (Record number:C243([DOCUMENTS:7])=-3)
			
			If (Length:C16([DOCUMENTS:7]Document_Code:1)>8)
				[DOCUMENTS:7]Document_Code:1:=Substring:C12([DOCUMENTS:7]Document_Code:1; 1; 8)
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].Letters_inW.Field2"; $_t_oldMethodName)
