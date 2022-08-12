If (False:C215)
	//object Name: [ACTIONS]Action_In.oUseDocumentForDescription
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; CB_l_WpDescription; SD2_l_WriteArea)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable24"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If ([ACTIONS:13]Document_Code:4#"")
			If (CB_l_WpDescription=1)
				//Turning on use wp
				If ([ACTIONS:13]Default_Description:6#"")
					Gen_Confirm("Insert default description into Document?"; "Yes"; "No")
					If (OK=0)
						Gen_Alert("The default desctription will not be used")
					Else 
						//Show the document area and hide the
						OBJECT SET VISIBLE:C603(SD2_l_WriteArea; True:C214)
						OBJECT SET VISIBLE:C603([ACTIONS:13]Default_Description:6; False:C215)
					End if 
					
				End if 
			Else 
				OBJECT SET VISIBLE:C603(SD2_l_WriteArea; False:C215)
				OBJECT SET VISIBLE:C603([ACTIONS:13]Default_Description:6; True:C214)
			End if 
			
			
		Else 
			If (CB_l_WpDescription=1)
				Gen_Alert("You must enter a document code first")
			Else 
				OBJECT SET VISIBLE:C603(SD2_l_WriteArea; False:C215)
				OBJECT SET VISIBLE:C603([ACTIONS:13]Default_Description:6; True:C214)
				
			End if 
			CB_l_WpDescription:=0
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable24"; $_t_oldMethodName)
