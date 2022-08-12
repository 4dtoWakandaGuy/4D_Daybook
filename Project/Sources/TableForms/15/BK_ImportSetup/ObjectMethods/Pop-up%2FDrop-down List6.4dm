If (False:C215)
	//object Name: [USER]BK_ImportSetup.Pop-up%2FDrop-down List6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_BKOptions;0)
	//ARRAY TEXT(DM_at_BKoptions;0)
	C_BOOLEAN:C305(DM_bo_CModified)
	C_LONGINT:C283($_l_event; $_l_Index; $_l_offset; $_l_OptionID; $_l_OptionPosition; DM_l_BKOptions; DM_l_ConnectionContext)
	C_TEXT:C284($_t_oldMethodName; $_t_OptionsName; DM_t_BKOPTIONS)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ImportSetup.Pop-up/Drop-down List6"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (DM_at_BKoptions>0)
			If (DM_l_ConnectionContext>0)
				If (DM_al_BKOptions{DM_at_BKoptions}>0)
					DM_t_BKOPTIONS:=DM_at_BKoptions{DM_at_BKoptions}
					DM_l_BKOptions:=DM_al_BKOptions{DM_at_BKoptions}
					DM_bo_CModified:=True:C214
				Else 
					//new record
					$_l_OptionID:=BK_EditDataOptions(0; DM_l_ConnectionContext)
					If ($_l_OptionID>0)
						DM_bo_CModified:=True:C214
						QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
						QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=(DM_l_ConnectionContext))
						ARRAY LONGINT:C221(DM_al_BKOptions; Records in selection:C76([PREFERENCES:116]))
						ARRAY TEXT:C222(DM_at_BKoptions; Records in selection:C76([PREFERENCES:116]))
						FIRST RECORD:C50([PREFERENCES:116])
						$_t_OptionsName:=""
						
						For ($_l_Index; 1; Records in selection:C76([PREFERENCES:116]))
							$_l_offset:=0
							DM_al_BKOptions{$_l_Index}:=[PREFERENCES:116]IDNumber:1
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_t_OptionsName; $_l_offset)
								DM_at_BKoptions{$_l_Index}:=$_t_OptionsName
								
								NEXT RECORD:C51([PREFERENCES:116])
							End if 
							
						End for 
						INSERT IN ARRAY:C227(DM_at_BKoptions; Size of array:C274(DM_at_BKoptions)+1; 2)
						INSERT IN ARRAY:C227(DM_al_BKOptions; Size of array:C274(DM_al_BKOptions)+1; 2)
						
						DM_at_BKoptions{Size of array:C274(DM_at_BKoptions)}:="New Data Options"
						DM_at_BKoptions{Size of array:C274(DM_at_BKoptions)-1}:="-"
						$_l_OptionPosition:=Find in array:C230(DM_al_BKOptions; $_l_OptionID)
						If ($_l_OptionPosition>0)  // it should be
							DM_t_BKOPTIONS:=DM_at_BKoptions{$_l_OptionPosition}
							DM_l_BKOptions:=DM_al_BKOptions{$_l_OptionPosition}
						End if 
						
					End if 
					
				End if 
				
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].BK_ImportSetup.Pop-up/Drop-down List6"; $_t_oldMethodName)
