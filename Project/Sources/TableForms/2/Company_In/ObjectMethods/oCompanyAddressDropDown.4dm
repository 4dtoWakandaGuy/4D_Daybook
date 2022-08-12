If (False:C215)
	//object Method Name:      CO_at_ExistingAddressTypes
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
	//ARRAY LONGINT(CO_al_ExistingAddressReference;0)
	//ARRAY LONGINT(CO_al_ExistingAddressTypes;0)
	//ARRAY TEXT(CO_at_ExistingAddressTypes;0)
	C_LONGINT:C283($_l_event; CUR_l_SelectedAddressTypeRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.Variable40"; Form event code:C388)
//Script CO_at_ExistingAddressTypes
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (CO_at_ExistingAddressTypes>0)
			If (CO_al_ExistingAddressReference{CO_at_ExistingAddressTypes}>0)  //1 or 2 or 3 or -1 or -2 or -3
				//there is an existing record of this type
				//swap what is being displayed.
				//dont change visible invisible stuff
				CUR_l_SelectedAddressTypeRow:=0
				CO_AddressManager(CO_al_ExistingAddressReference{CO_at_ExistingAddressTypes})  //1 or 2 or 3
			Else 
				If (CO_al_ExistingAddressReference{CO_at_ExistingAddressTypes}#0)
					//no existing address of this type
					CUR_l_SelectedAddressTypeRow:=CO_al_ExistingAddressReference{CO_at_ExistingAddressTypes}
					CO_AddressManager(-(CO_al_ExistingAddressTypes{CO_at_ExistingAddressTypes}))  //-289 or 288 or 290
				Else 
					//add another type of address to this company.
					//not allowing this just yet as not part of the current requirement
					CO_AddressManager(9999)
					
				End if 
				
			End if 
			
		End if 
		CO_at_ExistingAddressTypes:=0
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.Variable40"; $_t_oldMethodName)
