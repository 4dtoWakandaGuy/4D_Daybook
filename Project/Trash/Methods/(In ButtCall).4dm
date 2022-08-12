//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      In ButtCall
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY LONGINT(CO_al_ViewTableToTable;0)
	//ARRAY LONGINT(CONT_al_ViewTableToTable;0)
	//ARRAY LONGINT(JOB_al_ViewTabletoTable;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY LONGINT(ORDI_al_ViewsTableToTable;0)
	//ARRAY LONGINT(ORDI_al_ViewTableToTable;0)
	//ARRAY LONGINT(PI_al_ViewTableToTable;0)
	//ARRAY LONGINT(PO_al_ViewTableToTable;0)
	//ARRAY TEXT(CO_at_ViewTabsLabels;0)
	//ARRAY TEXT(CONT_at_ViewTabsLabels;0)
	//ARRAY TEXT(JOB_S30_ViewTabsLabels;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	//ARRAY TEXT(ORDI_at_ViewTabsLabels;0)
	//ARRAY TEXT(PI_at_ViewTabsLabels;0)
	//ARRAY TEXT(PO_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(<>PER_bo_CurrentScriptonSave; <>StatsSwitch; <>SYS_bo_ScriptonSave; $_bo_NoLocked; $_bo_NoLPA; $_bo_OK; $_bo_OptionKey; $_bo_ReadOnly; $_bo_RunMore; CO_bo_FurtherFieldsLoaded; CON_bo_FurtherFieldsLoaded)
	C_BOOLEAN:C305(CONT_bo_FurtherFieldsLoaded; DB_bo_RecordModified; Gen_bo_StateModified; JOB_bo_FurtherFieldsLoaded; ORD_bo_FurtherFieldsLoaded; ORDI_bo_FurtherFieldsLoaded; PO_bo_FurtherFieldsLoaded; PUR_bo_FurtherFieldsLoaded; SD_bo_ResultsDialog; vFromIn; vMod2)
	C_LONGINT:C283(<>SCPT_l_PaletteWIndow; $_l_action; $_l_CancelPosition; $_l_Delay; $_l_FurtherFieldsExist; $_l_PressedButton; $_l_Repeats; $_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_WindowTop; $p2; CO_l_FurtherFieldsMod; CON_l_FurtherFieldsMod; CONT_l_FurtherFieldsMod; DB_l_ButtonClickedFunction; iCancel; iOK; IP_l_Message; IP_l_MessageReply; JOB_l_FurtherFieldsMod)
	C_LONGINT:C283(ORD_l_FurtherFieldsMod; ORDI_l_FurtherFieldsMod; PO_l_FurtherFieldsMod; PUR_l_FurtherFieldsMod; vAdd; vNo)
	C_POINTER:C301($_ptr_FieldPointer; $_Ptr_Variable; $12; $13; $14; $4; $5; BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_ButtonDisableString; $_t_C1; $_t_ClickedFunction; $_t_CurrentFormUsage; $_t_ExecuteMethodName; $_t_oldMethodName; $_t_Parameter1; $_t_Semaphore; $_t_TableNumberString; $1; $10)
	C_TEXT:C284($11; $2; $3; $6; $7; $8; $9; $SelPrev; CON_t_ContactCode; DB_t_ButtonClickedFunction; DB_t_CallOnCloseorSave)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vLayCode; VSELPREV)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("In ButtCall")

//1= Either DB_t_CallOnCloseorSave or the LPAfter procedure
//2=Either nothing or the LPCancel proc
//3=LPDel proc
//4= File ptr  5= Code fld ptr  6=File name as for Deletions file
//7= fld numbers of flds requiring mandatory check sep by spaces if >1
//8= Before phase procedure
//9= Master set for Find
//10= Sel proc
//11= Tel Execute Proc
//12= Included File ptr to be Sorted or Counted `or ptr to AL Area
//13= ButtDis var pointer

$_bo_OptionKey:=Gen_Option
$_t_ButtonDisableString:=""
If (Count parameters:C259>=13)
	$_t_ButtonDisableString:=$13->
Else 
	$_t_ButtonDisableString:=BUT_p_ButtonStringPointer->
End if 
If ($_t_ButtonDisableString="")
	//TRACE
End if 

If (Current process:C322=Frontmost process:C327(*))
	
	
	$_bo_ReadOnly:=Read only state:C362($4->)
	$_l_PressedButton:=DB_l_ButtonClickedFunction
	DB_l_ButtonClickedFunction:=0
	//  oCancel:=0
	If ($_l_PressedButton=DB_GetButtonFunction("Close"))
		DB_t_CallOnCloseorSave:=$1
		Close_Process
		$_l_PressedButton:=DB_l_ButtonClickedFunction
		DB_l_ButtonClickedFunction:=0
	End if 
	
	Case of 
			
		: (($_l_PressedButton=DB_GetButtonFunction("OK")) | (iOK=1))
			$_l_PressedButton:=DB_GetButtonFunction("OK")
			iOK:=0
			$_bo_NoLPA:=False:C215
			QV_UpdateQualsPallette(2; Table:C252($4); 0; 1)
			
			If (In_ButtChkMan($4; $7))
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
							$_t_Parameter1:=Substring:C12($1; 3; 32000)
							$_l_CancelPosition:=Position:C15(":"; $_t_Parameter1)
							If ($_l_CancelPosition>0)
								$_t_Parameter1:=Substring:C12($_t_Parameter1; 1; $_l_CancelPosition-1)
							End if 
							If ($_t_Parameter1#"")
								//$_t_OldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$_t_Parameter1)
								If (Not:C34($_bo_NoLPA))
									//EXECUTE FORMULA($_t_Parameter1)
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
		: (($_l_PressedButton=DB_GetButtonFunction("Cancel")) | (iCancel=1))
			$_l_PressedButton:=DB_GetButtonFunction("Cancel")
			
			QV_UpdateQualsPallette(2; Table:C252($4); 0; 2)
			iCancel:=0
			//Execute the named proc
			If ($8="@ß")
				
				OK:=0
				InButt_LPß($8; "C")
				$_l_CancelPosition:=Position:C15("C:"; $1)
				$p2:=Position:C15("D:"; $1)
				If (($_l_CancelPosition>0) | (($_l_CancelPosition=0) & ($p2=0)) | (Substring:C12($1; 2; 1)#":"))
					DB_l_ButtonClickedFunction:=0
					CANCEL:C270
					If ($_bo_OptionKey)  //close related wndows
						DB_CloseRelatedProcesses(Current process:C322; $_l_PressedButton)
					End if 
					
				End if 
				vFromIn:=True:C214
			Else 
				
				If ($2#"")
					//EXECUTE FORMULA($2)
					$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($2)
					EXECUTE METHOD:C1007($_t_ExecuteMethodName)
					DB_l_ButtonClickedFunction:=0
					CANCEL:C270
					If ($_bo_OptionKey)  //close related wndows
						DB_CloseRelatedProcesses(Current process:C322; $_l_PressedButton)
					End if 
					vFromIn:=True:C214
				Else 
					//Or from the DB_t_CallOnCloseorSave
					If ($1#"")
						$_l_CancelPosition:=Position:C15("C:"; $1)
						$p2:=Position:C15("D:"; $1)
						//C= proc that needs a Cancel
						If ($_l_CancelPosition>0)
							$_t_Parameter1:=Substring:C12($1; $_l_CancelPosition+2; 32000)
							$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($_t_Parameter1)
							EXECUTE METHOD:C1007($_t_ExecuteMethodName)
							//EXECUTE FORMULA($_t_Parameter1)
							DB_l_ButtonClickedFunction:=0
							CANCEL:C270
							vFromIn:=True:C214
						Else 
							//D= proc that doesn't
							If ($p2>0)
								$_t_Parameter1:=Substring:C12($1; $p2+2; 32000)
								$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($_t_Parameter1)
								EXECUTE METHOD:C1007($_t_ExecuteMethodName)
								//EXECUTE FORMULA($_t_Parameter1)
								vFromIn:=True:C214
							Else 
								DB_l_ButtonClickedFunction:=0
								CANCEL:C270
								If ($_bo_OptionKey)  //close related wndows
									DB_CloseRelatedProcesses(Current process:C322; $_l_PressedButton)
								End if 
								vFromIn:=True:C214
							End if 
						End if 
					Else 
						DB_l_ButtonClickedFunction:=0
						CANCEL:C270
						If ($_bo_OptionKey)  //close related wndows
							DB_CloseRelatedProcesses(Current process:C322; $_l_PressedButton)
						End if 
						vFromIn:=True:C214
					End if 
				End if 
			End if 
			DB_t_CallOnCloseorSave:="Close"
			
		: ($_l_PressedButton=DB_GetButtonFunction("Plus"))
			If ($8="@ß")
				InButt_LPß($8; "+")
			End if 
		: ($_l_PressedButton=DB_GetButtonFunction("Open"))
			If ($8="@ß")
				InButt_LPß($8; "O")
			End if 
		: ($_l_PressedButton=DB_GetButtonFunction("Minus"))
			If ($8="@ß")
				InButt_LPß($8; "-")
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Delete"))
			QV_UpdateQualsPallette(2; Table:C252($4); 0; 3)
			If (Substring:C12($_t_ButtonDisableString; 3; 1)#"D")
				If ($8="@ß")
					InButt_LPß($8; "D")
				Else 
					If ($3="Minor_DelSin")
						Minor_DelSin($4)
					Else 
						If ($3="Minor_DelSinCU")
							Minor_DelSinCU($4; $5)
						Else 
							If ($3="Minor_DelSinEx")
								Minor_DelSinEx($4; $5; $6)
							Else 
								If ($3="Minor_DelSECU")
									Minor_DelSECU($4; $5; $6)
								Else 
									If ($3="Minor_Del")
										Minor_Del($4)
									Else 
										If ($3#"")
											//EXECUTE FORMULA($3)
											$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($3)
											EXECUTE METHOD:C1007($_t_ExecuteMethodName)
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Last"))  //| (iLastRec=1))
			//  iLastRec:=0
			QV_UpdateQualsPallette(2; Table:C252($4); 0; 1)
			If (Substring:C12($_t_ButtonDisableString; 7; 1)#"N")
				If (Records in selection:C76($4->)>1)
					If (In_ButtChkMan($4; $7))
						If ($8="@ß")
							InButt_LPß($8; "F")
						Else 
							In_ButtLPA($1; $5)
						End if 
						If ($1#"Diary_InLPA")
							OK:=1
						End if 
						If (OK=1)
							If (Modified record:C314($4->))
								DB_SaveRecord($4)
								// CANCEL
							Else 
								// CANCEL
							End if 
							UNLOAD RECORD:C212($4->)
							If ($_bo_OptionKey)  //close related wndows
								DB_CloseRelatedProcesses(Current process:C322; $_l_PressedButton)
							End if 
							If (OK=1)
								LAST RECORD:C200($4->)
								$_bo_NoLocked:=Check_Locked($4; 1)
								$_bo_OK:=False:C215
								$_l_Repeats:=0
								$_l_Delay:=1
								Repeat 
									$_l_Repeats:=$_l_Repeats+1
									$_bo_OK:=Check_Locked($4; 1)
									If (Not:C34($_bo_OK))
										If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
											//only increase every 10 tries
											$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
										End if 
										DelayTicks(2*$_l_Delay)
									End if 
								Until ($_bo_OK=True:C214)
								$_bo_NoLocked:=$_bo_OK
								
								If ($8#"")
									vLayCode:=""
									If ($8="@ß")
										InButt_LPß($8; "N")
									Else 
										//EXECUTE FORMULA($8)
										$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($8)
										EXECUTE METHOD:C1007($_t_ExecuteMethodName)
									End if 
								End if 
								If (Count parameters:C259>=13)
									In_ButtNextPrev($4; $13)
									In_ButtChkDis($13)
								End if 
								
								
								If ($_bo_ReadOnly) | (Not:C34($_bo_NoLocked))  //record is in read only mode
									//DISPLAY RECORD($4->)
								Else 
									// MODIFY RECORD($4->;*)
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Next"))  // | (iNextRec=1))
			// iNextRec:=0
			//Gen_Alert ("update Qualities-Start")
			
			QV_UpdateQualsPallette(2; Table:C252($4); 0; 1)
			//Gen_Alert ("update Qualities-Done")
			
			If (Substring:C12($_t_ButtonDisableString; 7; 1)#"N")
				If (Records in selection:C76($4->)>1)
					If (In_ButtChkMan($4; $7))
						//Gen_Alert ("ButtonCheck")
						If ($8="@ß")
							InButt_LPß($8; "F")
							//Gen_Alert ("ß DOne")
						Else 
							In_ButtLPA($1; $5)
						End if 
						If ($1#"Diary_InLPA")
							OK:=1
						End if 
						If (OK=1)
							If (Modified record:C314($4->))
								DB_SaveRecord($4)
								//CANCEL
								//Gen_Alert ("Record Saved")
							Else 
								//CANCEL
							End if 
							If ($_bo_OptionKey)  //close related wndows
								DB_CloseRelatedProcesses(Current process:C322; $_l_PressedButton)
							End if 
							UNLOAD RECORD:C212($4->)
							If (OK=1)
								NEXT RECORD:C51($4->)
								If (End selection:C36($4->))
									PREVIOUS RECORD:C110($4->)
								Else 
									$_bo_NoLocked:=Check_Locked($4; 1)
									//Gen_Alert ("Check_Locked")
									If ($8#"")
										vLayCode:=""
										If ($8="@ß")
											InButt_LPß($8; "N")
											//Gen_Alert ("ß(N) Done")
										Else 
											//EXECUTE FORMULA($8)
											$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($8)
											EXECUTE METHOD:C1007($_t_ExecuteMethodName)
										End if 
									End if 
									If (Count parameters:C259=13)  //Has to be done again in case not done by the InLPB
										In_ButtNextPrev($4; $13)
										In_ButtChkDis($13)
									End if 
									//the following forces a before phase so the above is probably not needed
									
									If ($_bo_ReadOnly) | (Not:C34($_bo_NoLocked))  //record is in read only mode
										//  DISPLAY RECORD($4->)
									Else 
										//  MODIFY RECORD($4->;*)
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Previous"))  // | (iPrevRec=1))
			//  iPrevRec:=0
			QV_UpdateQualsPallette(2; Table:C252($4); 0; 1)
			If (Substring:C12($_t_ButtonDisableString; 8; 1)#"P")
				If (Records in selection:C76($4->)>1)
					If (In_ButtChkMan($4; $7))
						If ($8="@ß")
							InButt_LPß($8; "F")
						Else 
							In_ButtLPA($1; $5)
						End if 
						If ($1#"Diary_InLPA")
							OK:=1
						End if 
						If (OK=1)
							If (Modified record:C314($4->))
								DB_SaveRecord($4)
								//CANCEL
							Else 
								// CANCEL
							End if 
							If ($_bo_OptionKey)  //close related wndows
								DB_CloseRelatedProcesses(Current process:C322; $_l_PressedButton)
							End if 
							UNLOAD RECORD:C212($4->)
							If (OK=1)
								PREVIOUS RECORD:C110($4->)
								
								If (Before selection:C198($4->))
									NEXT RECORD:C51($4->)
								Else 
									$_bo_NoLocked:=Check_Locked($4; 1)
									If ($8#"")
										vLayCode:=""
										If ($8="@ß")
											InButt_LPß($8; "N")
										Else 
											//EXECUTE FORMULA($8)
											$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($8)
											EXECUTE METHOD:C1007($_t_ExecuteMethodName)
										End if 
									End if 
									If (Count parameters:C259=13)
										In_ButtNextPrev($4; $13)
										In_ButtChkDis($13)
									End if 
									//the following forces a before phase so the above may not be needed!
									
									If ($_bo_ReadOnly) | (Not:C34($_bo_NoLocked))  //record is in read only mode
										//  DISPLAY RECORD($4->)
									Else 
										// MODIFY RECORD($4->;*)
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("First"))  //| (iFirstRec=1))
			//    iFirstRec:=0
			QV_UpdateQualsPallette(2; Table:C252($4); 0; 1)
			If (Substring:C12($_t_ButtonDisableString; 8; 1)#"P")
				If (Records in selection:C76($4->)>1)
					If (In_ButtChkMan($4; $7))
						If ($8="@ß")
							InButt_LPß($8; "F")
						Else 
							In_ButtLPA($1; $5)
						End if 
						If ($1#"Diary_InLPA")
							OK:=1
						End if 
						If (OK=1)
							If ($_bo_OptionKey)  //close related wndows
								DB_CloseRelatedProcesses(Current process:C322; $_l_PressedButton)
							End if 
							
							If (Modified record:C314($4->))
								DB_SaveRecord($4)
							End if 
							If (OK=1)
								FIRST RECORD:C50($4->)
								$_bo_NoLocked:=Check_Locked($4; 1)
								If ($8#"")
									vLayCode:=""
									If ($8="@ß")
										InButt_LPß($8; "N")
									Else 
										//EXECUTE FORMULA($8)
										$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($8)
										EXECUTE METHOD:C1007($_t_ExecuteMethodName)
									End if 
								End if 
								If (Count parameters:C259=13)
									In_ButtNextPrev($4; $13)
									In_ButtChkDis($13)
								End if 
								//the following forces a before phase so the above is probably not needed
								
								If ($_bo_ReadOnly) | (Not:C34($_bo_NoLocked))  //record is in read only mode
									//  DISPLAY RECORD($4->)
								Else 
									// MODIFY RECORD($4->;*)
									
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Find"))  // | (iFind=1))
			//  iFind:=0
			If (Substring:C12($_t_ButtonDisableString; 9; 1)#"F")
				If ($10#"")
					If (vAdd=0)
						$SelPrev:=vSelPrev
						If ($_bo_OptionKey)
							vSelPrev:="•FSC"
						Else 
							vSelPrev:=""
						End if 
						If ($10="StatsView_Sel")
							StatsView_Sel
						Else 
							If (In_ButtChkMan($4; $7))
								If ($8="@ß")
									InButt_LPß($8; "F")
								Else 
									In_ButtLPA($1; $5)
								End if 
								If ($1#"Diary_InLPA")
									OK:=1
								End if 
								If (OK=1)
									If (Modified record:C314($4->))
										DB_SaveRecord($4)
									End if 
									If (OK=1)
										DB_bo_RecordModified:=False:C215
										vMod2:=False:C215
										COPY NAMED SELECTION:C331($4->; "Selection")
										//EXECUTE FORMULA($10)
										$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($10)
										EXECUTE METHOD:C1007($_t_ExecuteMethodName)
										If (Records in selection:C76($4->)>0)
											If ($8#"")
												vLayCode:=""
												If ($8="@ß")
													InButt_LPß($8; "N")
												Else 
													//EXECUTE FORMULA($8)
													$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($8)
													EXECUTE METHOD:C1007($_t_ExecuteMethodName)
												End if 
											End if 
											vNo:=Records in selection:C76($4->)
											If ($9#"")
												CREATE SET:C116($4->; $9)
											End if 
											If (Count parameters:C259=13)
												In_ButtNextPrev($4; $13)
												In_ButtChkDis($13)
											End if 
										Else 
											USE NAMED SELECTION:C332("Selection")
											Gen_Alert("No "+$6+" found - the selection is unchanged"; "OK")
										End if 
										CLEAR NAMED SELECTION:C333("Selection")
									End if 
								End if 
							End if 
						End if 
						vSelPrev:=$SelPrev
					End if 
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Tel"))
			If (Substring:C12($_t_ButtonDisableString; 17; 1)#"T")
				If (Count parameters:C259>10)
					If ($11="")
						Gen_ShowTel
					Else 
						$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($11)
						EXECUTE METHOD:C1007($_t_ExecuteMethodName)
						//EXECUTE FORMULA($11)
						
					End if 
				Else 
					Gen_ShowTel
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Sort"))
			If (Substring:C12($_t_ButtonDisableString; 12; 1)#"S")
				If (Count parameters:C259>11)
					If (Count parameters:C259>13)  //If it's an AL Area
						$_Ptr_Variable:=$14->{1}
						//$_l_CancelPosition:=AL_ShowSortEd ($_Ptr_Variable->)` NG 26/7/06 this is not need
					Else 
						If (Table:C252($12)#16)
							DB_SaveRecord($12)
							ORDER BY:C49($12->)
						End if 
					End if 
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Count"))
			If (Substring:C12($_t_ButtonDisableString; 14; 1)#"C")
				If (Count parameters:C259>11)
					If (Count parameters:C259>13)
						$_Ptr_Variable:=$14->{3}
						Gen_Alert("Number in List: "+String:C10(Size of array:C274(($_Ptr_Variable->{1})->)); "")
					Else 
						If (Table:C252($12)#16)
							Gen_Alert("Number in List: "+String:C10(Records in selection:C76($12->)); "")
						End if 
					End if 
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("Diary"))
			If (Substring:C12($_t_ButtonDisableString; 16; 1)#"D")
				//Check the mandatory field(s)
				If (In_ButtChkMan($4; $7))
					DB_SaveRecord($4)
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
					Case of 
							
						: (Table:C252($4)=Table:C252(->[CONTACTS:1]))
							If (Count parameters:C259>=15)
								//Case of
								
								
								If (CON_bo_FurtherFieldsLoaded)  // Further fields exist for the contacts table and are loaded
									If (CON_l_FurtherFieldsMod>0)
										UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
										READ WRITE:C146([CUSTOM_FIELDS:98])
										If (Records in set:C195("CON_FFSelection")>0)
											USE SET:C118("CON_FFSelection")
											DELETE SELECTION:C66([CUSTOM_FIELDS:98])
										End if 
										CLEAR SET:C117("CON_FFSelection")
										FUR_UpdateFurtherFields(->[CONTACTS:1]; ->CON_t_ContactCode)
										UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
										READ ONLY:C145([CUSTOM_FIELDS:98])
										//at least one further field has been modified
									End if 
									$_l_TableNumber:=Table:C252(->[CONTACTS:1])
									$_ptr_FieldPointer:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
									$_t_TableNumberString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
									$_t_Semaphore:="ALFF"+$_t_TableNumberString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
									CLEAR SEMAPHORE:C144($_t_Semaphore)
									CLEAR SET:C117("CON_FFSelection")
								End if 
								CON_l_FurtherFieldsMod:=0
								CON_bo_FurtherFieldsLoaded:=False:C215
								
								FurthFld_Func2($4)
								$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[CONTACTS:1])  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
								If (Records in set:C195("FUR_FFSelection")>0)
									USE SET:C118("FUR_FFSelection")
									CREATE SET:C116([CUSTOM_FIELDS:98]; "CON_FFSelection")
								Else 
									CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "CON_FFSelection")
								End if 
								CLEAR SET:C117("FUR_FFSelection")
								$_t_C1:="P"
								CON_l_FurtherFieldsMod:=0
								//FURTHER FIELDS CANNOT BE PUT ON THE MENU
								CON_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
								CON_Contexts
								
								
								
							Else 
								
								FurthFld_Func2($4)
								
							End if 
						Else 
							If (Count parameters:C259>=15)
								Case of 
									: (Table:C252($4)=Table:C252(->[COMPANIES:2]))
										If (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
											Gen_Alert("You are already viewing the further fields!")
										Else 
											If (CO_bo_FurtherFieldsLoaded)
												//`` Save any changes to further fields within the screen
												If (CO_l_FurtherFieldsMod>0)
													UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
													READ WRITE:C146([CUSTOM_FIELDS:98])
													If (Records in set:C195("COM_FFSelection")>0)
														USE SET:C118("COM_FFSelection")
														DELETE SELECTION:C66([CUSTOM_FIELDS:98])
													End if 
													CLEAR SET:C117("COM_FFSelection")
													FUR_UpdateFurtherFields(->[COMPANIES:2])
													
													
													UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
													READ ONLY:C145([CUSTOM_FIELDS:98])
													//at least one further field has been modified
													
													
												End if 
												$_l_TableNumber:=Table:C252(->[COMPANIES:2])
												$_ptr_FieldPointer:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
												$_t_TableNumberString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
												$_t_Semaphore:="ALFF"+$_t_TableNumberString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
												CLEAR SEMAPHORE:C144($_t_Semaphore)
												CLEAR SET:C117("COM_FFSelection")
												//`
											End if 
											//Now allow the edit in a seperate window
											FurthFld_Func2($4)
											//`And now reload the screen
											$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[COMPANIES:2])  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
											If (Records in set:C195("FUR_FFSelection")>0)
												USE SET:C118("FUR_FFSelection")
												CREATE SET:C116([CUSTOM_FIELDS:98]; "COM_FFSelection")
											Else 
												CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "COM_FFSelection")
											End if 
											CLEAR SET:C117("FUR_FFSelection")
											CO_l_FurtherFieldsMod:=0
											//FURTHER FIELDS CANNOT BE PUT ON THE MENU
											CO_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
										End if 
									: (Table:C252($4)=Table:C252(->[CONTRACTS:17]))
										If (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
											Gen_Alert("You are already viewing the further fields!")
										Else 
											If (CONT_bo_FurtherFieldsLoaded)  // Further fields exist for the Contract table and are loaded
												If (CONT_l_FurtherFieldsMod>0)
													UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
													READ WRITE:C146([CUSTOM_FIELDS:98])
													If (Records in set:C195("COnt_FFSelection")>0)
														USE SET:C118("CONT_FFSelection")
														DELETE SELECTION:C66([CUSTOM_FIELDS:98])
													End if 
													CLEAR SET:C117("COnt_FFSelection")
													FUR_UpdateFurtherFields(->[CONTRACTS:17])
													
													
													UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
													READ ONLY:C145([CUSTOM_FIELDS:98])
													//at least one further field has been modified
													
													
												End if 
												$_l_TableNumber:=Table:C252(->[CONTRACTS:17])
												$_ptr_FieldPointer:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
												$_t_TableNumberString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
												$_t_Semaphore:="ALFF"+$_t_TableNumberString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
												CLEAR SEMAPHORE:C144($_t_Semaphore)
												CLEAR SET:C117("COnt_FFSelection")
											End if 
											
											//```
											
											
											//``
											FurthFld_Func2($4)
											//```
											$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[CONTRACTS:17])  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
											If (Records in set:C195("FUR_FFSelection")>0)
												USE SET:C118("FUR_FFSelection")
												CREATE SET:C116([CUSTOM_FIELDS:98]; "CONT_FFSelection")
											Else 
												CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "CONT_FFSelection")
											End if 
											CLEAR SET:C117("FUR_FFSelection")
											CONT_l_FurtherFieldsMod:=0
											
											//FURTHER FIELDS CANNOT BE PUT ON THE MENU
											CONT_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
											
										End if 
									: (Table:C252($4)=Table:C252(->[ORDERS:24]))
										If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
											Gen_Alert("You are already viewing the further fields!")
										Else 
											If (ORD_bo_FurtherFieldsLoaded)  // Further fields exist for the companies table and are loaded
												If (ORD_l_FurtherFieldsMod>0)
													UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
													READ WRITE:C146([CUSTOM_FIELDS:98])
													If (Records in set:C195("ORD_FFSelection")>0)
														USE SET:C118("ORD_FFSelection")
														DELETE SELECTION:C66([CUSTOM_FIELDS:98])
													End if 
													//CLEAR SET("ORD_FFSelection")
													FUR_UpdateFurtherFields(->[ORDERS:24])
													
													
													UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
													READ ONLY:C145([CUSTOM_FIELDS:98])
													//at least one further field has been modified
													
													
												End if 
												$_l_TableNumber:=Table:C252(->[ORDERS:24])
												$_ptr_FieldPointer:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
												$_t_TableNumberString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
												$_t_Semaphore:="ALFF"+$_t_TableNumberString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
												CLEAR SEMAPHORE:C144($_t_Semaphore)
												//CLEAR SET("ORD_FFSelection")
												
											End if 
											FurthFld_Func2($4)
											
											$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[ORDERS:24])
											If (Records in set:C195("FUR_FFSelection")>0)
												USE SET:C118("FUR_FFSelection")
												CREATE SET:C116([CUSTOM_FIELDS:98]; "ORD_FFSelection")
											Else 
												CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "ORD_FFSelection")
											End if 
											CLEAR SET:C117("FUR_FFSelection")  //
											ORD_l_FurtherFieldsMod:=0
											//FURTHER FIELDS CANNOT BE PUT ON THE MENU
											ORD_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
										End if 
									: (Table:C252($4)=Table:C252(->[ORDER_ITEMS:25]))
										If (ORDI_al_ViewTableToTable{ORDI_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
											Gen_Alert("You are already viewing the further fields!")
										Else 
											If (ORDI_bo_FurtherFieldsLoaded)  // Further fields exist for the invoice table and are loaded
												If (ORDI_l_FurtherFieldsMod>0)
													UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
													READ WRITE:C146([CUSTOM_FIELDS:98])
													If (Records in set:C195("ORDI_FFSelection")>0)
														USE SET:C118("ORDI_FFSelection")
														DELETE SELECTION:C66([CUSTOM_FIELDS:98])
													End if 
													CLEAR SET:C117("ORDI_FFSelection")
													FUR_UpdateFurtherFields(->[ORDER_ITEMS:25])
													UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
													READ ONLY:C145([CUSTOM_FIELDS:98])
													//at least one further field has been modified
													
													
												End if 
												$_l_TableNumber:=Table:C252(->[ORDER_ITEMS:25])
												$_ptr_FieldPointer:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
												$_t_TableNumberString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
												$_t_Semaphore:="ALFF"+$_t_TableNumberString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
												CLEAR SEMAPHORE:C144($_t_Semaphore)
												CLEAR SET:C117("ORDI_FFSelection")
											End if 
											FurthFld_Func2($4)
											$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[ORDER_ITEMS:25])  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
											If (Records in set:C195("FUR_FFSelection")>0)
												USE SET:C118("FUR_FFSelection")
												CREATE SET:C116([CUSTOM_FIELDS:98]; "ORDI_FFSelection")
											Else 
												CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "ORDI_FFSelection")
											End if 
											CLEAR SET:C117("FUR_FFSelection")
											ORDI_l_FurtherFieldsMod:=0
											//FURTHER FIELDS CANNOT BE PUT ON THE MENU
											ORDI_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
											
										End if 
									: (Table:C252($4)=Table:C252(->[JOBS:26]))
										//If (JOB_al_ViewTabletoTable{JOB_S30_ViewTabsLabels}=Table(->[CUSTOM_FIELDS]))
										//Gen_Alert ("You are already viewing the further fields!")
										//Else
										If (JOB_bo_FurtherFieldsLoaded)  // Further fields exist for the invoice table and are loaded
											If (JOB_l_FurtherFieldsMod>0)
												UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
												READ WRITE:C146([CUSTOM_FIELDS:98])
												If (Records in set:C195("JOB_FFSelection")>0)
													USE SET:C118("JOB_FFSelection")
													DELETE SELECTION:C66([CUSTOM_FIELDS:98])
												End if 
												CLEAR SET:C117("JOB_FFSelection")
												FUR_UpdateFurtherFields(->[JOBS:26])
												UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
												READ ONLY:C145([CUSTOM_FIELDS:98])
												//at least one further field has been modified
												
												
											End if 
											$_l_TableNumber:=Table:C252(->[JOBS:26])
											$_ptr_FieldPointer:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
											$_t_TableNumberString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
											$_t_Semaphore:="ALFF"+$_t_TableNumberString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
											CLEAR SEMAPHORE:C144($_t_Semaphore)
											CLEAR SET:C117("JOB_FFSelection")
										End if 
										FurthFld_Func2($4)
										$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[JOBS:26])  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
										If (Records in set:C195("FUR_FFSelection")>0)
											USE SET:C118("FUR_FFSelection")
											CREATE SET:C116([CUSTOM_FIELDS:98]; "JOB_FFSelection")
										Else 
											CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "JOB_FFSelection")
										End if 
										CLEAR SET:C117("FUR_FFSelection")
										JOB_l_FurtherFieldsMod:=0
										//FURTHER FIELDS CANNOT BE PUT ON THE MENU
										JOB_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
										
										//End if
									: (Table:C252($4)=Table:C252(->[PURCHASE_INVOICES:37]))
										If (PI_al_ViewTableToTable{PI_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
											Gen_Alert("You are already viewing the further fields!")
										Else 
											If (PUR_bo_FurtherFieldsLoaded)  // Further fields exist for the companies table and are loaded
												If (PUR_l_FurtherFieldsMod>0)
													//at least one further field has been modified
													UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
													READ WRITE:C146([CUSTOM_FIELDS:98])
													If (Records in set:C195("PI_FFSelection")>0)
														USE SET:C118("PI_FFSelection")
														DELETE SELECTION:C66([CUSTOM_FIELDS:98])
													End if 
													CLEAR SET:C117("PI_FFSelection")
													FUR_UpdateFurtherFields(->[PURCHASE_INVOICES:37])
													UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
													READ ONLY:C145([CUSTOM_FIELDS:98])
													
													
													
												End if 
												$_l_TableNumber:=Table:C252(->[PURCHASE_INVOICES:37])
												$_ptr_FieldPointer:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
												$_t_TableNumberString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
												$_t_Semaphore:="ALFF"+$_t_TableNumberString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
												CLEAR SEMAPHORE:C144($_t_Semaphore)
												CLEAR SET:C117("PI_FFSelection")
											End if 
											FurthFld_Func2($4)
											$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[PURCHASE_INVOICES:37])  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
											If (Records in set:C195("FUR_FFSelection")>0)
												USE SET:C118("FUR_FFSelection")
												CREATE SET:C116([CUSTOM_FIELDS:98]; "PI_FFSelection")
											Else 
												CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "PI_FFSelection")
											End if 
											CLEAR SET:C117("FUR_FFSelection")
											PUR_l_FurtherFieldsMod:=0
											//FURTHER FIELDS CANNOT BE PUT ON THE MENU
											PUR_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
											
										End if 
										
									: (Table:C252($4)=Table:C252(->[PURCHASE_ORDERS:57]))
										If (PO_al_ViewTableToTable{PO_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
											Gen_Alert("You are already viewing the further fields!")
										Else 
											If (PO_bo_FurtherFieldsLoaded)  // Further fields exist for the companies table and are loaded
												If (PO_l_FurtherFieldsMod>0)
													UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
													READ WRITE:C146([CUSTOM_FIELDS:98])
													If (Records in set:C195("PO_FFSelection")>0)
														USE SET:C118("PO_FFSelection")
														DELETE SELECTION:C66([CUSTOM_FIELDS:98])
													End if 
													CLEAR SET:C117("PO_FFSelection")
													FUR_UpdateFurtherFields(->[PURCHASE_ORDERS:57])
													
													
													UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
													READ ONLY:C145([CUSTOM_FIELDS:98])
													//at least one further field has been modified
													
													
												End if 
												$_l_TableNumber:=Table:C252(->[PURCHASE_ORDERS:57])
												$_ptr_FieldPointer:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
												$_t_TableNumberString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
												$_t_Semaphore:="ALFF"+$_t_TableNumberString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
												CLEAR SEMAPHORE:C144($_t_Semaphore)
												CLEAR SET:C117("PO_FFSelection")
											End if 
											FurthFld_Func2($4)
											$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[PURCHASE_ORDERS:57])
											If (Records in set:C195("FUR_FFSelection")>0)
												USE SET:C118("FUR_FFSelection")
												CREATE SET:C116([CUSTOM_FIELDS:98]; "PO_FFSelection")
											Else 
												CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "PO_FFSelection")
											End if 
											CLEAR SET:C117("FUR_FFSelection")  //
											PO_l_FurtherFieldsMod:=0
											//FURTHER FIELDS CANNOT BE PUT ON THE MENU
											PO_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
											
										End if 
									Else 
										FurthFld_Func2($4)
								End case 
							Else 
								FurthFld_Func2($4)
							End if 
					End case 
					SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom+1)
					SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				End if 
			End if 
		: ($_l_PressedButton=DB_GetButtonFunction("QVshow"))
			Case of 
				: (Table:C252($4)=Table:C252(->[COMPANIES:2]))
					If ([COMPANIES:2]x_ID:63=0)
						[COMPANIES:2]x_ID:63:=AA_GetNextID(->[COMPANIES:2]x_ID:63)
					End if 
					QV_CallQualities(Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)
					
					
					
				: (Table:C252($4)=Table:C252(->[CONTACTS:1]))
					If ([CONTACTS:1]x_ID:33=0)
						[CONTACTS:1]x_ID:33:=AA_GetNextID(->[CONTACTS:1]x_ID:33)
						
					End if 
					
					
					QV_CallQualities(Table:C252(->[CONTACTS:1]); [CONTACTS:1]x_ID:33)
					
					
				: (Table:C252($4)=Table:C252(->[PRODUCTS:9]))
					If ([PRODUCTS:9]X_ID:43=0)
						[PRODUCTS:9]X_ID:43:=AA_GetNextID(->[PRODUCTS:9]X_ID:43)
					End if 
					QV_CallQualities(Table:C252(->[PRODUCTS:9]); [PRODUCTS:9]X_ID:43)
					
				: (Table:C252($4)=Table:C252(->[ORDERS:24]))
					If ([ORDERS:24]x_ID:58=0)
						[ORDERS:24]x_ID:58:=AA_GetNextID(->[ORDERS:24]x_ID:58)
					End if 
					QV_CallQualities(Table:C252(->[ORDERS:24]); [ORDERS:24]x_ID:58)
					
			End case 
			
			
		: ($_l_PressedButton=DB_GetButtonFunction("Plus"))
		: ($_l_PressedButton=DB_GetButtonFunction("Minus"))
		: ($_l_PressedButton=DB_GetButtonFunction("Open"))
			
		: ($_l_PressedButton=DB_GetButtonFunction("M:"))
			$_t_ClickedFunction:=DB_t_ButtonClickedFunction
			DB_t_ButtonClickedFunction:=""
			If ($_t_ClickedFunction#"")
				If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
					If ($_t_ClickedFunction="F:@")  //So F key functions dont think they are called from the palette
						Macro(Substring:C12($_t_ClickedFunction; 3; 15))
					Else 
						Macro(Substring:C12($_t_ClickedFunction; 3; 15); ""; ""; <>SCPT_l_PaletteWIndow)  //Play a Macro -
					End if 
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("-1"))
			If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
				$_t_ClickedFunction:=DB_t_ButtonClickedFunction
				DB_t_ButtonClickedFunction:=""
				
				If (Num:C11(Substring:C12($_t_ClickedFunction; 3; 2))>0)  //If its a Menu item method
					$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
					DB_t_CurrentFormUsage:="-1"+Substring:C12($_t_ClickedFunction; 3; 2)
					//EXECUTE FORMULA(Substring($_t_ClickedFunction;5;15))
					$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace(Substring:C12($_t_ClickedFunction; 5; 15))
					
					EXECUTE METHOD:C1007($_t_ExecuteMethodName)
					DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
				Else 
					EXECUTE FORMULA:C63(Substring:C12($_t_ClickedFunction; 3; 15))  //Execute a Layout menu item - called by Record_Play
					
				End if 
			End if 
		: ($_l_PressedButton=DB_GetButtonFunction("SPshow"))  //show sales pipeline
			If (Records in set:C195("Userset")=1)
				USE SET:C118("UserSet")
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("SPenter"))  //enter sales pipeline
			SP_EnterRelatedPipeline($4)
			
		: ($_l_PressedButton=DB_GetButtonFunction("Stats"))
			<>StatsSwitch:=False:C215
		: ($_l_PressedButton=DB_GetButtonFunction("Refresh"))
			
			//refresh the included area
			//EXECUTE FORMULA($8)
			$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($8)
			
			EXECUTE METHOD:C1007($_t_ExecuteMethodName)
		: ($_l_PressedButton=400)
			IP_l_MessageReply:=Table:C252($4)
		: ($_l_PressedButton=500)
			IP_l_MessageReply:=$5->
			
	End case 
	DB_l_ButtonClickedFunction:=0
End if 

In_SetManager($4)
ERR_MethodTrackerReturn("In ButtCall"; $_t_oldMethodName)
