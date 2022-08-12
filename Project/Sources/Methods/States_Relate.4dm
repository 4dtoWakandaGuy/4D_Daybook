//%attributes = {}
If (False:C215)
	//Project Method Name:      States_Relate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(ST_ai_StatusUsage;0)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_BOOLEAN:C305(<>StatesLoaded; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_NumberofColumns; $_l_SizeofUsageArray; $_l_StatusCodeColumn; $_l_TableNumber; $_l_UsageRow; $_l_UsageRow2; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_FirstCharacter; $_t_oldMethodName; $_t_StateCode; $_t_StatusCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vStPrev)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("States_Relate")
$_l_TableNumber:=Table:C252($1)
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If (vStPrev#[TABLE_RECORD_STATES:90]State_Reference:4)
	If (((<>SYS_al_RecStateRestriction{$_l_TableNumber}{vStPos}\2)%2)=1)  //If Group says RO
		Gen_Alert("You have Read Only access to this State"; "Cancel")
		If (vStPrev#"")
			$1->:=vStPrev
		Else 
			States_Start($1)
		End if 
	Else 
		
		$_l_NumberofColumns:=Size of array:C274(<>SYS_at_RecStateCodes{$_l_TableNumber})
		
		If (([TABLE_RECORD_STATES:90]State_Reference:4="") | ($1->#[TABLE_RECORD_STATES:90]State_Reference:4))  //If its not already related
			
			If ($1->="")
				QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Table_number:3=$_l_TableNumber)
			Else 
				$1->:=Check_QM($1->)
				$_t_FirstCharacter:=Substring:C12($1->; Length:C16($1->); 1)
				If (Character code:C91($_t_FirstCharacter)#64)
					$_t_StateCode:=$1->+"@"
				Else 
					$_t_StateCode:=$1->
				End if 
				QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=$_t_StateCode; *)
				QUERY:C277([TABLE_RECORD_STATES:90];  & ; [TABLE_RECORD_STATES:90]Table_number:3=$_l_TableNumber)
				If (Records in selection:C76([TABLE_RECORD_STATES:90])=0)
					QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Code:1=$_t_StateCode; *)
					QUERY:C277([TABLE_RECORD_STATES:90];  & ; [TABLE_RECORD_STATES:90]Table_number:3=$_l_TableNumber)
					If (Records in selection:C76([TABLE_RECORD_STATES:90])=0)
						QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Listing_Name:2=$_t_StateCode; *)
						QUERY:C277([TABLE_RECORD_STATES:90];  & ; [TABLE_RECORD_STATES:90]Table_number:3=$_l_TableNumber)
					End if 
				End if 
			End if 
			If (Records in selection:C76([TABLE_RECORD_STATES:90])>1)
				$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
				DB_t_CurrentFormUsage:="NC"
				If (Records in selection:C76([TABLE_RECORD_STATES:90])>1)
					REDUCE SELECTION:C351([TABLE_RECORD_STATES:90]; 500)
				End if 
				Open_Rel_Window("Select a State")
				Array_LCx(Records in selection:C76([TABLE_RECORD_STATES:90]))
				SELECTION TO ARRAY:C260([TABLE_RECORD_STATES:90]State_Reference:4; GEN_at_Identity; [TABLE_RECORD_STATES:90]Listing_Name:2; GEN_at_Name)
				DIALOG:C40([COMPANIES:2]; "dRelate_List")
				CLOSE WINDOW:C154
				If (OK=1)
					QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=GEN_at_Identity{GEN_at_Identity})
				Else 
					REDUCE SELECTION:C351([TABLE_RECORD_STATES:90]; 0)
				End if 
				If (WIN_bo_TrackerInited)
					$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
					If ($_l_WindowReferenceRow>0)
						WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
					End if 
				End if 
				
				Array_LCx(0)
				DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
				If ([TABLE_RECORD_STATES:90]State_Reference:4="")
					GOTO OBJECT:C206($1->)
				End if 
			Else 
				If ([TABLE_RECORD_STATES:90]State_Reference:4="")
					Gen_Alert("That is not a valid State"; "Try again")
					GOTO OBJECT:C206($1->)
				End if 
			End if 
			$1->:=[TABLE_RECORD_STATES:90]State_Reference:4
			
		End if 
		
		If ($1->#"")
			$_t_StatusCode:=Substring:C12($1->; 4; Length:C16($1->))
			$_l_StatusCodeColumn:=Find in array:C230(<>SYS_at_RecStateCodes{$_l_TableNumber}; $_t_StatusCode)
			If ($_l_StatusCodeColumn>0)  //if it is a State in the array
				If (<>SYS_al_RecStateRestriction{$_l_TableNumber}{$_l_StatusCodeColumn}%2#1)  //if not allowed it
					Gen_Alert("You do not have access to that State"; "Try again")
					$1->:=""
				Else 
					
					//Check Code Uses
					If ($1->#"")
						$_l_SizeofUsageArray:=Size of array:C274(ST_ai_StatusUsage)
						If ($_l_SizeofUsageArray#0)
							Case of   //Check Downgrade/Upgrade warnings
								: (vStPrev>$1->)
									$_l_UsageRow:=Find in array:C230(ST_ai_StatusUsage; 13)
									If ($_l_UsageRow>0)
										Gen_Alert("This State cannot be Downgraded"; "Try again")
										$1->:=""
									Else 
										If (((<>SYS_al_RecStateRestriction{$_l_TableNumber}{$_l_StatusCodeColumn}\2)%2)=1)  //Check Read Only state
											Gen_Confirm("Are you sure you want to Downgrade to State "+<>SYS_at_RecStateNames{$_l_TableNumber}{$_l_StatusCodeColumn}+"?  You will then only have Read Only access to the record."; "Yes"; "No")
											If (OK=0)
												$1->:=""
											End if 
										Else 
											$_l_UsageRow2:=Find in array:C230(ST_ai_StatusUsage; 12)
											If ($_l_UsageRow2>0)
												Gen_Confirm("Downgrade to State "+[TABLE_RECORD_STATES:90]Listing_Name:2+"?"; "Yes"; "No")
												If (OK=0)
													$1->:=""
												End if 
											End if 
										End if 
									End if 
									
								: (vStPrev<$1->)
									$_l_UsageRow:=Find in array:C230(ST_ai_StatusUsage; 14)
									If ($_l_UsageRow>0)
										Gen_Alert("This State cannot be Upgraded"; "Try again")
										$1->:=""
									Else 
										If (((<>SYS_al_RecStateRestriction{$_l_TableNumber}{$_l_StatusCodeColumn}\2)%2)=1)  //Check Read Only state
											Gen_Confirm("Are you sure you want to Upgrade to State "+<>SYS_at_RecStateNames{$_l_TableNumber}{$_l_StatusCodeColumn}+"?  You will then only have Read Only access to the record."; "Yes"; "No")
											If (OK=0)
												$1->:=""
											End if 
										Else 
											$_l_UsageRow2:=Find in array:C230(ST_ai_StatusUsage; 11)
											If ($_l_UsageRow2>0)
												Gen_Confirm("Upgrade to State "+[TABLE_RECORD_STATES:90]Listing_Name:2+"?"; "Yes"; "No")
												If (OK=0)
													$1->:=""
												End if 
											End if 
										End if 
									End if 
									
								Else 
									$_l_UsageRow2:=0
									$_l_UsageRow:=0
							End case 
						End if 
					End if 
					
					If ($1->#"")
						//More checks ...
						
						
					End if 
					
				End if 
			Else 
				Gen_Alert("You have chosen a State that has just been defined, and cannot be checked.  "+"Please restart Daybook or choose 'Change Access' to update the States"; "")
			End if 
		End if 
		If (($1->="") | ($_l_StatusCodeColumn=0))
			If (vStPrev#"")
				$1->:=vStPrev
			Else 
				States_Start($1)
			End if 
			GOTO OBJECT:C206($1->)
		End if 
	End if 
	States_CUArr($1)
End if 
ERR_MethodTrackerReturn("States_Relate"; $_t_oldMethodName)
