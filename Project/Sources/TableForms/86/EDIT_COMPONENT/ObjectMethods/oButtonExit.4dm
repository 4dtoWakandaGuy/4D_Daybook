If (False:C215)
	//object Name: [COMPONENTS]EDIT_COMPONENT.oButtonExit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2011 08:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PC_abo_INCRestriction;0)
	//ARRAY LONGINT(PC_al_RestrictSection;0)
	//ARRAY LONGINT(PRD_al_RestrictSections;0)
	//ARRAY TEXT(PC_At_FilterName;0)
	//ARRAY TEXT(PC_at_RestrictionFIlter;0)
	C_BOOLEAN:C305(PC_bo_ComponentMod)
	C_LONGINT:C283($_l_event; $_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPONENTS].EDIT_COMPONENT.oButtonExit"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (PC_bo_ComponentMod)
			Gen_Confirm("Save changes to this component?"; "Yes"; "No")
			If (OK=1)
				ARRAY LONGINT:C221(PC_al_RestrictSection; 0)
				ARRAY TEXT:C222(PC_At_FilterName; 0)
				For ($_l_Index; 1; Size of array:C274(PC_abo_INCRestriction))
					If (PC_abo_INCRestriction{$_l_Index})
						APPEND TO ARRAY:C911(PC_al_RestrictSection; PRD_al_RestrictSections{$_l_Index})
						APPEND TO ARRAY:C911(PC_At_FilterName; PC_at_RestrictionFIlter{$_l_Index})
					End if 
				End for 
				If (BLOB size:C605([COMPONENTS:86]X_RestrictionPreferences:20)>0)
					SET BLOB SIZE:C606([COMPONENTS:86]X_RestrictionPreferences:20; 0)
				End if 
				VARIABLE TO BLOB:C532(PC_al_RestrictSection; [COMPONENTS:86]X_RestrictionPreferences:20; *)
				VARIABLE TO BLOB:C532(PC_At_FilterName; [COMPONENTS:86]X_RestrictionPreferences:20; *)
				ACCEPT:C269
			Else 
				CANCEL:C270
			End if 
			OK:=1
			
			
			
		Else 
			CANCEL:C270
		End if 
	Else 
		CANCEL:C270
		
End case 
ERR_MethodTrackerReturn("OBJ [COMPONENTS].EDIT_COMPONENT.oButtonExit"; $_t_oldMethodName)
