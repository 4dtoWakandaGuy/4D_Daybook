If (False:C215)
	//object Name: Object Name:      DB_OutputForm.oStatsListbox1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/05/2011 15:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	//ARRAY BOOLEAN(SV_lb_LBheaders;0)
	//ARRAY LONGINT(aSV2;0)
	//ARRAY LONGINT(SV_al_Calc3FieldPop;0)
	//ARRAY LONGINT(SV_al_Calc4FieldPop;0)
	//ARRAY LONGINT(SV_al_FieldNumPop;0)
	//ARRAY LONGINT(SV_al_TableNumber;0)
	//ARRAY REAL(aSV3;0)
	//ARRAY REAL(aSV4;0)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(aSVN1;0)
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_Calc3Pop;0)
	//ARRAY TEXT(SV_at_CalcOption3;0)
	//ARRAY TEXT(SV_at_CalcOption4;0)
	//ARRAY TEXT(SV_at_CalcOption4Pop;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	//ARRAY TEXT(SV_at_FieldName3;0)
	//ARRAY TEXT(SV_at_FieldName4;0)
	//ARRAY TEXT(SV_at_FieldsPop;0)
	//ARRAY TEXT(SV_at_Footer1;0)
	//ARRAY TEXT(SV_at_Footer2;0)
	//ARRAY TEXT(SV_at_Footer3;0)
	//ARRAY TEXT(SV_at_Footer4;0)
	//ARRAY TEXT(SV_at_Label1;0)
	//ARRAY TEXT(SV_at_Label3;0)
	//ARRAY TEXT(SV_at_Label4;0)
	//ARRAY TEXT(SV_at_TableFindCodes;0)
	C_BOOLEAN:C305(DB_bo_DisplayFilters; DB_bo_ShowArrayBased; TXT_bo_CheckBox)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldRow; $_l_Index; $_l_LabelRow; $_l_Row; $_l_Type; bd10; DB_l_CurrentDisplayedForm; DB_l_LBOutputForm; SV_l_LastCalc3)
	C_LONGINT:C283(SV_l_LastCalc4; SV_l_LASTFIELD; SV_l_LastField3; SV_l_LastField4; SV_l_LASTTABLE; vSVT1; vSVT2)
	C_REAL:C285(vSVT3; vSVT4)
	C_TEXT:C284($_t_ExecuteText; $_t_Formula; $_t_LabelValue; $_t_oldMethodName; $_t_ScriptName; DM_t_ScriptCodeRef; vSVField1Ex; vSVField3Ex; vSVField4Ex)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oStatsListbox1"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		
		LISTBOX GET CELL POSITION:C971(SV_lb_LBheaders; $_l_Column; $_l_Row)
		If (Gen_Option)
			Case of 
				: ($_l_Column=1)
					SORT ARRAY:C229(aSV1; aSVN1; aSV2; aSV3; aSV4; <)
					
				: ($_l_Column=2)
					SORT ARRAY:C229(aSV2; aSVN1; aSV1; aSV3; aSV4; <)
					
				: ($_l_Column=3)
					SORT ARRAY:C229(aSV3; aSVN1; aSV1; aSV2; aSV4; <)
				: ($_l_Column=4)
					SORT ARRAY:C229(aSV4; aSVN1; aSV3; aSV1; aSV2; <)
			End case 
		Else 
			Case of 
				: ($_l_Column=1)
					SORT ARRAY:C229(aSV1; aSVN1; aSV2; aSV3; aSV4; >)
					
				: ($_l_Column=2)
					SORT ARRAY:C229(aSV2; aSVN1; aSV1; aSV3; aSV4; >)
					
				: ($_l_Column=3)
					SORT ARRAY:C229(aSV3; aSVN1; aSV1; aSV2; aSV4; >)
				: ($_l_Column=4)
					SORT ARRAY:C229(aSV4; aSVN1; aSV3; aSV1; aSV2; >)
			End case 
		End if 
	: ($_l_event=On Data Change:K2:15)
		
		LISTBOX GET CELL POSITION:C971(SV_lb_LBheaders; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=1)
				$_t_LabelValue:=SV_at_Label1{1}
				$_l_LabelRow:=Find in array:C230(SV_at_FieldsPop; $_t_LabelValue)
				If ($_l_LabelRow>0)
					$_l_Type:=SV_al_FieldNumPop{$_l_LabelRow}
					Case of 
						: ($_l_Type=0)  //FIELD SELECTED
							
							SV_at_FieldName1:=Find in array:C230(SV_at_FieldName1; $_t_LabelValue)
							
							If (SV_at_FieldName1=0)
								If (SV_l_LASTFIELD=0)
									SV_at_FieldName1:=1
								Else 
									SV_at_FieldName1:=SV_l_LASTFIELD
								End if 
							End if 
							If (SV_at_FieldName1#SV_l_LASTFIELD)
								StatsView_Cal1
								StatsView_Learn
							End if 
							SV_l_LASTFIELD:=SV_at_FieldName1
							If (DB_bo_ShowArrayBased)
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
							Else 
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
							End if 
							SV_at_Footer1{1}:=String:C10(vSVT1)
							SV_at_Footer2{1}:=String:C10(vSVT2)
							SV_at_Footer3{1}:=String:C10(vSVT3)
							SV_at_Footer4{1}:=String:C10(vSVT4)
						: ($_l_Type=-2)  //DISPLAY ALL FIELDS
							
							bd10:=1
							StatsView_AllF1
							COPY ARRAY:C226(SV_at_FieldName1; SV_at_FieldsPop)
							ARRAY LONGINT:C221(SV_al_FieldNumPop; Size of array:C274(SV_at_FieldsPop))
							
							APPEND TO ARRAY:C911(SV_at_FieldsPop; " ")
							APPEND TO ARRAY:C911(SV_al_FieldNumPop; -1)
							APPEND TO ARRAY:C911(SV_at_FieldsPop; "indexed Fields")
							APPEND TO ARRAY:C911(SV_al_FieldNumPop; -4)
							APPEND TO ARRAY:C911(SV_at_FieldsPop; " ")
							APPEND TO ARRAY:C911(SV_al_FieldNumPop; -1)
							For ($_l_Index; 1; Size of array:C274(DB_at_TableName))
								APPEND TO ARRAY:C911(SV_at_FieldsPop; DB_at_TableName{$_l_Index})
								APPEND TO ARRAY:C911(SV_al_FieldNumPop; -3)
							End for 
							LB_SetChoiceList("SVFields"; ->SV_at_FieldsPop; ->SV_at_Label1)
							$_t_LabelValue:=SV_at_FieldName1{SV_at_FieldName1}
							SV_at_Label1{1}:=$_t_LabelValue
							$_l_LabelRow:=Find in array:C230(SV_at_FieldsPop; $_t_LabelValue)
							If (SV_at_FieldName1#SV_l_LASTFIELD)
								StatsView_Cal1
								StatsView_Learn
							End if 
							SV_l_LASTFIELD:=SV_at_FieldName1
							If (DB_bo_ShowArrayBased)
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
							Else 
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
							End if 
							
							SV_at_Footer1{1}:=String:C10(vSVT1)
							SV_at_Footer2{1}:=String:C10(vSVT2)
							SV_at_Footer3{1}:=String:C10(vSVT3)
							SV_at_Footer4{1}:=String:C10(vSVT4)
						: ($_l_Type=-3)  //TABLE SELECTED
							
							DB_at_TableName:=Find in array:C230(DB_at_TableName; $_t_LabelValue)
							If (DB_at_TableName<0)
								DB_at_TableName:=0
							End if 
							If ((DB_at_TableName=0) & (SV_l_LASTTABLE#0))
								DB_at_TableName:=SV_l_LASTTABLE
							End if 
							If (DB_at_TableName#SV_l_LASTTABLE)
								SV_al_TableNumber:=DB_at_TableName
								SV_at_TableFindCodes:=DB_at_TableName
								StatsView_Find
								StatsView_ArF3(SV_al_TableNumber{SV_al_TableNumber})
								StatsView_Cal2
							End if 
							SV_l_LASTTABLE:=DB_at_TableName
							COPY ARRAY:C226(SV_at_CalcOption3; SV_at_Calc3Pop)
							ARRAY LONGINT:C221(SV_al_Calc3FieldPop; Size of array:C274(SV_at_Calc3Pop))
							APPEND TO ARRAY:C911(SV_at_Calc3Pop; " ")
							APPEND TO ARRAY:C911(SV_al_Calc3FieldPop; -1)
							For ($_l_Index; 1; Size of array:C274(SV_at_FieldName3))
								APPEND TO ARRAY:C911(SV_at_Calc3Pop; SV_at_FieldName3{$_l_Index})
								APPEND TO ARRAY:C911(SV_al_Calc3FieldPop; -3)
							End for 
							LB_SetChoiceList("SVCalc3"; ->SV_at_Calc3Pop; ->SV_at_Label3)
							COPY ARRAY:C226(SV_at_CalcOption4; SV_at_CalcOption4Pop)
							ARRAY LONGINT:C221(SV_al_Calc4FieldPop; Size of array:C274(SV_at_CalcOption4Pop))
							APPEND TO ARRAY:C911(SV_at_CalcOption4Pop; "-")
							APPEND TO ARRAY:C911(SV_al_Calc4FieldPop; -1)
							For ($_l_Index; 1; Size of array:C274(SV_at_FieldName4))
								APPEND TO ARRAY:C911(SV_at_CalcOption4Pop; SV_at_FieldName4{$_l_Index})
								APPEND TO ARRAY:C911(SV_al_Calc4FieldPop; -3)
							End for 
							LB_SetChoiceList("SVCalc4"; ->SV_at_CalcOption4Pop; ->SV_at_Label4)
							
							
						: ($_l_Type=-4)  //HIDE ''ALL' FIELDS
							
							bd10:=0
							StatsView_AllF1
							COPY ARRAY:C226(SV_at_FieldName1; SV_at_FieldsPop)
							ARRAY LONGINT:C221(SV_al_FieldNumPop; Size of array:C274(SV_at_FieldsPop))
							
							APPEND TO ARRAY:C911(SV_at_FieldsPop; " ")
							APPEND TO ARRAY:C911(SV_al_FieldNumPop; -1)
							APPEND TO ARRAY:C911(SV_at_FieldsPop; "All Fields")
							APPEND TO ARRAY:C911(SV_al_FieldNumPop; -2)
							APPEND TO ARRAY:C911(SV_at_FieldsPop; " ")
							APPEND TO ARRAY:C911(SV_al_FieldNumPop; -1)
							For ($_l_Index; 1; Size of array:C274(DB_at_TableName))
								APPEND TO ARRAY:C911(SV_at_FieldsPop; DB_at_TableName{$_l_Index})
								APPEND TO ARRAY:C911(SV_al_FieldNumPop; -3)
							End for 
							LB_SetChoiceList("SVFields"; ->SV_at_FieldsPop; ->SV_at_Label1)
							$_t_LabelValue:=SV_at_FieldName1{SV_at_FieldName1}
							SV_at_Label1{1}:=$_t_LabelValue
							$_l_LabelRow:=Find in array:C230(SV_at_FieldsPop; $_t_LabelValue)
							If (SV_at_FieldName1#SV_l_LASTFIELD)
								StatsView_Cal1
								StatsView_Learn
							End if 
							SV_l_LASTFIELD:=SV_at_FieldName1
							If (DB_bo_ShowArrayBased)
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
							Else 
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
							End if 
							SV_at_Footer1{1}:=String:C10(vSVT1)
							SV_at_Footer2{1}:=String:C10(vSVT2)
							SV_at_Footer3{1}:=String:C10(vSVT3)
							SV_at_Footer4{1}:=String:C10(vSVT4)
						: ($_l_Type=-5)  //Formula
							$_t_ExecuteText:=Gen_RequestText("Formula:"; vSVField3Ex)
							If (OK=1)
								vSVField1Ex:=$_t_ExecuteText
								StatsView_Cal1
							Else 
								SV_at_FieldName1:=1
								StatsView_Cal1
							End if 
							SV_l_LASTFIELD:=SV_at_FieldName1
							If (DB_bo_ShowArrayBased)
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
							Else 
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
							End if 
							SV_at_Footer1{1}:=String:C10(vSVT1)
							SV_at_Footer2{1}:=String:C10(vSVT2)
							SV_at_Footer3{1}:=String:C10(vSVT3)
							SV_at_Footer4{1}:=String:C10(vSVT4)
							
							
					End case 
				End if 
			: ($_l_Column=3)
				$_t_LabelValue:=SV_at_Label3{1}
				$_l_LabelRow:=Find in array:C230(SV_at_Calc3Pop; $_t_LabelValue)
				If ($_l_LabelRow>0)
					$_l_Type:=SV_al_Calc3FieldPop{$_l_LabelRow}
					Case of 
						: ($_l_Type=0)
							$_l_LabelRow:=Find in array:C230(SV_at_CalcOption3; $_t_LabelValue)
							If ($_l_LabelRow>0)
								SV_at_CalcOption3:=$_l_LabelRow
								If (SV_at_CalcOption3=0)
									If (SV_l_LastCalc3=0)
										SV_at_CalcOption3:=1
									Else 
										SV_at_CalcOption3:=SV_l_LastCalc3
									End if 
								End if 
								If (SV_at_CalcOption3#SV_l_LastCalc3)
									StatsView_Cal3
								End if 
								SV_l_LastCalc3:=SV_at_CalcOption3
							End if 
							If (DB_bo_ShowArrayBased)
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
							Else 
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
							End if 
							SV_at_Footer1{1}:=String:C10(vSVT1)
							SV_at_Footer2{1}:=String:C10(vSVT2)
							SV_at_Footer3{1}:=String:C10(vSVT3)
							SV_at_Footer4{1}:=String:C10(vSVT4)
						: ($_l_Type=-3)
							$_l_LabelRow:=Find in array:C230(SV_at_FieldName3; $_t_LabelValue)
							If ($_l_LabelRow>0)
								SV_at_FieldName3:=$_l_LabelRow
								If (SV_at_FieldName3=0)
									If (SV_l_LastField3=0)
										SV_at_FieldName3:=1
									Else 
										SV_at_FieldName3:=SV_l_LastField3
									End if 
								End if 
								Case of 
									: (SV_at_FieldName3{SV_at_FieldName3}="Formula:@")
										$_t_ScriptName:=SV_at_FieldName3{SV_at_FieldName3}
										$_t_ScriptName:=Replace string:C233($_t_ScriptName; "Formula: "; "")
										QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=SV_al_TableNumber{SV_al_TableNumber}; *)
										QUERY:C277([SCRIPTS:80];  & [SCRIPTS:80]Script_Name:2=$_t_ScriptName)
										$_t_ExecuteText:=[SCRIPTS:80]Recording_Text:4
										vSVField3Ex:=$_t_ExecuteText
										StatsView_Cal3
									: (SV_at_FieldName3{SV_at_FieldName3}="Formula")
										$_t_ExecuteText:=Gen_RequestText("Formula:"; vSVField3Ex; "Stop"; "Run"; 32000; "Save Formula")
										//old says this and i am not sure which is correct $_t_ExecuteText:=Gen_RequestText ("Formula:";vSVField3Ex;"Run";"Stop";32000;"Save Formula")
										//test this
										
										
										If (OK=1)
											vSVField3Ex:=$_t_ExecuteText
											StatsView_Cal3
											If (TXT_bo_CheckBox)
												$_t_Formula:=Gen_Request("Please enter a name for this formula"; "")
												If ($_t_Formula#"")
													CREATE RECORD:C68([SCRIPTS:80])
													[SCRIPTS:80]AddtoStatisticsFormulas:19:=True:C214
													[SCRIPTS:80]Table_Number:8:=SV_al_TableNumber{SV_al_TableNumber}
													DM_t_ScriptCodeRef:="DM_t_ScriptCODE"
													[SCRIPTS:80]Script_Code:1:=String:C10(AA_GetNextIDinMethod(->DM_t_ScriptCodeRef))
													[SCRIPTS:80]Recording_Text:4:=$_t_ExecuteText
													[SCRIPTS:80]Same_Process:6:=True:C214
													DB_SaveRecord(->[SCRIPTS:80])
													
												End if 
											End if 
										Else 
											SV_at_FieldName3:=1
											StatsView_Cal3
										End if 
									Else 
										If (SV_at_FieldName3#SV_l_LastField3)
											StatsView_Cal3
										End if 
								End case 
								SV_l_LastField3:=SV_at_FieldName3
							End if 
							If (DB_bo_ShowArrayBased)
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
							Else 
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
							End if 
							SV_at_Footer1{1}:=String:C10(vSVT1)
							SV_at_Footer2{1}:=String:C10(vSVT2)
							SV_at_Footer3{1}:=String:C10(vSVT3)
							SV_at_Footer4{1}:=String:C10(vSVT4)
					End case 
				End if 
				SV_at_Label3{1}:=SV_at_CalcOption3{SV_at_CalcOption3}+" "+SV_at_FieldName3{SV_at_FieldName3}
			: ($_l_Column=4)
				$_t_LabelValue:=SV_at_Label4{1}
				$_l_LabelRow:=Find in array:C230(SV_at_CalcOption4Pop; $_t_LabelValue)
				If ($_l_LabelRow>0)
					$_l_Type:=SV_al_Calc4FieldPop{$_l_LabelRow}
					Case of 
						: ($_l_Type=0)
							$_l_LabelRow:=Find in array:C230(SV_at_CalcOption4; $_t_LabelValue)
							If ($_l_LabelRow>0)
								SV_at_CalcOption4:=$_l_LabelRow
								If (SV_at_CalcOption4=0)
									If (SV_l_LastCalc4=0)
										SV_at_CalcOption4:=1
									Else 
										SV_at_CalcOption4:=SV_l_LastCalc4
									End if 
								End if 
								If (SV_at_CalcOption4#SV_l_LastCalc4)
									StatsView_Cal4
								End if 
								SV_l_LastCalc4:=SV_at_CalcOption4
							End if 
							If (DB_bo_ShowArrayBased)
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
							Else 
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
							End if 
							SV_at_Footer1{1}:=String:C10(vSVT1)
							SV_at_Footer2{1}:=String:C10(vSVT2)
							SV_at_Footer3{1}:=String:C10(vSVT3)
							SV_at_Footer4{1}:=String:C10(vSVT4)
						: ($_l_Type=-3)
							$_l_FieldRow:=Find in array:C230(SV_at_FieldName4; $_t_LabelValue)
							If ($_l_FieldRow>0)
								SV_at_FieldName4:=$_l_FieldRow
								If (SV_at_FieldName4=0)
									If (SV_l_LastField4=0)
										SV_at_FieldName4:=1
									Else 
										SV_at_FieldName4:=SV_l_LastField4
									End if 
								End if 
								Case of 
									: (SV_at_FieldName4{SV_at_FieldName4}="Formula:@")
										$_t_ScriptName:=SV_at_FieldName4{SV_at_FieldName4}
										$_t_ScriptName:=Replace string:C233($_t_ScriptName; "Formula: "; "")
										QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=SV_al_TableNumber{SV_al_TableNumber}; *)
										QUERY:C277([SCRIPTS:80];  & [SCRIPTS:80]Script_Name:2=$_t_ScriptName)
										$_t_ExecuteText:=[SCRIPTS:80]Recording_Text:4
										vSVField4Ex:=$_t_ExecuteText
										StatsView_Cal4
									: (SV_at_FieldName4{SV_at_FieldName4}="Formula")
										$_t_ExecuteText:=Gen_RequestText("Formula:"; vSVField4Ex; "Stop"; "Run"; 32000; "Save Formula")
										//old says this and i am not sure which is the fixed one $_t_ExecuteText:=Gen_RequestText ("Formula:";vSVField4Ex;"Run";"Stop";32000;"Save Formula")
										//test this
										
										
										If (OK=1)
											vSVField4Ex:=$_t_ExecuteText
											StatsView_Cal4
											If (TXT_bo_CheckBox)
												$_t_Formula:=Gen_Request("Please enter a name for this formula"; "")
												If ($_t_Formula#"")
													CREATE RECORD:C68([SCRIPTS:80])
													[SCRIPTS:80]AddtoStatisticsFormulas:19:=True:C214
													[SCRIPTS:80]Table_Number:8:=SV_al_TableNumber{SV_al_TableNumber}
													DM_t_ScriptCodeRef:="DM_t_ScriptCODE"
													[SCRIPTS:80]Script_Code:1:=String:C10(AA_GetNextIDinMethod(->DM_t_ScriptCodeRef))
													[SCRIPTS:80]Recording_Text:4:=$_t_ExecuteText
													[SCRIPTS:80]Same_Process:6:=True:C214
													DB_SaveRecord(->[SCRIPTS:80])
													
												End if 
											End if 
										Else 
											SV_at_FieldName4:=1
											StatsView_Cal4
										End if 
									Else 
										If (SV_at_FieldName4#SV_l_LastField4)
											StatsView_Cal4
										End if 
								End case 
								SV_l_LastField4:=SV_at_FieldName4
							End if 
							If (DB_bo_ShowArrayBased)
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
							Else 
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
							End if 
							SV_at_Footer1{1}:=String:C10(vSVT1)
							SV_at_Footer2{1}:=String:C10(vSVT2)
							SV_at_Footer3{1}:=String:C10(vSVT3)
							SV_at_Footer4{1}:=String:C10(vSVT4)
					End case 
				End if 
				SV_at_Label4{1}:=SV_at_CalcOption4{SV_at_CalcOption4}+" "+SV_at_FieldName4{SV_at_FieldName4}
				
		End case 
	Else 
		If ($_l_event#0)
			//TRACE
		End if 
		
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ:dStatsView13,COM_lb_stats"; $_t_oldMethodName)
