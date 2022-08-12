//%attributes = {}

If (False:C215)
	//Project Method Name:      In_ButtonCallByObject
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/05/2022
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($4)
	//C_UNKNOWN($5)
	//C_UNKNOWN($6)
	//C_UNKNOWN($8)
	//C_UNKNOWN(iOK)
	//C_UNKNOWN(Vadd)
	//C_UNKNOWN(vFromIn)
	C_BOOLEAN:C305(<>PER_bo_CurrentScriptonSave; <>SYS_bo_ScriptonSave; $_bo_NoLPA; $_bo_OptionKey; $_bo_OptionKeyDown; $_bo_RunMore; Gen_bo_StateModified; SD_bo_ResultsDialog)
	C_LONGINT:C283($_l_action; $_l_ButtonPressed; $_l_CancelPosition; $_l_PressedButton)
	C_OBJECT:C1216($_obj_ButtonCall; $1)
	C_TEXT:C284($_t_DisableButtonString; $_t_ExecuteMethodName; $_t_Parameter1)
End if 
//Code Starts Here
$_obj_ButtonCall:=$1
$_bo_OptionKeyDown:=Gen_Option
If (Not:C34($_obj_ButtonCall.disableButtons=Null:C1517))
	$_t_DisableButtonString:=$_obj_ButtonCall.disableButtons
End if 
If (Not:C34($_obj_ButtonCall.clickedFunction=Null:C1517))
	$_l_ButtonPressed:=$_obj_ButtonCall.clickedFunction
End if 
Case of 
	: ($_l_ButtonPressed=DB_GetButtonFunction("OK") | (iOK=1)
		$_l_PressedButton:=DB_GetButtonFunction("OK")
		iOK:=0
		$_bo_NoLPA:=False:C215
		QV_UpdateQualsPallette(2; $_obj_ButtonCall.currentTable; 0; 1)
		//the problem with In_ButtChkMan is that uses pointers to fields to check they are filled in
		//the second parameter is a space seperated list of mandatory fields
		//so now we dont have them if we are using a form, i cannot even say there is a entity(record) loaded). Form contains the data so we have to pass form to this button call
		//that will give us the 'filled' attributes-we are using the same attribute (field) name as the field in the table. So we CAN get the table attributes(fields) and their properties
		//and then validate the current form objects.
		If (In_ButtChkMan($_obj_ButtonCall.currentTable; $_obj_ButtonCall.IDFieldNumbers))
			OK:=1
			$_bo_RunMore:=True:C214
			If ($8="@ß")
				OK:=1
				$_bo_NoLPA:=True:C214  //the lPA is run in the @ß method
				InButt_LPß($8; "A"; $_l_PressedButton)
				If (($1="P:@") | (Substring:C12($1; 2; 1)#":"))
					If (Modified record:C314($4->))  //this is here to avoid error mess apppearing twice
						DB_SaveRecord($4)
					End if 
					If (OK=1)
						ACCEPT:C269
						//$_bo_RunMore:=False
						If (OK=1)
							If ($_bo_OptionKey)
								//close related wndows
								DB_CloseRelatedProcesses(Current process:C322; $_l_PressedButton)
							End if 
							
						End if 
					End if 
				Else 
					$_bo_RunMore:=True:C214
				End if 
			End if 
			If ($_bo_RunMore=True:C214)
				If ($1="Gen_CULPA")
					Gen_CULPA($5)
					If (Modified record:C314($4->))  //this is here to avoid error mess apppearing twice
						DB_SaveRecord($4)
						
					End if 
					If (OK=1)
						
						ACCEPT:C269
						If ($_bo_OptionKey)  //close related wndows
							DB_CloseRelatedProcesses(Current process:C322; $_l_PressedButton)
						End if 
					End if 
				Else 
					If (($1="P:@") | ($1="R:@"))
						$_t_Parameter1:=Substring:C12($1; 3)
						$_l_CancelPosition:=Position:C15(":"; $_t_Parameter1)
						If ($_l_CancelPosition>0)
							$_t_Parameter1:=Substring:C12($_t_Parameter1; 1; $_l_CancelPosition-1)
						End if 
						If ($_t_Parameter1#"")
							//$_t_OldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$_t_Parameter1)
							If (Not:C34($_bo_NoLPA))
								$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($_t_Parameter1)
								EXECUTE METHOD:C1007($_t_ExecuteMethodName)
								
							End if 
						End if 
						If ($1="P:@")
							If (Modified record:C314($4->))  //this is here to avoid error mess apppearing twice
								DB_SaveRecord($4)
							End if 
							If (OK=1)
								ACCEPT:C269
								If ($_bo_OptionKey)  //close related wndows
									DB_CloseRelatedProcesses(Current process:C322; $_l_PressedButton)
								End if 
							End if 
						End if 
					Else 
						
						//Run a LPA procedure
						If (($1#"") & ($1#"File"))
							If ($1="Diary_InLPA")
								Diary_InLPA(Old:C35([DIARY:12]Result_Code:11); SD_bo_ResultsDialog)
								If (OK=1)
									DB_SaveRecord($4)
									If (OK=1)
										ACCEPT:C269
										If ($_bo_OptionKey)  //close related wndows
											DB_CloseRelatedProcesses(Current process:C322; $_l_PressedButton)
										End if 
									End if 
								End if 
							Else 
								//$_t_OldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$1)
								If (Not:C34($_bo_NoLPA))
									$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($1)
									EXECUTE METHOD:C1007($_t_ExecuteMethodName)
									//EXECUTE FORMULA($1)
								End if 
								If (Modified record:C314($4->))  //this is here to avoid error mess apppearing twice
									DB_SaveRecord($4)
								End if 
								If (OK=1)
									ACCEPT:C269
									If ($_bo_OptionKey)  //close related wndows
										DB_CloseRelatedProcesses(Current process:C322; $_l_PressedButton)
									End if 
								End if 
							End if 
						Else 
							If (Modified record:C314($4->))  //this is here to avoid error mess apppearing twice
								DB_SaveRecord($4)
							End if 
							If (OK=1)
								ACCEPT:C269
								If ($_bo_OptionKey)  //close related wndows
									DB_CloseRelatedProcesses(Current process:C322; $_l_PressedButton)
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			If (OK=1)
				//Vadd
				
				If (Vadd=0)
					Case of 
						: (Gen_bo_StateModified)
							$_l_action:=3
						Else 
							$_l_action:=2
							
					End case 
					
				Else 
					$_l_action:=1
				End if 
				SD2_OnSaveRecord(Table:C252($4); $_l_action)
				vFromIn:=True:C214
				If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
					If (Not:C34(<>SYS_bo_ScriptonSave))
						If (DB_GetModuleSettingByNUM(Module_Macros)>1)
							<>SYS_bo_ScriptonSave:=<>PER_bo_CurrentScriptonSave
						End if 
					End if 
					
					If (<>SYS_bo_ScriptonSave)
						If ($6#"Recordings")
							//  Macro ("Accept "+String(File($4)))
							Macro_AccType("Accept "+String:C10(Table:C252($4)))
						End if 
					End if 
				End if 
			End if 
		End if 
		
		
		
		