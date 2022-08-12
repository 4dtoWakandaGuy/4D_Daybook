If (False:C215)
	//object Name: [COMPANIES]Company_In.Variable31
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
	//ARRAY LONGINT(WS_al_RecordStatesID;0)
	//ARRAY TEXT(WS_at_RecordStateProperties;0)
	//ARRAY TEXT(WS_at_RecordStates;0)
	C_LONGINT:C283($_l_event; $_l_ItemID; $_l_ListID; $_l_StateRow)
	C_TEXT:C284($_t_oldMethodName; WS_t_recordState)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.Variable31"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		If (WS_at_RecordStates>0)
			If (WS_al_RecordStatesID{WS_at_RecordStates}>0)
				//item selected is valid
				[COMPANIES:2]Record_State:62:=WS_al_RecordStatesID{WS_at_RecordStates}
				WS_t_recordState:=WS_at_RecordStates{WS_at_RecordStates}
			Else 
				//add item
				$_l_ItemID:=AA_ListAddItem(->[COMPANIES:2]Record_State:62)
				If ($_l_ItemID>0)  // an item was added
					//reload list
					If ((User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator")) | (Current user:C182="Administrator") | (Current user:C182="Designer"))
						$_l_ListID:=AA_LoadList(->[COMPANIES:2]Record_State:62; ->WS_at_RecordStates; ->WS_al_RecordStatesID; True:C214; ->WS_at_RecordStateProperties)
					Else 
						$_l_ListID:=AA_LoadList(->[COMPANIES:2]Record_State:62; ->WS_at_RecordStates; ->WS_al_RecordStatesID; False:C215; ->WS_at_RecordStateProperties)
					End if 
					//find the item in that list
					$_l_StateRow:=Find in array:C230(WS_al_RecordStatesID; $_l_ItemID)
					If ($_l_StateRow>0)  //it should be!
						[COMPANIES:2]Record_State:62:=WS_al_RecordStatesID{$_l_StateRow}
						WS_t_recordState:=WS_at_RecordStates{$_l_StateRow}
					End if 
					
					WS_at_RecordStates:=0
				Else 
					//dont change anything
					WS_at_RecordStates:=0
				End if 
				
				
			End if 
		End if 
End case 
WS_at_RecordStates:=0
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.Variable31"; $_t_oldMethodName)
