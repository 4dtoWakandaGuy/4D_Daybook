//%attributes = {}

If (False:C215)
	//Project Method Name:      OLDMOVETYPESINPROCESS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Exit; $_bo_inProgress; $_bo_isFileNos; $_bo_isMovementsType; ID_bo_MoveCodeActivate; ID_bo_MoveCodePrefActivate)
	C_LONGINT:C283(<>MPNUMBER; $_l_Clash; $_l_CodeCreateProcess; $_l_OK; $_l_ProcessState; $_l_ProcessTime; $_l_RecordsinSelectionMN; $_l_Span; $_l_TypeNumber; $1; $3)
	C_LONGINT:C283(AA_l_CallBackProcess; ID_l_Parameter3; ID_l_ParameterCount)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284(<>MPNUMBERSTR; $_t_oldMethodName; $_t_ProcessName; $_t_TestClashingNumberSTR; $_t_TypeNumberSTR; $2; $4; $5; $6; AA_t_VariableName2; CreateSem)
	C_TEXT:C284(CreateSem2; CreateSem3; ID_t_Parameter4; ID_t_Parameter5; ID_t_Parameter6; ID_t_ParentProcessName; MPNUMBERSTR)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OLDMOVETYPESINPROCESS")

//NG June 2004 just while i check the changes I am making
$_t_oldMethodName:=ERR_MethodTracker("OLDMOVETYPESINPROCESS")

CreateSem2:=""
CreateSem3:=""
AA_t_VariableName2:=$2
AA_l_CallBackProcess:=$1
PROCESS PROPERTIES:C336(AA_l_CallBackProcess; ID_t_ParentProcessName; $_l_ProcessState; $_l_ProcessTime)

///$method:="Move Types number PROCESS"
//$4-added NG-make sure we have the correct thing loaded
If (Count parameters:C259>=4)
	Case of 
		: (Count parameters:C259=3)
			ID_l_Parameter3:=$3  //File number
			
		: (Count parameters:C259=4)
			
			
			ID_t_Parameter4:=$4
			ID_l_Parameter3:=$3  //File Number
		: (Count parameters:C259=5)
			ID_t_Parameter5:=$5
			ID_t_Parameter4:=$4
			ID_l_Parameter3:=$3  //File Number
		: (Count parameters:C259=6)
			ID_t_Parameter6:=$6
			ID_t_Parameter5:=$5
			ID_t_Parameter4:=$4
			ID_l_Parameter3:=$3  //File Number
	End case 
	ID_l_ParameterCount:=Count parameters:C259
	$_t_TypeNumberSTR:=""
	Repeat   //NG APRIL 2004
		ID_bo_MoveCodePrefActivate:=False:C215
		Repeat 
			READ ONLY:C145([IDENTIFIERS:16])
			READ ONLY:C145([MOVEMENT_TYPES:60])
			If ([MOVEMENT_TYPES:60]Type_Code:1#ID_t_Parameter4)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=ID_t_Parameter4)
				CreateMoveRecord(ID_t_Parameter4; False:C215)
			End if 
			
			If ([MOVEMENT_TYPES:60]MN_Identifier_Number:24>0)
				// `Message($method+" USING MULTI NUMBER SYSTEM")
				
				Repeat 
					$_l_TypeNumber:=0
					CreateSem2:="CodeCrMTN"+ID_t_Parameter4
					While (Semaphore:C143(Createsem2)) & (Not:C34(<>SYS_bo_QuitCalled))
						DelayTicks(10)
						
					End while 
					If (Not:C34(<>SYS_bo_QuitCalled))
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
						$_l_RecordsinSelectionMN:=Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])
						If ($_l_RecordsinSelectionMN<20)
							CreateSem:="CodeCr"+ID_t_Parameter4
							$_bo_inProgress:=Test semaphore:C652(CreateSem)
							If (Not:C34($_bo_inProgress))
								$_l_CodeCreateProcess:=New process:C317("Gen_CodeCreate"; 128000; ID_t_Parameter4; [MOVEMENT_TYPES:60]MN_Identifier_Number:24)
								Repeat 
									$_bo_inProgress:=Test semaphore:C652(CreateSem)
									DelayTicks(30)
									QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
									If (Not:C34($_bo_inProgress)) & (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)
										$_l_CodeCreateProcess:=New process:C317("Gen_CodeCreate"; 128000; ID_t_Parameter4; [MOVEMENT_TYPES:60]MN_Identifier_Number:24)
									End if 
								Until (Not:C34($_bo_inProgress)) & (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0) | (<>SYS_bo_QuitCalled)
								
							Else 
								Repeat 
									DelayTicks(30)
									$_bo_inProgress:=Test semaphore:C652(CreateSem)
									QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
									If (Not:C34($_bo_inProgress)) & (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)
										$_l_CodeCreateProcess:=New process:C317("Gen_CodeCreate"; 128000; ID_t_Parameter4; [MOVEMENT_TYPES:60]MN_Identifier_Number:24)
									End if 
								Until (Not:C34($_bo_inProgress)) & (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0) | (<>SYS_bo_QuitCalled)
								QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
							End if 
						End if 
						If (Not:C34(<>SYS_bo_QuitCalled))
							MESSAGES OFF:C175
							ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2; >)
							MESSAGES ON:C181
							READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
							
							
							FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
							Repeat 
								If (Check_Locked(->[IDENTIFIERS_MULTI_NUMBERS:94]; 0))
									While (Semaphore:C143(Createsem2)) & (Not:C34(<>SYS_bo_QuitCalled))
										DelayTicks(10)
									End while 
									If (Not:C34(<>SYS_bo_QuitCalled))
										If ([IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1<9000)
											$_bo_isFileNos:=True:C214
											$_l_TypeNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
											[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1+9000
											//DB_SaveRecord(->[FILES NOS])
											//UNLOAD RECORD([FILES NOS])
										End if 
									End if 
									
								Else 
									CLEAR SEMAPHORE:C144(CreateSem2)
									// `Message($method+" MULTI NUMBER is USED TESTING NEXT NUMBER")
									$_l_TypeNumber:=0
									NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
								End if 
								READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
								
							Until (End selection:C36([IDENTIFIERS_MULTI_NUMBERS:94])) | ($_l_TypeNumber>0) | (<>SYS_bo_QuitCalled)
							If ($_l_TypeNumber=0)
								// `Message($method+" MULTI NUMBER-NOT AVAILABLE-WILL TRY AGAIN")
							End if 
						End if 
						
					End if 
					
				Until ($_l_TypeNumber>0) | (<>SYS_bo_QuitCalled)
				
				
			Else 
				// `Message($method+" USING SIngle NUMBER SYSTEM")
				
				CreateSem3:="CodeCrMTN"+ID_t_Parameter4
				While (Semaphore:C143(CreateSem3)) & (Not:C34(<>SYS_bo_QuitCalled))
					DelayTicks(10)
				End while 
				If (Not:C34(<>SYS_bo_QuitCalled))
					READ WRITE:C146([MOVEMENT_TYPES:60])
					LOAD RECORD:C52([MOVEMENT_TYPES:60])
					Repeat 
						If (Check_Locked(->[MOVEMENT_TYPES:60]; 1))
							While (Semaphore:C143(CreateSem3)) & (Not:C34(<>SYS_bo_QuitCalled))
								DelayTicks(10)
							End while 
							If (Not:C34(<>SYS_bo_QuitCalled))
								[MOVEMENT_TYPES:60]Number:6:=[MOVEMENT_TYPES:60]Number:6+1
								$_l_TypeNumber:=[MOVEMENT_TYPES:60]Number:6
								//DB_SaveRecord(->[MOVEMENT TYPES])
								//UNLOAD RECORD([MOVEMENT TYPES])
								//READ ONLY([MOVEMENT TYPES])
								$_bo_isMovementsType:=True:C214
								
								$_l_OK:=1
							End if 
						Else 
							CLEAR SEMAPHORE:C144(CreateSem3)
							SHOW PROCESS:C325(Current process:C322)
							BRING TO FRONT:C326(Current process:C322)
							$_l_OK:=1
							Gen_Confirm("The "+[MOVEMENT_TYPES:60]Number_Name:5+" is locked by another User or Process."+Char:C90(13)+"Continue waiting?"; "Yes"; "No")
							If (OK=1)
								$_l_TypeNumber:=0
								LOAD RECORD:C52([MOVEMENT_TYPES:60])
								$_l_TypeNumber:=0
							Else 
								$_l_OK:=0
							End if 
						End if 
					Until ($_l_TypeNumber>0) | ($_l_OK=0) | (<>SYS_bo_QuitCalled)
					//UNLOAD RECORD([MOVEMENT TYPES])
					//READ ONLY([MOVEMENT TYPES])
					//CLEAR SEMAPHORE(CreateSem3)
				End if 
			End if 
			If (Not:C34(<>SYS_bo_QuitCalled))
				$_l_Clash:=0
				If (ID_l_ParameterCount>=4)
					$_l_Span:=-1
					Repeat 
						If (ID_l_ParameterCount<5)
							$_t_TypeNumberSTR:=("0"*(ID_l_Parameter3-Length:C16(String:C10($_l_TypeNumber))))+String:C10($_l_TypeNumber)
						Else 
							$_t_TypeNumberSTR:=("0"*((ID_l_Parameter3-Length:C16(ID_t_Parameter5))-Length:C16(String:C10($_l_TypeNumber))))+String:C10($_l_TypeNumber)
						End if 
						
						Repeat 
							Case of 
								: (ID_l_ParameterCount<5)
									$_t_TestClashingNumberSTR:=$_t_TypeNumberSTR
								: (ID_l_ParameterCount=5)
									$_t_TestClashingNumberSTR:=ID_t_Parameter5+$_t_TypeNumberSTR
								: (ID_l_ParameterCount=6)
									$_t_TestClashingNumberSTR:=ID_t_Parameter5+$_t_TypeNumberSTR+ID_t_Parameter6
							End case 
							SET QUERY DESTINATION:C396(3; $_l_Clash)
							QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Type_Number:4=$_t_TestClashingNumberSTR)
							SET QUERY DESTINATION:C396(0)
							If ($_l_Clash=0)
								// ◊MPNUMBERSTR:=$_t_TypeNumberSTR
								<>MPNUMBER:=$_l_TypeNumber
								$_ptr_Variable:=Get pointer:C304(AA_t_VariableName2)
								SET PROCESS VARIABLE:C370(AA_l_CallBackProcess; MPNUMBERSTR; $_t_TypeNumberSTR)
							Else 
								If ($_l_Span<=0)
									$_l_Span:=1000
									If (ID_l_ParameterCount<5)
										$_t_TypeNumberSTR:=("0"*(ID_l_Parameter3-Length:C16(String:C10($_l_TypeNumber+$_l_Span))))+String:C10($_l_TypeNumber+$_l_Span)
									Else 
										$_t_TypeNumberSTR:=("0"*((ID_l_Parameter3-Length:C16(ID_t_Parameter5))-Length:C16(String:C10($_l_TypeNumber+$_l_Span))))+String:C10($_l_TypeNumber+$_l_Span)
									End if 
								Else 
									If (ID_l_ParameterCount<5)
										$_t_TypeNumberSTR:=("0"*(ID_l_Parameter3-Length:C16(String:C10($_l_TypeNumber+$_l_Span))))+String:C10($_l_TypeNumber+$_l_Span)
									Else 
										$_t_TypeNumberSTR:=("0"*((ID_l_Parameter3-Length:C16(ID_t_Parameter5))-Length:C16(String:C10($_l_TypeNumber+$_l_Span))))+String:C10($_l_TypeNumber+$_l_Span)
									End if 
									[IDENTIFIERS:16]Number:2:=$_l_TypeNumber+$_l_Span
									$_l_Span:=$_l_Span+Int:C8($_l_Span/2)
								End if 
								
								
							End if 
							Case of 
								: ($_bo_isFileNos) & (CreateSem2#"")
									DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
									UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
									READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
									CLEAR SEMAPHORE:C144(CreateSem2)
								: ($_bo_isMovementsType) & (CreateSem3#"")
									DB_SaveRecord(->[MOVEMENT_TYPES:60])
									UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
									READ ONLY:C145([MOVEMENT_TYPES:60])
									CLEAR SEMAPHORE:C144(CreateSem3)
							End case 
						Until ($_l_Clash=0)
						If ($_l_Span<=0)
							//there was no clash
						Else 
							//there has been a clash
							$_l_TypeNumber:=($_l_TypeNumber-$_l_Span)+1
							$_l_Span:=Int:C8($_l_Span/2)
						End if 
						
						
					Until ($_l_Span<=1)
					
				Else 
					
					// `Message($method+" The number "+$_t_TestClashingNumberSTR+" was already used-getting another n
				End if 
			End if 
			$_bo_Exit:=False:C215
			PROCESS PROPERTIES:C336(AA_l_CallBackProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			If ($_l_ProcessState<0) | ($_t_ProcessName#ID_t_ParentProcessName)
				$_bo_Exit:=True:C214
			End if 
			
		Until ($_l_Clash=0) | (<>SYS_bo_QuitCalled) | ($_bo_Exit)
		//◊MPNUMBERSTR:=$_t_TypeNumberSTR
		
		$_bo_Exit:=False:C215
		Repeat   //NG APril 2004 test
			If (Not:C34(ID_bo_MoveCodeActivate))
				DelayTicks(20)
			End if 
			PROCESS PROPERTIES:C336(AA_l_CallBackProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			If ($_l_ProcessState<0) | ($_t_ProcessName#ID_t_ParentProcessName)
				$_bo_Exit:=True:C214
			End if 
			
		Until (ID_bo_MoveCodeActivate) | ($_bo_Exit) | (<>SYS_bo_QuitCalled)
	Until ($_bo_Exit) | (<>SYS_bo_QuitCalled)
Else 
	
	<>MPNUMBERSTR:=MoveType_No_OLDSTYLE
	
End if 

//CLOSE WINDOW
ERR_MethodTrackerReturn("OLDMOVETYPESINPROCESS"; $_t_oldMethodName)
