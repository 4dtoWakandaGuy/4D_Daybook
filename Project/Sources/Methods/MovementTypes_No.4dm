//%attributes = {}
If (False:C215)
	//Project Method Name:      MovementTypes_No
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/04/2010 13:15
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_isFileNos; $_bo_IsLocked; $_bo_MultipleNos; $_bo_WindowOpen; ID_bo_MoveCodeActivate)
	C_LONGINT:C283(<>MCUSED; $_l_Clash; $_l_Clashes; $_l_CountMultipleNumbers; $_l_Difference; $_l_LengthB; $_l_LengthC; $_l_LengthD; $_l_MNTableNumber; $_l_OK; $_l_Process)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; $_l_Repeats; $_l_ServerProcess; $_l_Span; $_l_TypeNumber; $_l_TypeNumberOLD; $1; ID_l_Parameter3; ID_l_ParameterCount; MoveCodePrefProcess)
	C_LONGINT:C283(MPNUMBER)
	C_TEXT:C284($_t_Method; $_t_MovementType; $_t_MovementTypeCode; $_t_oldMethodName; $_t_ProcessName; $_t_TestClash; $_t_TypeNoSTR; $0; $2; $3; $4)
	C_TEXT:C284(CREATESEM2; CREATESEM3; CREATESEM4; ID_t_Parameter4; ID_t_Parameter5; ID_t_Parameter6; MPNUMBERSTR)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MovementTypes_No")
$_t_Method:="MovementTypes_No"
CreateSem2:=""
CreateSem3:=""

If (Count parameters:C259>=2)
	$_t_MovementTypeCode:=$2
Else 
	$_t_MovementTypeCode:="-"
End if 
$_t_MovementType:=[MOVEMENT_TYPES:60]Type_Code:1
While (Semaphore:C143("UpVar"))
	DelayTicks(2)
End while 
If (Application type:C494=4D Remote mode:K5:5)
	GET PROCESS VARIABLE:C371(-1; <>MCUSED; <>MCUSED)
End if 
<>MCUSED:=<>MCUSED+1
If (<>MCUSed<0)
	<>MCUSED:=0
End if 
If (Application type:C494=4D Remote mode:K5:5)
	SET PROCESS VARIABLE:C370(-1; <>MCUSED; <>MCUSED)
End if 
CLEAR SEMAPHORE:C144("UpVar")

//the above is to remember if a record was loaded-and return to the same record
//UNLOAD RECORD([MOVEMENT TYPES])  `in case we are going int a process!
If (Not:C34(In transaction:C397)) | (([MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementTypeCode) & (Read only state:C362([MOVEMENT_TYPES:60])=False:C215)) | (Count parameters:C259=0)
	
	// `Message($_t_Method+"Retrieving next record number-NOT TRANSACTION")
	If (Count parameters:C259>=2) & ($_t_MovementTypeCode#"")
		CreateSem3:="CodeCrMTN"+$_t_MovementTypeCode
		While (Semaphore:C143(Createsem3)) & (Not:C34(<>SYS_bo_QuitCalled))
			DelayTicks(2)
		End while 
		
		READ ONLY:C145([IDENTIFIERS:16])
		READ ONLY:C145([MOVEMENT_TYPES:60])
		If ([MOVEMENT_TYPES:60]Type_Code:1#$_t_MovementTypeCode)
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementTypeCode)
		End if 
		$_bo_IsLocked:=CreateMoveRecord($_t_MovementTypeCode; True:C214)
		$_bo_MultipleNos:=([MOVEMENT_TYPES:60]MN_Identifier_Number:24>0)
		READ WRITE:C146([MOVEMENT_TYPES:60])
		If ([MOVEMENT_TYPES:60]Type_Code:1#$_t_MovementTypeCode)
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementTypeCode)
		Else 
			LOAD RECORD:C52([MOVEMENT_TYPES:60])
		End if 
		If ($_bo_MultipleNos)
			$_l_MNTableNumber:=[MOVEMENT_TYPES:60]MN_Identifier_Number:24
			Repeat 
				$_l_TypeNumber:=0
				CreateSem2:="CodeCrMTN"+$_t_MovementTypeCode+"_+"
				$_bo_isFileNos:=True:C214
				While (Semaphore:C143(Createsem2)) & (Not:C34(<>SYS_bo_QuitCalled))
					DelayTicks(1)
				End while 
				If (Not:C34(<>SYS_bo_QuitCalled))
					QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
					
					$_l_CountMultipleNumbers:=Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])
					If ($_l_CountMultipleNumbers<20)
						If (Application type:C494=4D Remote mode:K5:5)
							$_l_ServerProcess:=Execute on server:C373("Gen_CodeCreate"; 128000; $_t_MovementTypeCode; [MOVEMENT_TYPES:60]MN_Identifier_Number:24; *)
						Else 
							
							$_l_ServerProcess:=New process:C317("Gen_CodeCreate"; 128000; $_t_MovementTypeCode; [MOVEMENT_TYPES:60]MN_Identifier_Number:24; *)
						End if 
						
						Repeat 
							DelayTicks(30)
							QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
							If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)
								If (Application type:C494=4D Remote mode:K5:5)
									$_l_ServerProcess:=Execute on server:C373("Gen_CodeCreate"; 128000; $_t_MovementTypeCode; [MOVEMENT_TYPES:60]MN_Identifier_Number:24; *)
								Else 
									$_l_ServerProcess:=New process:C317("Gen_CodeCreate"; 128000; $_t_MovementTypeCode; [MOVEMENT_TYPES:60]MN_Identifier_Number:24; *)
								End if 
							End if 
							QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
						Until (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0) | (<>SYS_bo_QuitCalled)
					Else 
						While (Semaphore:C143("UpVar"))
							DelayTicks(2)
						End while 
						If (Application type:C494=4D Remote mode:K5:5)
							GET PROCESS VARIABLE:C371(-1; <>MCUSED; <>MCUSED)
						End if 
						<>MCUSED:=<>MCUSED+60
						If (Application type:C494=4D Remote mode:K5:5)
							SET PROCESS VARIABLE:C370(-1; <>MCUSED; <>MCUSED)
						End if 
						CLEAR SEMAPHORE:C144("UpVar")
						Repeat 
							QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
							If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)
								If (Application type:C494=4D Remote mode:K5:5)
									$_l_ServerProcess:=Execute on server:C373("Gen_CodeCreate"; 128000; $_t_MovementTypeCode; [MOVEMENT_TYPES:60]MN_Identifier_Number:24; *)
								Else 
									
									$_l_ServerProcess:=New process:C317("Gen_CodeCreate"; 128000; $_t_MovementTypeCode; [MOVEMENT_TYPES:60]MN_Identifier_Number:24; *)
								End if 
							End if 
							QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
						Until (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0) | (<>SYS_bo_QuitCalled)
						While (Semaphore:C143("UpVar"))
							DelayTicks(2)
						End while 
						If (Application type:C494=4D Remote mode:K5:5)
							GET PROCESS VARIABLE:C371(-1; <>MCUSED; <>MCUSED)
						End if 
						<>MCUSED:=<>MCUSED-60
						If (Application type:C494=4D Remote mode:K5:5)
							SET PROCESS VARIABLE:C370(-1; <>MCUSED; <>MCUSED)
						End if 
						CLEAR SEMAPHORE:C144("UpVar")
					End if 
					If (Not:C34(<>SYS_bo_QuitCalled))
						MESSAGES OFF:C175
						ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2; >)
						MESSAGES ON:C181
						READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
						FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
						
						Repeat 
							If (Check_Locked(->[IDENTIFIERS_MULTI_NUMBERS:94]; 0))
								
								If (Not:C34(<>SYS_bo_QuitCalled))
									If ([IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1<9000)
										// `Message($_t_Method+"  NEXT MULTI NUMBER RETREIVED")
										If ([IDENTIFIERS_MULTI_NUMBERS:94]Number:2<=0)
											[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=1
										End if 
										$_l_TypeNumberOLD:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
										$_l_TypeNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
										[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1+9000
										DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
										UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
										QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24; *)
										QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  & ; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2=$_l_TypeNumber)
										If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
											DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
										End if 
										UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
										READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
										
										DelayTicks(2)
									Else 
										$_l_TypeNumber:=0
										NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
									End if 
									READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
								End if 
							Else 
								NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
								
							End if 
						Until (End selection:C36([IDENTIFIERS_MULTI_NUMBERS:94])) | ($_l_TypeNumber>0) | (<>SYS_bo_QuitCalled)
						CLEAR SEMAPHORE:C144(CreateSem2)
						DelayTicks(2)
						If ($_l_TypeNumber=0)
						End if 
					Else 
						CLEAR SEMAPHORE:C144(CreateSem2)
					End if 
					
				End if 
				CLEAR SEMAPHORE:C144(CreateSem2)
			Until ($_l_TypeNumber>0) | (<>SYS_bo_QuitCalled)
		Else 
			If (Check_Locked(->[MOVEMENT_TYPES:60]; 1))
				
				If (Not:C34(<>SYS_bo_QuitCalled))
					READ WRITE:C146([MOVEMENT_TYPES:60])
					If ($_t_MovementTypeCode#"")
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementTypeCode)
					End if 
					LOAD RECORD:C52([MOVEMENT_TYPES:60])
					Repeat 
						If (Check_Locked(->[MOVEMENT_TYPES:60]; 1))
							// `Message($_t_Method+"  NEXT NUMBER RETREIVED"+String([MOVEMENT TYPES]Number+1))
							
							If (Not:C34(<>SYS_bo_QuitCalled))
								If ([MOVEMENT_TYPES:60]Number:6<1)
									[MOVEMENT_TYPES:60]Number:6:=1
								End if 
								
								[MOVEMENT_TYPES:60]Number:6:=[MOVEMENT_TYPES:60]Number:6+1
								$_l_TypeNumber:=[MOVEMENT_TYPES:60]Number:6
								DB_SaveRecord(->[MOVEMENT_TYPES:60])
								//UNLOAD RECORD([MOVEMENT TYPES])
								//READ ONLY([MOVEMENT TYPES])
								$_l_OK:=1
							End if 
						Else 
							
							$_l_OK:=1
							SHOW PROCESS:C325(Current process:C322)
							BRING TO FRONT:C326(Current process:C322)
							Gen_Confirm("The "+[MOVEMENT_TYPES:60]Number_Name:5+" is locked by another User or Process."+Char:C90(13)+"Continue waiting?"; "Yes"; "No")
							If (OK=1)
								$_l_TypeNumber:=0
								LOAD RECORD:C52([MOVEMENT_TYPES:60])
								$_l_TypeNumber:=0
							End if 
						End if 
					Until ($_l_TypeNumber>0) | (OK=0) | (<>SYS_bo_QuitCalled)
					
				End if 
				
			End if 
			
		End if 
		$_l_Span:=-1
		$_l_Clashes:=0
		Repeat 
			If (Not:C34(<>SYS_bo_QuitCalled))
				$_l_Clash:=0
				
				Repeat 
					
					Case of 
						: (Count parameters:C259<3)
							$_t_TypeNoSTR:=("0"*(11-Length:C16(String:C10($_l_TypeNumber))))+String:C10($_l_TypeNumber)
						: (Count parameters:C259=3)
							$_l_LengthB:=Length:C16($3)
							$_l_LengthC:=$_l_LengthB+Length:C16(String:C10($_l_TypeNumber))
							$_t_TypeNoSTR:=("0"*(11-$_l_LengthC))+String:C10($_l_TypeNumber)
						: (Count parameters:C259>=4)
							$_l_LengthB:=Length:C16($3)
							$_l_LengthD:=Length:C16($3)
							$_l_LengthC:=$_l_LengthB+Length:C16(String:C10($_l_TypeNumber))+$_l_LengthD
							$_t_TypeNoSTR:=("0"*(11-$_l_LengthC))+String:C10($_l_TypeNumber)
					End case 
					Repeat 
						$_l_Clash:=0
						$_t_TestClash:=$_t_TypeNoSTR
						If (Count parameters:C259>=2)
							Case of 
								: (Count parameters:C259=2)
									$_t_TestClash:=$_t_TypeNoSTR
								: (Count parameters:C259=3)
									$_t_TestClash:=$3+$_t_TypeNoSTR
								: (Count parameters:C259=4)
									$_t_TestClash:=$3+$_t_TypeNoSTR+$4
							End case 
							//SET QUERY DESTINATION(3;$_l_Clash)
							$_l_Clash:=Find in field:C653([STOCK_MOVEMENTS:40]Type_Number:4; $_t_TestClash)
							If ($_l_Clash=-1)
								$_l_Clash:=0
							End if 
							//  QUERY([STOCK MOVEMENTS];[STOCK MOVEMENTS]Type No=$_t_TestClash)
							//  SET QUERY DESTINATION(0)
						Else 
							$_l_Clash:=0
						End if 
						If ($_l_Clash>0)
							$_l_Clashes:=$_l_Clashes+1
							If ($_l_Span<=0)
								$_l_Span:=1024
								$_l_TypeNumber:=$_l_TypeNumber+$_l_Span
								Case of 
									: (Count parameters:C259<3)
										$_t_TypeNoSTR:=("0"*(11-Length:C16(String:C10($_l_TypeNumber))))+String:C10($_l_TypeNumber)
									: (Count parameters:C259=3)
										$_l_LengthB:=Length:C16($3)
										$_l_LengthC:=$_l_LengthB+Length:C16(String:C10($_l_TypeNumber))
										$_t_TypeNoSTR:=("0"*(11-$_l_LengthC))+String:C10($_l_TypeNumber)
									: (Count parameters:C259>=4)
										$_l_LengthB:=Length:C16($3)
										$_l_LengthD:=Length:C16($3)
										$_l_LengthC:=$_l_LengthB+Length:C16(String:C10($_l_TypeNumber))+$_l_LengthD
										$_t_TypeNoSTR:=("0"*(11-$_l_LengthC))+String:C10($_l_TypeNumber)
								End case 
							Else 
								If ($_l_Span>=1)
									$_l_TypeNumber:=$_l_TypeNumber+$_l_Span
								End if 
								Case of 
									: (Count parameters:C259<3)
										$_t_TypeNoSTR:=("0"*(11-Length:C16(String:C10($_l_TypeNumber))))+String:C10($_l_TypeNumber)
									: (Count parameters:C259=3)
										$_l_LengthB:=Length:C16($3)
										$_l_LengthC:=$_l_LengthB+Length:C16(String:C10($_l_TypeNumber))
										$_t_TypeNoSTR:=("0"*(11-$_l_LengthC))+String:C10($_l_TypeNumber)
									: (Count parameters:C259>=4)
										$_l_LengthB:=Length:C16($3)
										$_l_LengthD:=Length:C16($3)
										$_l_LengthC:=$_l_LengthB+Length:C16(String:C10($_l_TypeNumber))+$_l_LengthD
										$_t_TypeNoSTR:=("0"*(11-$_l_LengthC))+String:C10($_l_TypeNumber)
								End case 
								[MOVEMENT_TYPES:60]Number:6:=$_l_TypeNumber
							End if 
							
						End if 
						
					Until ($_l_Clash=0)
					If ($_l_Span>=1)
						If ($_l_Clashes>0)
							$_l_TypeNumber:=$_l_TypeNumber-$_l_Span
						End if 
						$_l_Span:=Int:C8($_l_Span/2)
					Else 
						If ($_l_Span=1)
							$_l_Span:=0
						End if 
					End if 
				Until ($_l_Span<1)
			End if 
			
		Until ($_l_Clash=0) | (<>SYS_bo_QuitCalled)
		
		If (Not:C34(<>SYS_bo_QuitCalled))
			$0:=$_t_TestClash
			Case of 
				: ($_bo_isFileNos)
					If ($_l_TypeNumberOLD<$_l_TypeNumber)
						$_l_Difference:=$_l_TypeNumber-$_l_TypeNumberOLD
						READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$_l_MNTableNumber)
						APPLY TO SELECTION:C70([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2+$_l_Difference)
						UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
						READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
						
					End if 
					
					
					DelayTicks(3)
				Else 
					DB_SaveRecord(->[MOVEMENT_TYPES:60])
					UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
					READ ONLY:C145([MOVEMENT_TYPES:60])
					
			End case 
		End if 
		CLEAR SEMAPHORE:C144(CreateSem3)
		
	Else 
		$0:=MoveType_No_OLDSTYLE
	End if 
Else 
	// `Message($_t_Method+" Retrieving next record number-IN TRANSACTION")
	
	
	
	If (Not:C34(<>SYS_bo_QuitCalled))
		
		MPNUMBERSTR:=""
		
		UNLOAD RECORD:C212([MOVEMENT_TYPES:60])  //BSW 16/04/03
		REDUCE SELECTION:C351([MOVEMENT_TYPES:60]; 0)
		READ ONLY:C145([MOVEMENT_TYPES:60])
		$_t_ProcessName:="MoveCode Server_process "+String:C10(Current process:C322)
		If (MoveCodePrefProcess>0)
			PROCESS PROPERTIES:C336(MoveCodePrefProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			If ($_t_ProcessName#$_t_ProcessName)
				MoveCodePrefProcess:=0
			End if 
		End if 
		Case of 
			: (MoveCodePrefProcess>0)
				Case of 
					: (Count parameters:C259=1)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_l_ParameterCount; 3)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_l_Parameter3; 11)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_bo_MoveCodeActivate; True:C214)
						RESUME PROCESS:C320(MoveCodePrefProcess)
					: (Count parameters:C259=2)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_l_ParameterCount; 4)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_l_Parameter3; 11)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_t_Parameter4; $2)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_bo_MoveCodeActivate; True:C214)
						RESUME PROCESS:C320(MoveCodePrefProcess)
					: (Count parameters:C259=3)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_l_ParameterCount; 5)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_l_Parameter3; 11)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_t_Parameter4; $2)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_t_Parameter5; $3)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_bo_MoveCodeActivate; True:C214)
						RESUME PROCESS:C320(MoveCodePrefProcess)
					: (Count parameters:C259=4)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_l_ParameterCount; 6)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_l_Parameter3; 11)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_t_Parameter4; $2)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_t_Parameter5; $3)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_t_Parameter6; $4)
						SET PROCESS VARIABLE:C370(MoveCodePrefProcess; ID_bo_MoveCodeActivate; True:C214)
						RESUME PROCESS:C320(MoveCodePrefProcess)
						
				End case 
				
			: (Count parameters:C259=1)
				MoveCodePrefProcess:=New process:C317("MOVETYPES_NO_PROCESS"; 128000; $_t_ProcessName; Current process:C322; "MPNUMBERSTR"; $1)
			: (Count parameters:C259=2)
				MoveCodePrefProcess:=New process:C317("MOVETYPES_NO_PROCESS"; 128000; $_t_ProcessName; Current process:C322; "MPNUMBERSTR"; $1; $2)
			: (Count parameters:C259=3)
				MoveCodePrefProcess:=New process:C317("MOVETYPES_NO_PROCESS"; 128000; $_t_ProcessName; Current process:C322; "MPNUMBERSTR"; $1; $2; $3)
			: (Count parameters:C259=4)
				MoveCodePrefProcess:=New process:C317("MOVETYPES_NO_PROCESS"; 128000; $_t_ProcessName; Current process:C322; "MPNUMBERSTR"; $1; $2; $3; $4)
		End case 
		
		$_l_Repeats:=0
		$_bo_WindowOpen:=False:C215
		
		Repeat 
			$_l_Repeats:=$_l_Repeats+1
			
			PROCESS PROPERTIES:C336(MoveCodePrefProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			If ($_l_ProcessState>=0) & (MPNUMBERSTR="")
				DelayTicks(5*Abs:C99(<>MCUSED)+1)
				RESUME PROCESS:C320(MoveCodePrefProcess)
				Case of 
					: ($_l_Repeats>50) & ($_l_Repeats<1000)
						If ($_bo_WindowOpen=False:C215)
							Open window:C153(80; 80; 200; 110; -1984)
							$_bo_WindowOpen:=True:C214
						End if 
						ERASE WINDOW:C160
						Case of 
							: (<>MCUSED>500)
								MESSAGE:C88("Creating Additional Multiple Numbers-Please wait")
							: (<>MCUSED>60)
								MESSAGE:C88("Creating Additional Multiple Numbers on server-Please wait")
							Else 
								MESSAGE:C88("Waiting For Number: "+String:C10($_l_Repeats)+" tries")
						End case 
						
					: ($_l_Repeats>1000)
						Case of 
							: (Count parameters:C259=2)
								MPNUMBER:=MoveTypeCodeBreakout($2)
								MPNUMBERSTR:=("0"*(11-Length:C16(String:C10(MPNUMBER))))+String:C10(MPNUMBER)
							: (Count parameters:C259=3)
								MPNUMBER:=MoveTypeCodeBreakout($2; $3)
								$_l_LengthB:=Length:C16($3)
								$_l_LengthC:=$_l_LengthB+Length:C16(String:C10(MPNUMBER))
								MPNUMBERSTR:=("0"*(11-$_l_LengthC))+String:C10(MPNUMBER)
							: (Count parameters:C259=4)
								MPNUMBER:=MoveTypeCodeBreakout($2; $3; $4)
								$_l_LengthB:=Length:C16($3)
								$_l_LengthD:=Length:C16($4)
								$_l_LengthC:=$_l_LengthB+(Length:C16(String:C10(MPNUMBER)))+$_l_LengthD
								MPNUMBERSTR:=("0"*(11-$_l_LengthC))+String:C10(MPNUMBER)
						End case 
				End case 
				
			Else 
				If ($_bo_WindowOpen)
					CLOSE WINDOW:C154
					$_bo_WindowOpen:=False:C215
				End if 
				PROCESS PROPERTIES:C336(MoveCodePrefProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
				If (($_l_ProcessState<0) | ($_t_ProcessName#$_t_ProcessName)) & (MPNUMBERSTR="")
					MoveCodePrefProcess:=0
					$_t_ProcessName:="MoveCode Server_process "+String:C10(Current process:C322)
					Case of 
						: (Count parameters:C259=1)
							MoveCodePrefProcess:=New process:C317("MOVETYPES_NO_PROCESS"; 128000; $_t_ProcessName; Current process:C322; "MPNUMBERSTR"; $1)
						: (Count parameters:C259=2)
							MoveCodePrefProcess:=New process:C317("MOVETYPES_NO_PROCESS"; 128000; $_t_ProcessName; Current process:C322; "MPNUMBERSTR"; $1; $2)
						: (Count parameters:C259=3)
							MoveCodePrefProcess:=New process:C317("MOVETYPES_NO_PROCESS"; 128000; $_t_ProcessName; Current process:C322; "MPNUMBERSTR"; $1; $2; $3)
						: (Count parameters:C259=4)
							MoveCodePrefProcess:=New process:C317("MOVETYPES_NO_PROCESS"; 128000; $_t_ProcessName; Current process:C322; "MPNUMBERSTR"; $1; $2; $3; $4)
					End case 
					$_l_Repeats:=0
					PROCESS PROPERTIES:C336(MoveCodePrefProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
					
					
				End if 
			End if 
			IDLE:C311
			$_l_ProcessState:=Process state:C330(MoveCodePrefProcess)
		Until ($_l_ProcessState<0) | (MPNUMBERSTR#"") | (<>SYS_bo_QuitCalled)
		If ($_bo_WindowOpen)
			CLOSE WINDOW:C154
		End if 
		
		If (Not:C34(<>SYS_bo_QuitCalled))
			If ($_t_MovementType#"")  //BSW 16/04/03
				READ ONLY:C145([MOVEMENT_TYPES:60])
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementType)
			End if 
			
			Case of 
				: (Count parameters:C259=1)
					$0:=MPNUMBERSTR
				: (Count parameters:C259=2)
					$0:=MPNUMBERSTR
				: (Count parameters:C259=3)
					$0:=$3+MPNUMBERSTR
				: (Count parameters:C259=4)
					$0:=$3+MPNUMBERSTR+$4
			End case 
			MPNUMBERSTR:=""
		End if 
	End if 
	
	
	DelayTicks(3*Abs:C99(<>MCUSED))
End if 
If ($_t_MovementType#"")
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_MovementType)
End if 
While (Semaphore:C143("UpVar"))
	DelayTicks(2)
End while 
If (Application type:C494=4D Remote mode:K5:5)
	GET PROCESS VARIABLE:C371(-1; <>MCUSED; <>MCUSED)
End if 
<>MCUSED:=<>MCUSED-1
If (Application type:C494=4D Remote mode:K5:5)
	SET PROCESS VARIABLE:C370(-1; <>MCUSED; <>MCUSED)
End if 
CLEAR SEMAPHORE:C144("UpVar")
ERR_MethodTrackerReturn("MovementTypes_No"; $_t_oldMethodName)
