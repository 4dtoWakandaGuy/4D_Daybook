//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_DisplayCalendar
	//------------------ Method Notes ------------------
	//*****************************************************************************
	// //
	// //  Cal4D_Cal_DisplayCalendar ($_ptr_Calendar;$_t_Type;$_d_Date;$_d_Date;$_ptr_Banner{;$_ptr_Titles})
	// //
	// //  Written by Charles Vass - 03/22/2009, 09:57
	// //
	// //  Purpose: To display a full or mini calendar
	// //
	// //  $1 - POINTER - Pointer to the Picture var to display the main calendar
	// //  $2 - TEXT    - Type of calendar to be displayed, "FULL" or "MINI"
	// //  $3 - DATE    - Date to be highlighted as "Today"
	// //  $4 - DATE    - Date to be highlighted as "Selected" or clicked-on
	// //  $5 - POINTER - Pointer to the Picture var to display the calendar banner
	// //  $6 - POINTER - Pointer to the Picture var to display the Mini Calendar Titles
	// //
	// //
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 17:08`Method: Cal4D_Cal_DisplayCalendar
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(Cal_lb_ListboxCalender;0)
	//ARRAY LONGINT(Cal_al_GroupID;0)
	//ARRAY LONGINT(Cal_al_RowFontColor;0)
	//ARRAY TEXT(Cal_at_Calendar;0)
	C_BOOLEAN:C305($_bo_Continue)
	C_DATE:C307($_d_Date; $_d_SelectedDate; $3; $4)
	C_LONGINT:C283($_l_Index; $_l_Params; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; $_l_RecordsInSelection)
	C_POINTER:C301(<>Cal_ptr_GroupFld_Colour; <>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupFld_Name; <>Cal_ptr_GroupotherscanviewField; <>Cal_ptr_GroupTable; <>Cal_ptr_GroupUserIDField; $_ptr_Banner; $_ptr_Calendar; $_ptr_Titles; $1; $5)
	C_POINTER:C301($6)
	C_TEXT:C284(<>Cal_t_CurrentUserName; $_t_currentProcName; $_t_ErrorHandler; $_t_MethodName; $_t_NewProcessName; $_t_oldMethodName; $_t_Type; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_DisplayCalendar")
$_l_Params:=Count parameters:C259
If (DB_Assert($_l_Params>=5; $_t_MethodName; "Parameter count is less than four"))
	$_bo_Continue:=True:C214
	$_ptr_Calendar:=$1
	If (DB_Assert(Type:C295($_ptr_Calendar->)=Is picture:K8:10; $_t_MethodName; "Parameter #1 is not a Pointer to a Picture variable"))
		$_t_Type:=$2
		If (DB_Assert(Type:C295($_t_Type)=Is text:K8:3; $_t_MethodName; "Parameter #3 is not a Text variable"))
			$_d_Date:=$3
			If (DB_Assert(Type:C295($_d_Date)=Is date:K8:7; $_t_MethodName; "Parameter #3 is not a Date variable"))
				$_d_SelectedDate:=$4
				If (DB_Assert(Type:C295($_d_SelectedDate)=Is date:K8:7; $_t_MethodName; "Parameter #4 is not a Date variable"))
					$_ptr_Banner:=$5
					If (DB_Assert(Type:C295($_ptr_Banner->)=Is picture:K8:10; $_t_MethodName; "Parameter #5 is not a Picture variable"))
						If ($_l_Params=6)
							$_ptr_Titles:=$6
							$_bo_Continue:=(Type:C295($_ptr_Titles->)=Is picture:K8:10)
						End if 
						If ($_bo_Continue)
							Cal4D_Init
							
							Cal4D_Cal_GetTimezoneProcVars
							
							$_t_ErrorHandler:=SVG_Set_error_handler("SVG_ErrorHandler")
							
							//========================    Method Actions    ==================================
							
							Case of 
								: ($_t_Type="Full")
									QUERY:C277(Cal_ptr_UserTable->; Cal_ptr_UsernameField->=<>Cal_t_CurrentUserName)
									
									QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupUserIDField->=Cal_ptr_UserIDField->; *)
									QUERY:C277(<>Cal_ptr_GroupTable->;  | ; <>Cal_ptr_GroupotherscanviewField->=True:C214)
									
									ORDER BY:C49(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_Name->)
									$_l_RecordsInSelection:=Records in selection:C76(<>Cal_ptr_GroupTable->)
									ARRAY BOOLEAN:C223(Cal_lb_ListboxCalender; $_l_RecordsInSelection)
									ARRAY TEXT:C222(Cal_at_Calendar; $_l_RecordsInSelection)
									ARRAY LONGINT:C221(Cal_al_RowFontColor; $_l_RecordsInSelection)
									ARRAY LONGINT:C221(Cal_al_GroupID; $_l_RecordsInSelection)
									
									$_l_RecordsInSelection:=Records in selection:C76(<>Cal_ptr_GroupTable->)
									For ($_l_Index; 1; $_l_RecordsInSelection)
										GOTO SELECTED RECORD:C245(<>Cal_ptr_GroupTable->; $_l_Index)
										Cal_lb_ListboxCalender{$_l_Index}:=True:C214
										Cal_at_Calendar{$_l_Index}:=<>Cal_ptr_GroupFld_Name->
										Cal_al_RowFontColor{$_l_Index}:=<>Cal_ptr_GroupFld_Colour->
										Cal_al_GroupID{$_l_Index}:=<>Cal_ptr_GroupFld_ID->
									End for 
									UNLOAD RECORD:C212(<>Cal_ptr_GroupTable->)
									
									Cal4D_Cal_GetFullCalendar($_ptr_Calendar; $_d_Date; $_d_SelectedDate; $_ptr_Banner)
									
								: ($_t_Type="Mini")
									If ($_l_Params#6)
										Gen_Alert("PARAMETER COUNT ERROR"+Char:C90(13)+"Parameter count not equal to six.")
									Else 
										Cal4D_Cal_GetMiniCalendar($_ptr_Calendar; $_d_Date; 0; $_ptr_Banner; $_ptr_Titles)
									End if 
									
								Else 
									Gen_Alert($_t_MethodName+Char:C90(13)+"Unrecognized calendar type: "+$_t_Type)
									
							End case 
							
							//========================    Clean up and Exit    =================================
							
						Else 
							Gen_Alert($_t_MethodName+Char:C90(13)+"Parameter #5 is not a Pointer to a Picture variable")
							
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_DisplayCalendar"; $_t_oldMethodName)