If (False:C215)
	//object Name: [USER]BK_DataModel.Variable6
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
	C_BOOLEAN:C305(DM_Bo_BKedit)
	C_LONGINT:C283($_l_event; BK_l_DataModelID; BK_l_DayBookContext; BK_l_Save)
	C_TEXT:C284($_t_oldMethodName; BK_t_BKCONTEXT; BK_t_DataModelName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_DataModel.Variable6"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		BK_l_Save:=0
		If (DM_Bo_BKedit)
			If (BK_t_DataModelName="")
				Gen_Alert("You must give this data model a name")
			Else 
				If (BK_l_DayBookContext=0)
					Gen_Alert("You must Select a Daybook Context")
					
				Else 
					If (BK_t_BKCONTEXT="")
						Gen_Alert("You must Select a business Kit Context")
					Else 
						
						If (BK_l_DataModelID>0)
							Gen_Confirm("Save Changes to data Model "+BK_t_DataModelName; "No"; "Yes")
						Else 
							Gen_Confirm("Save new data Model "+BK_t_DataModelName; "No"; "Yes")
						End if 
						If (OK=0)
							BK_l_Save:=1
							CANCEL:C270
						Else 
							BK_l_Save:=0
							CANCEL:C270
						End if 
					End if 
				End if 
			End if 
			
		Else 
			BK_l_Save:=0
			CANCEL:C270
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].BK_DataModel.Variable6"; $_t_oldMethodName)
