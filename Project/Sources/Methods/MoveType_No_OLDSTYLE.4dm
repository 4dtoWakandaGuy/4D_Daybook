//%attributes = {}
If (False:C215)
	//Project Method Name:      MoveType_No_OLDSTYLE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2009 17:20
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_inProgress)
	C_LONGINT:C283($_l_Clash; $_l_MultiTableNumber; $_l_NewNumberProcess; $_l_OK; $_l_RecordsinSelectionMN; $_l_TypeNoOK)
	C_TEXT:C284($_t_oldMethodName; $_t_TestClashingNumberSTR; $_t_TypeNumberSTR; $0; CreateSem; CREATESEM2; CREATESEM3; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MoveType_No_OLDSTYLE")

//$2-added NG-make sure we have the correct thing loaded

If (Record number:C243([MOVEMENT_TYPES:60])>0)
	//THE RECORD MUST EXIST AND BE LOADED
	Repeat 
		READ ONLY:C145([IDENTIFIERS:16])
		If ([MOVEMENT_TYPES:60]MN_Identifier_Number:24>0)
			Repeat 
				$_l_MultiTableNumber:=0
				CreateSem2:="CodeCrMTN"+String:C10([MOVEMENT_TYPES:60]MN_Identifier_Number:24)
				While (Semaphore:C143(Createsem2))
					DelayTicks(10)
					
				End while 
				QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
				$_l_RecordsinSelectionMN:=Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])
				If ($_l_RecordsinSelectionMN<20)
					CreateSem:="CodeCr"+String:C10([MOVEMENT_TYPES:60]MN_Identifier_Number:24)
					$_bo_inProgress:=Test semaphore:C652(CreateSem)
					If (Not:C34($_bo_inProgress))
						$_l_NewNumberProcess:=New process:C317("Gen_CodeCreate"; 128000; String:C10([MOVEMENT_TYPES:60]MN_Identifier_Number:24))
					Else 
						Repeat 
							DelayTicks(30)
							$_bo_inProgress:=Test semaphore:C652(CreateSem)
							QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
							If (Not:C34($_bo_inProgress)) & (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)
								$_l_NewNumberProcess:=New process:C317("Gen_CodeCreate"; 128000; String:C10([MOVEMENT_TYPES:60]MN_Identifier_Number:24))
							End if 
						Until (Not:C34($_bo_inProgress)) & (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
					End if 
				End if 
				MESSAGES OFF:C175
				ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2; >)
				MESSAGES ON:C181
				READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
				FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
				Repeat 
					If (Check_Locked(->[IDENTIFIERS_MULTI_NUMBERS:94]; 0))
						If ([IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1<9000)
							$_l_MultiTableNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
							[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1+9000
							DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
							UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
						End if 
						
					Else 
						// MESSAGE($method+" MULTI NUMBER is USED TESTING NEXT NUMBER")
						$_l_MultiTableNumber:=0
						NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
					End if 
					READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
					CLEAR SEMAPHORE:C144(CreateSem2)
				Until (End selection:C36([IDENTIFIERS_MULTI_NUMBERS:94])) | ($_l_MultiTableNumber>0)
			Until ($_l_MultiTableNumber>0)
		Else 
			CreateSem3:="CodeCrMTN"+String:C10([MOVEMENT_TYPES:60]MN_Identifier_Number:24)
			While (Semaphore:C143(CreateSem3))
				DelayTicks(1)
			End while 
			READ WRITE:C146([MOVEMENT_TYPES:60])
			LOAD RECORD:C52([MOVEMENT_TYPES:60])
			Repeat 
				If (Check_Locked(->[MOVEMENT_TYPES:60]; 1))
					[MOVEMENT_TYPES:60]Number:6:=[MOVEMENT_TYPES:60]Number:6+1
					$_l_MultiTableNumber:=[MOVEMENT_TYPES:60]Number:6
					DB_SaveRecord(->[MOVEMENT_TYPES:60])
					UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
					READ ONLY:C145([MOVEMENT_TYPES:60])
					$_l_OK:=1
				Else 
					$_l_OK:=1
					Gen_Confirm("The "+[MOVEMENT_TYPES:60]Number_Name:5+" is locked by another User or Process."+Char:C90(13)+"Continue waiting?"; "Yes"; "No")
					If (OK=10)
						$_l_MultiTableNumber:=0
						LOAD RECORD:C52([MOVEMENT_TYPES:60])
						$_l_TypeNoOK:=0
					End if 
				End if 
			Until ($_l_MultiTableNumber>0) | (OK=0)
			UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
			READ ONLY:C145([MOVEMENT_TYPES:60])
			CLEAR SEMAPHORE:C144(CreateSem3)
		End if 
		$_t_TypeNumberSTR:=("0"*(6-Length:C16(String:C10($_l_MultiTableNumber))))+String:C10($_l_MultiTableNumber)
		$_t_TestClashingNumberSTR:=$_t_TypeNumberSTR
		
		SET QUERY DESTINATION:C396(3; $_l_Clash)
		QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Type_Number:4=$_t_TestClashingNumberSTR)
		SET QUERY DESTINATION:C396(0)
		
		
	Until ($_l_Clash=0)
	$0:=$_t_TypeNumberSTR
Else 
	// ALERT("THERE IS NO MOVEMENT TYPE-SELECT ONE")
	Gen_Alert("THERE IS NO MOVEMENT TYPE-SELECT ONE")
	[STOCK_MOVEMENTS:40]Movement_Type:6:="@"
	Check_MinorNC(->[STOCK_MOVEMENTS:40]Movement_Type:6; "Type"; ->[MOVEMENT_TYPES:60]; ->[MOVEMENT_TYPES:60]Type_Code:1; ->[MOVEMENT_TYPES:60]Type_Name:2)
	Move_InType
	$0:=MoveType_No_OLDSTYLE
End if 
ERR_MethodTrackerReturn("MoveType_No_OLDSTYLE"; $_t_oldMethodName)
