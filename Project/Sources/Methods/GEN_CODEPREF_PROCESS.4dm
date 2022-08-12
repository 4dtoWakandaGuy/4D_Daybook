//%attributes = {}
If (False:C215)
	//Project Method Name:      GEN_CODEPREF_PROCESS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/10/2010 08:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Backslash; $_bo_Exit; $_bo_indexed; $_bo_InProgress; $_bo_isFIleNos; $_bo_isFIles; $_bo_OfficeCode; ID_bo_GenCodePrefActivate)
	C_LONGINT:C283(<>MPNUMBER; $_l_Clash; $_l_CodeProcess; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_IDNumber; $_l_LeadingZeros; $_l_OK; $_l_Process; $_l_ProcessState)
	C_LONGINT:C283($_l_ProcessTime; $_l_RecordsCount; $_l_TableNumber; $1; $3; $4; $5; AA_l_CallBackProcess; GenCodePrefProcess; ID_l_Parameter3; ID_l_Parameter4)
	C_LONGINT:C283(ID_l_Parameter5; ID_l_ParameterCount; SYS_l_LastNumber)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_VariableToSet)
	C_TEXT:C284($_t_MethodName; $_t_MPNumberSTR; $_t_oldMethodName; $_t_ProcessName; $_t_SemaphoreName; $_t_SemaphoreName2; $_t_SemaphoreName3; $_t_TableName; $_t_TestClash; $0; $2)
	C_TEXT:C284($6; $7; AA_t_VariableName2; ID_t_Parameter6; ID_t_Parameter7; ID_t_ParentProcessName; MPNUMBERSTR)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GEN_CODEPREF_PROCESS")
//Gen_CodePref - See also Gen_Code & MovementTypes_No
//this is the same, but returns a String ◊OfficeCode + / +  leading zeros + the no
If (Count parameters:C259>=3)
	AA_t_VariableName2:=$2
	AA_l_CallBackProcess:=$1
	PROCESS PROPERTIES:C336(AA_l_CallBackProcess; ID_t_ParentProcessName; $_l_ProcessState; $_l_ProcessTime)
	
	
	$_t_MethodName:="Gen_CodePref Process"
	$_t_MPNumberSTR:=""
	Case of 
		: (Count parameters:C259=3)
			ID_l_Parameter3:=$3  //File number
			
		: (Count parameters:C259=5)
			
			ID_l_Parameter5:=$5  //Fiel number
			ID_l_Parameter4:=$4  // Table number
			ID_l_Parameter3:=$3  //File Number
		: (Count parameters:C259=6)
			ID_t_Parameter6:=$6
			ID_l_Parameter5:=$5  //Fiel number
			ID_l_Parameter4:=$4  // Table number
			ID_l_Parameter3:=$3  //File Number
			
		: (Count parameters:C259=7)
			ID_t_Parameter6:=$6
			ID_l_Parameter5:=$5  //Fiel number
			ID_l_Parameter4:=$4  // Table number
			ID_l_Parameter3:=$3  //File Number
			ID_t_Parameter7:=$7
	End case 
	ID_l_ParameterCount:=Count parameters:C259
	Repeat   //NG April 2004 test
		$_t_MPNumberSTR:=""
		ID_bo_GenCodePrefActivate:=False:C215
		Repeat 
			READ ONLY:C145([IDENTIFIERS:16])
			If ([IDENTIFIERS:16]Table_Number:1#ID_l_Parameter3)
				QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=ID_l_Parameter3)
			End if 
			If (Records in selection:C76([IDENTIFIERS:16])=0)  //added NG December 2000
				$_t_SemaphoreName3:="CodeCrSEL"+String:C10(ID_l_Parameter3)
				While (Semaphore:C143($_t_SemaphoreName3)) & (Not:C34(<>SYS_bo_QuitCalled))
					DelayTicks(1)
				End while 
				QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=ID_l_Parameter3)  // in case someone else created
				If (Records in selection:C76([IDENTIFIERS:16])=0)
					
					CreateFileRecord(ID_l_Parameter3)
				End if 
				CLEAR SEMAPHORE:C144($_t_SemaphoreName3)
			End if 
			
			$_t_TableName:=[IDENTIFIERS:16]Name:3
			$_bo_OfficeCode:=[IDENTIFIERS:16]Office_Code:4
			$_bo_Backslash:=[IDENTIFIERS:16]Backslash:5
			$_l_LeadingZeros:=[IDENTIFIERS:16]Leading_Zeros:6
			If ([IDENTIFIERS:16]Multiple_Numbers:7)
				//Message($_t_MethodName+" USING MULTI NUMBER SYSTEM")
				Repeat 
					$_t_SemaphoreName2:="CodeCrSEL"+String:C10(ID_l_Parameter3)
					While (Semaphore:C143($_t_SemaphoreName2)) & (Not:C34(<>SYS_bo_QuitCalled))
						DelayTicks(10)
					End while 
					If (Not:C34(<>SYS_bo_QuitCalled))
						READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
						//Message($_t_MethodName+" CREATING MULTI NUMBERS")
						$_l_RecordsCount:=Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])
						If ($_l_RecordsCount<20)
							$_t_SemaphoreName:="CodeCr"+String:C10(ID_l_Parameter3)
							$_bo_InProgress:=Test semaphore:C652($_t_SemaphoreName)
							If (Not:C34($_bo_InProgress))
								$_l_CodeProcess:=New process:C317("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10(ID_l_Parameter3))
								Repeat 
									DelayTicks(30)
									$_bo_InProgress:=Test semaphore:C652($_t_SemaphoreName)
									QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
									If (Not:C34($_bo_InProgress)) & (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)
										$_l_CodeProcess:=New process:C317("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10(ID_l_Parameter3))
									End if 
								Until (Not:C34($_bo_InProgress)) & (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0) | (<>SYS_bo_QuitCalled)
								QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
							Else 
								Repeat 
									DelayTicks(30)
									$_bo_InProgress:=Test semaphore:C652($_t_SemaphoreName)
									QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
									If (Not:C34($_bo_InProgress)) & (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)
										$_l_CodeProcess:=New process:C317("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10(ID_l_Parameter3))
									End if 
								Until (Not:C34($_bo_InProgress)) & (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0) | (<>SYS_bo_QuitCalled)
								QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
							End if 
						End if 
						MESSAGES OFF:C175
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
						ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2; >)
						MESSAGES ON:C181
						FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
						Repeat 
							If (Check_Locked(->[IDENTIFIERS_MULTI_NUMBERS:94]; 0))
								While (Semaphore:C143($_t_SemaphoreName2)) & (Not:C34(<>SYS_bo_QuitCalled))
									DelayTicks(10)
								End while 
								If (Not:C34(<>SYS_bo_QuitCalled))
									If ([IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1<9000)
										$_l_IDNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
										SYS_l_LastNumber:=$_l_IDNumber
										[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1+9000
										$_bo_isFIleNos:=True:C214
									End if 
								End if 
							Else 
								CLEAR SEMAPHORE:C144($_t_SemaphoreName2)
								$_l_IDNumber:=0
								$_t_MPNumberSTR:=""
								NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
							End if 
						Until (End selection:C36([IDENTIFIERS_MULTI_NUMBERS:94])) | ($_l_IDNumber>0) | (<>SYS_bo_QuitCalled)
					End if 
					
				Until ($_l_IDNumber>0) | (<>SYS_bo_QuitCalled)
				If (Not:C34(<>SYS_bo_QuitCalled))
					$_t_MPNumberSTR:=""
					If ($_bo_OfficeCode)
						If ($_bo_Backslash)
							$_t_MPNumberSTR:=DB_GetOrganisationOfficeCode+"/"
						Else 
							$_t_MPNumberSTR:=DB_GetOrganisationOfficeCode
						End if 
					End if 
					If ($_l_LeadingZeros>0)
						$_t_MPNumberSTR:=$_t_MPNumberSTR+("0"*($_l_LeadingZeros-Length:C16(String:C10($_l_IDNumber))))+String:C10($_l_IDNumber)
					Else 
						$_t_MPNumberSTR:=$_t_MPNumberSTR+String:C10($_l_IDNumber)
					End if 
				End if 
			Else 
				//Message($_t_MethodName+" USING SIngle NUMBER SYSTEM")
				$_t_SemaphoreName3:="CodeCrSEL"+String:C10(ID_l_Parameter3)
				While (Semaphore:C143($_t_SemaphoreName3)) & (Not:C34(<>SYS_bo_QuitCalled))
					DelayTicks(1)
				End while 
				If (Not:C34(<>SYS_bo_QuitCalled))
					READ WRITE:C146([IDENTIFIERS:16])
					LOAD RECORD:C52([IDENTIFIERS:16])
					Repeat 
						If (Check_Locked(->[IDENTIFIERS:16]; 0))
							While (Semaphore:C143($_t_SemaphoreName3)) & (Not:C34(<>SYS_bo_QuitCalled))
								DelayTicks(1)
							End while 
							If (Not:C34(<>SYS_bo_QuitCalled))
								[IDENTIFIERS:16]Number:2:=[IDENTIFIERS:16]Number:2+1
								$_l_IDNumber:=[IDENTIFIERS:16]Number:2
								SYS_l_LastNumber:=$_l_IDNumber
								$_bo_isFIles:=True:C214
								$_l_OK:=1
							End if 
						Else 
							CLEAR SEMAPHORE:C144($_t_SemaphoreName3)
							$_bo_isFIles:=True:C214
							$_l_OK:=1
							SHOW PROCESS:C325(Current process:C322)
							BRING TO FRONT:C326(Current process:C322)
							Gen_Confirm("The "+[IDENTIFIERS:16]Name:3+" Number is locked by another User or Process."+Char:C90(13)+"Continue waiting?"; "Wait"; "Cancel")
							If (OK=0)
								$_l_IDNumber:=0
								LOAD RECORD:C52([IDENTIFIERS:16])
								$_l_OK:=0
							End if 
						End if 
					Until ($_l_IDNumber>0) | (OK=0) | (<>SYS_bo_QuitCalled)
					If (Not:C34(<>SYS_bo_QuitCalled))
						$_t_MPNumberSTR:=""
						If ($_bo_OfficeCode)
							If ($_bo_Backslash)
								$_t_MPNumberSTR:=DB_GetOrganisationOfficeCode+"/"
							Else 
								$_t_MPNumberSTR:=DB_GetOrganisationOfficeCode
							End if 
						End if 
						If ($_l_LeadingZeros>0)
							$_t_MPNumberSTR:=$_t_MPNumberSTR+("0"*($_l_LeadingZeros-Length:C16(String:C10($_l_IDNumber))))+String:C10($_l_IDNumber)
						Else 
							$_t_MPNumberSTR:=$_t_MPNumberSTR+String:C10($_l_IDNumber)
						End if 
					End if 
				End if 
				
			End if 
			If (Not:C34(<>SYS_bo_QuitCalled))
				$_l_Clash:=0
				If (ID_l_ParameterCount>=5)
					Case of 
						: (ID_l_ParameterCount=5)
							$_t_TestClash:=$_t_MPNumberSTR
						: (ID_l_ParameterCount=6)
							$_t_TestClash:=ID_t_Parameter6+$_t_MPNumberSTR
						: (ID_l_ParameterCount=7)
							$_t_TestClash:=ID_t_Parameter6+$_t_MPNumberSTR+ID_t_Parameter7
					End case 
					If (ID_l_ParameterCount>=5)
						If (ID_l_Parameter4>0) & (ID_l_Parameter5>0)
							$_l_TableNumber:=ID_l_Parameter4
							$_l_FieldNumber:=ID_l_Parameter5
							SET QUERY DESTINATION:C396(3; $_l_Clash)
							$_l_FieldType:=0
							$_l_FieldLength:=0
							$_bo_indexed:=False:C215
							$_ptr_FieldPointer:=Field:C253($_l_TableNumber; $_l_FieldNumber)
							GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_indexed)
							If (Not:C34($_bo_indexed)) & ($_l_FieldType#7)
								If (Application type:C494=4D Remote mode:K5:5)
									$_l_Process:=Execute on server:C373("AA_IndexoneField"; DB_ProcessMemoryinit(1); "Set Field Index"; $_l_TableNumber; $_l_FieldNumber; *)  //BSW 14//03/03 This is done in a separate proces
								Else 
									$_l_Process:=New process:C317("AA_IndexoneField"; DB_ProcessMemoryinit(1); "Set Field Index"; $_l_TableNumber; $_l_FieldNumber; *)  //BSW 14//03/03 This is done in a separate proces
									
								End if 
							End if 
							Case of 
								: (Type:C295($_ptr_FieldPointer->)=Is longint:K8:6) | (Type:C295($_ptr_FieldPointer->)=Is real:K8:4) | (Type:C295($_ptr_FieldPointer->)=Is integer:K8:5)
									QUERY:C277(Table:C252($_l_TableNumber)->; $_ptr_FieldPointer->=Num:C11($_t_TestClash))
								Else 
									QUERY:C277(Table:C252($_l_TableNumber)->; $_ptr_FieldPointer->=$_t_TestClash)
							End case 
							SET QUERY DESTINATION:C396(0)
						End if 
					End if 
					
					If ($_l_Clash=0)
						$_ptr_VariableToSet:=Get pointer:C304(AA_t_VariableName2)
						SET PROCESS VARIABLE:C370(AA_l_CallBackProcess; MPNUMBERSTR; $_t_MPNumberSTR)
					End if 
					<>MPNUMBER:=$_l_IDNumber
					Case of 
						: ($_bo_isFIles)
							DB_SaveRecord(->[IDENTIFIERS:16])
							UNLOAD RECORD:C212([IDENTIFIERS:16])
							READ ONLY:C145([IDENTIFIERS:16])
							CLEAR SEMAPHORE:C144($_t_SemaphoreName3)
							
						: ($_bo_isFIleNos)
							DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
							UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
							READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
							CLEAR SEMAPHORE:C144($_t_SemaphoreName2)
							
					End case 
					
				End if 
			End if 
		Until ($_l_Clash=0) | (<>SYS_bo_QuitCalled)
		$_bo_Exit:=False:C215
		Repeat   //NG APril 2004 test
			If (Not:C34(ID_bo_GenCodePrefActivate)) & (Not:C34(<>SYS_bo_QuitCalled))
				DelayTicks(20)
			End if 
			PROCESS PROPERTIES:C336(AA_l_CallBackProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			If ($_l_ProcessState<0) | ($_t_ProcessName#ID_t_ParentProcessName)
				$_bo_Exit:=True:C214
			End if 
			
		Until (ID_bo_GenCodePrefActivate) | ($_bo_Exit) | (<>SYS_bo_QuitCalled)
	Until ($_bo_Exit) | (<>SYS_bo_QuitCalled)
	
End if 
ERR_MethodTrackerReturn("GEN_CODEPREF_PROCESS"; $_t_oldMethodName)