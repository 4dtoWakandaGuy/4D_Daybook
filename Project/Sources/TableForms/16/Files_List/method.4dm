If (False:C215)
	//Table Form Method Name: [IDENTIFIERS]Files_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 19:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_MultiTableNumber; $_l_MultiTableNumberNEXT; $_l_NewCodeProcess; $_l_Retries; $_l_TableNumber)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_MultiNumbersSTR; $_t_oldMethodName; $_t_SemaphoreName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [IDENTIFIERS].Files_List"; Form event code:C388)
//Files_List - see also MoveTypes_InLP
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Display Detail:K2:22)
		
		Case of 
			: (Modified:C32([IDENTIFIERS:16]Multiple_Numbers:7))
				$_l_MultiTableNumber:=[IDENTIFIERS:16]Table_Number:1
				$_t_SemaphoreName:="CodeCr"+String:C10($_l_MultiTableNumber)
				If ([IDENTIFIERS:16]Multiple_Numbers:7)
					Gen_Confirm("Are you sure that you want to convert the "+[IDENTIFIERS:16]Name:3+" Unique No sequence"+" to the 'Multiple Numbers' method?  40 Numbers will be "+"created, starting from the Number specified +1."; "Yes"; "No")
					If (OK=1)
						DB_SaveRecord(->[IDENTIFIERS:16])
						UNLOAD RECORD:C212([IDENTIFIERS:16])
						$_l_NewCodeProcess:=New process:C317("Gen_CodeCreate"; 128000; String:C10($_l_MultiTableNumber))
						DelayTicks(180)
						$_l_Retries:=0
						While (Semaphore:C143($_t_SemaphoreName))
							$_l_Retries:=$_l_Retries+1
							DelayTicks($_l_Retries*2)
						End while 
						CLEAR SEMAPHORE:C144($_t_SemaphoreName)
						vTot:=1
					Else 
						[IDENTIFIERS:16]Multiple_Numbers:7:=False:C215
					End if 
				Else 
					If (Not:C34(Semaphore:C143($_t_SemaphoreName)))
						Gen_Confirm("Are you sure that you want to convert the "+[IDENTIFIERS:16]Name:3+" Unique No sequence"+" back to the standard method?"+"  Existing 'Multiple Numbers' will be deleted,"+" and any gaps in the sequence will become permanent."; "Yes"; "No")
						If (OK=1)
							DB_SaveRecord(->[IDENTIFIERS:16])
							READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
							MESSAGES OFF:C175
							QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[IDENTIFIERS:16]Table_Number:1)
							MESSAGES ON:C181
							If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
								MESSAGES OFF:C175
								ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2; <)
								MESSAGES ON:C181
								FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
								$_l_MultiTableNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
								$_t_MultiNumbersSTR:=""
								
								While (Not:C34(End selection:C36([IDENTIFIERS_MULTI_NUMBERS:94])))
									If ($_l_MultiTableNumber#[IDENTIFIERS_MULTI_NUMBERS:94]Number:2)
										$_t_MultiNumbersSTR:=$_t_MultiNumbersSTR+String:C10([IDENTIFIERS_MULTI_NUMBERS:94]Number:2)+" "
									Else 
										$_l_MultiTableNumberNEXT:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
									End if 
									NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
									$_l_MultiTableNumber:=$_l_MultiTableNumber-1
								End while 
								If ($_t_MultiNumbersSTR="")
									LAST RECORD:C200([IDENTIFIERS_MULTI_NUMBERS:94])
									[IDENTIFIERS:16]Number:2:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2-1
								Else 
									Gen_Alert("NB: The following numbers will now never be used: "+$_t_MultiNumbersSTR)
									[IDENTIFIERS:16]Number:2:=$_l_MultiTableNumberNEXT-1
								End if 
								DB_SaveRecord(->[IDENTIFIERS:16])
								DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
							End if 
							$_l_MultiTableNumber:=$_l_TableNumber+9000
							MESSAGES OFF:C175
							QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$_l_MultiTableNumber)
							MESSAGES ON:C181
							
							DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
							READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
						Else 
							[IDENTIFIERS:16]Multiple_Numbers:7:=True:C214
						End if 
						CLEAR SEMAPHORE:C144($_t_SemaphoreName)
					Else 
						Gen_Alert("The Numbers are currently in use and cannot be updated"; "Cancel")
						[IDENTIFIERS:16]Multiple_Numbers:7:=True:C214
					End if 
				End if 
				
			: (Modified:C32([IDENTIFIERS:16]Number:2))
				If ([IDENTIFIERS:16]Multiple_Numbers:7)
					$_l_TableNumber:=[IDENTIFIERS:16]Table_Number:1
					$_t_SemaphoreName:="CodeCr"+String:C10($_l_TableNumber)
					Gen_Confirm("Are you sure that you want to modify the "+[IDENTIFIERS:16]Name:3+" Number?"+"  Existing 'Multiple Numbers' will be deleted, and 40 more created, starting"+"  from the Number specified +1."; "Yes"; "No")
					If (OK=1)
						DB_SaveRecord(->[IDENTIFIERS:16])
						READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
						$_l_MultiTableNumber:=$_l_TableNumber+9000
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[IDENTIFIERS:16]Table_Number:1; *)
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  | ; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$_l_MultiTableNumber)
						DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
						READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
						$_l_TableNumber:=[IDENTIFIERS:16]Table_Number:1
						DB_SaveRecord(->[IDENTIFIERS:16])
						UNLOAD RECORD:C212([IDENTIFIERS:16])
						$_l_NewCodeProcess:=New process:C317("Gen_CodeCreate"; 128000; String:C10($_l_TableNumber))
						DelayTicks(180)
						$_l_Retries:=0
						While (Semaphore:C143($_t_SemaphoreName))
							$_l_Retries:=$_l_Retries+1
							DelayTicks($_l_Retries*2)
						End while 
						CLEAR SEMAPHORE:C144($_t_SemaphoreName)
						vTot:=1
					Else 
						READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[IDENTIFIERS:16]Table_Number:1)
						If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
							MESSAGES OFF:C175
							ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]Number:2; <)
							MESSAGES ON:C181
							FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
							[IDENTIFIERS:16]Number:2:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
						End if 
					End if 
				End if 
				
		End case 
End case 
ERR_MethodTrackerReturn("FM [IDENTIFIERS].Files_List"; $_t_oldMethodName)
