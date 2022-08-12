//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      States Down
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(ST_ai_StatusUsage;0)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	C_BOOLEAN:C305(<>StatesLoaded; DB_bo_RecordModified; Gen_bo_StateModified)
	C_LONGINT:C283($_l_StatusCodeColumn; $_l_StatusColumnIndex; $_l_TableNumber; $_l_UsageRow; $_l_UsageRow2)
	C_POINTER:C301($_Ptr_Table; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_StatesCode; $_t_StatusCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("States Down")
//States Down
$_l_TableNumber:=Table:C252($1)
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If (((<>SYS_al_RecStateRestriction{$_l_TableNumber}{vStPos}\2)%2)#1)  //If Group doesn't say RO
	
	$_Ptr_Table:=Table:C252($_l_TableNumber)
	If ((Not:C34(Locked:C147($_Ptr_Table->))) & (Not:C34(Read only state:C362($_Ptr_Table->))))
		
		If ($1->#"")
			$_t_StatusCode:=Substring:C12($1->; 4; Length:C16($1->))
			$_l_StatusCodeColumn:=Find in array:C230(<>SYS_at_RecStateCodes{$_l_TableNumber}; $_t_StatusCode)
			If ($_l_StatusCodeColumn>1)
				$_l_StatusCodeColumn:=Size of array:C274(ST_ai_StatusUsage)
				If ($_l_StatusCodeColumn#0)
					$_l_UsageRow:=Find in array:C230(ST_ai_StatusUsage; 13)
				Else 
					$_l_UsageRow:=0
				End if 
				If ($_l_UsageRow<1)
					If ($_l_StatusCodeColumn#0)
						$_l_UsageRow2:=Find in array:C230(ST_ai_StatusUsage; 12)
					Else 
						$_l_UsageRow2:=0
					End if 
					$_l_StatusColumnIndex:=$_l_StatusCodeColumn-1
					While ($_l_StatusColumnIndex>=1)
						IDLE:C311  // 7/04/03 pb
						If (<>SYS_al_RecStateRestriction{$_l_TableNumber}{$_l_StatusColumnIndex}%2=1)
							$_t_StatesCode:=("0"*(3-Length:C16(String:C10($_l_TableNumber))))+String:C10($_l_TableNumber)+<>SYS_at_RecStateCodes{$_l_TableNumber}{$_l_StatusColumnIndex}
							If (((<>SYS_al_RecStateRestriction{$_l_TableNumber}{$_l_StatusColumnIndex}\2)%2)=1)
								Gen_Confirm("Are you sure you want to Downgrade to State "+<>SYS_at_RecStateNames{$_l_TableNumber}{$_l_StatusColumnIndex}+"?  You will then only have Read Only access to the record."; "Yes"; "No")
								If (OK=1)
									$1->:=$_t_StatesCode
									DB_bo_RecordModified:=True:C214
									Gen_bo_StateModified:=True:C214
								End if 
							Else 
								If ($_l_UsageRow2>0)
									Gen_Confirm("Downgrade to State "+<>SYS_at_RecStateNames{$_l_TableNumber}{$_l_StatusColumnIndex}+"?"; "Yes"; "No")
									If (OK=1)
										$1->:=$_t_StatesCode
										DB_bo_RecordModified:=True:C214
										Gen_bo_StateModified:=True:C214
									End if 
								Else 
									$1->:=$_t_StatesCode
									DB_bo_RecordModified:=True:C214
									Gen_bo_StateModified:=True:C214
								End if 
							End if 
							$_l_StatusColumnIndex:=0
						Else 
							$_l_StatusColumnIndex:=$_l_StatusColumnIndex-1
						End if 
					End while 
					States_CUArr($1)
				Else 
					Gen_Alert("This State cannot be Downgraded"; "Cancel")
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("States Down"; $_t_oldMethodName)
