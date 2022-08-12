//%attributes = {}
If (False:C215)
	//Project Method Name:      MOVETYPES_NO_PROCESS
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
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Continue; $_bo_Exit; $_bo_IsFileNos; $_bo_IsLocked; $_bo_isMovementsType; $_bo_NoCheck; ID_bo_MoveCodeActivate)
	C_LONGINT:C283(<>MCUSED; <>MPNUMBER; $_l_Clash; $_l_Clashes; $_l_CodeCreateProcess; $_l_CreateIndex; $_l_Difference; $_l_LastMovementTypeNo; $_l_LengthA; $_l_LengthB; $_l_LengthC)
	C_LONGINT:C283($_l_LengthD; $_l_MaximumRecords; $_l_MNTableNumber; $_l_OK; $_l_ProcessState; $_l_ProcessTime; $_l_RecordsinSelectionMN; $_l_Repeats; $_l_Span; $_l_TypeNo; $_l_TypeNoOLD)
	C_LONGINT:C283($1; $3; AA_l_CallBackProcess; ID_l_Parameter3; ID_l_ParameterCont; ID_l_ParameterCount; MoveCodePrefProcess)
	C_POINTER:C301($_ptr_VarToSet)
	C_TEXT:C284(<>MPNUMBERSTR; $_t_Method; $_t_oldMethodName; $_t_ProcessName; $_t_TestClashnoSTR; $_t_TypeNoSTR; $2; $4; $5; $6; AA_t_VariableName2)
	C_TEXT:C284(CreateSem; CREATESEM2; CREATESEM3; ID_t_Parameter4; ID_t_Parameter5; ID_t_Parameter6; ID_t_Parameter7; ID_t_ParentProcessName; MPNUMBERSTR)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("MOVETYPES_NO_PROCESS")

//NG June 2004. Modified to not call another process if it locks the record

//Open window(60;171;250;210;-720)
CreateSem2:=""
CreateSem3:=""
AA_t_VariableName2:=$2
AA_l_CallBackProcess:=$1
PROCESS PROPERTIES:C336(AA_l_CallBackProcess; ID_t_ParentProcessName; $_l_ProcessState; $_l_ProcessTime)

$_t_Method:="Move Types number PROCESS"
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
	$_t_TypeNoSTR:=""
	Repeat   //NG APRIL 2004
		$_t_oldMethodName:=ERR_MethodTracker("MOVETYPES_NO_PROCESS"+" Recall")
		$_l_TypeNoOLD:=0
		ID_bo_MoveCodeActivate:=False:C215
		
		While (Semaphore:C143("UpVar"))
			DelayTicks(2)
		End while 
		If (Application type:C494=4D Remote mode:K5:5)
			GET PROCESS VARIABLE:C371(-1; <>MCUSED; <>MCUSED)
		End if 
		<>MCUSED:=<>MCUSED+1
		
		If (Application type:C494=4D Remote mode:K5:5)
			SET PROCESS VARIABLE:C370(-1; <>MCUSED; <>MCUSED)
		End if 
		CLEAR SEMAPHORE:C144("UpVar")
		
		$_bo_NoCheck:=False:C215
		READ ONLY:C145([IDENTIFIERS:16])
		READ ONLY:C145([MOVEMENT_TYPES:60])
		$_bo_IsLocked:=False:C215  //will get set to true if it is created here
		
		CreateSem3:="CodeCrMTN"+ID_t_Parameter4
		While (Semaphore:C143(Createsem3)) & (Not:C34(<>SYS_bo_QuitCalled))
			DelayTicks(2)
		End while 
		If ([MOVEMENT_TYPES:60]Type_Code:1#ID_t_Parameter4)
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=ID_t_Parameter4)
			$_bo_IsLocked:=CreateMoveRecord(ID_t_Parameter4; True:C214)
		End if 
		
		READ WRITE:C146([MOVEMENT_TYPES:60])
		$_bo_IsLocked:=True:C214
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=ID_t_Parameter4)
		
		$_l_MNTableNumber:=0
		If ([MOVEMENT_TYPES:60]MN_Identifier_Number:24>0)
			
			// `Message($_t_Method+" USING MULTI NUMBER SYSTEM")
			$_l_MNTableNumber:=[MOVEMENT_TYPES:60]MN_Identifier_Number:24
			Repeat 
				
				$_l_TypeNo:=0
				
				If (Not:C34(<>SYS_bo_QuitCalled))
					QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
					$_l_MNTableNumber:=[MOVEMENT_TYPES:60]MN_Identifier_Number:24
					$_l_RecordsinSelectionMN:=Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])
					If ($_l_RecordsinSelectionMN<20)
						
						CreateSem2:="CodeCrMTN"+ID_t_Parameter4+"_"
						While (Semaphore:C143(Createsem2)) & (Not:C34(<>SYS_bo_QuitCalled))
							DelayTicks(2)
						End while 
						
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
						
						If (Not:C34($_bo_IsLocked))  //added NG June 2004
							If (Application type:C494=4D Remote mode:K5:5)
								$_l_CodeCreateProcess:=Execute on server:C373("Gen_CodeCreate"; 128000; ID_t_Parameter4; [MOVEMENT_TYPES:60]MN_Identifier_Number:24; Current process:C322; *)  //NG Added CUrrent process JUNE 2004
							Else 
								$_l_CodeCreateProcess:=New process:C317("Gen_CodeCreate"; 128000; ID_t_Parameter4; [MOVEMENT_TYPES:60]MN_Identifier_Number:24; Current process:C322; *)  //NG Added CUrrent process JUNE 2004
								
							End if 
						Else 
							//cant do it in another process
							CreateSem:="CodeCr"+ID_t_Parameter4
							$_l_Repeats:=0
							While ((Semaphore:C143(CreateSem)) & (Not:C34(<>SYS_bo_QuitCalled)) & (Not:C34($_l_Repeats>1000)))
								$_l_Repeats:=$_l_Repeats+1
								DelayTicks(2)
							End while 
							
							If (Not:C34($_l_Repeats>1000)) & (Not:C34(<>SYS_bo_QuitCalled))
								
								READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
								$_l_LastMovementTypeNo:=[MOVEMENT_TYPES:60]Number:6-1
								$_l_MaximumRecords:=500
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
								For ($_l_CreateIndex; 1; $_l_MaximumRecords)
									CREATE RECORD:C68([IDENTIFIERS_MULTI_NUMBERS:94])
									[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=[MOVEMENT_TYPES:60]MN_Identifier_Number:24
									[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=$_l_LastMovementTypeNo+$_l_CreateIndex
									SAVE RECORD:C53([IDENTIFIERS_MULTI_NUMBERS:94])
								End for 
								
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
								UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
								[MOVEMENT_TYPES:60]Number:6:=$_l_LastMovementTypeNo+$_l_MaximumRecords
								DB_SaveRecord(->[MOVEMENT_TYPES:60])
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=ID_t_Parameter4)
							End if 
							CLEAR SEMAPHORE:C144(CreateSem)
							DelayTicks(3*Abs:C99(<>MCUSED)+1)
						End if 
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
						$_l_Repeats:=0
						
						Repeat 
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
							DelayTicks(2)
							QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
							If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)
								If (Not:C34($_bo_IsLocked))
									If (Application type:C494=4D Remote mode:K5:5)
										$_l_CodeCreateProcess:=Execute on server:C373("Gen_CodeCreate"; 128000; ID_t_Parameter4; [MOVEMENT_TYPES:60]MN_Identifier_Number:24; Current process:C322; *)  //NG Added CUrrent process JUNE 2004
									Else 
										$_l_CodeCreateProcess:=New process:C317("Gen_CodeCreate"; 128000; ID_t_Parameter4; [MOVEMENT_TYPES:60]MN_Identifier_Number:24; Current process:C322; *)  //NG Added CUrrent process JUNE 2004
										
									End if 
								Else 
									//Cant do it in process
									CreateSem:="CodeCr"+ID_t_Parameter4
									$_l_Repeats:=0
									While ((Semaphore:C143(CreateSem)) & (Not:C34(<>SYS_bo_QuitCalled)) & (Not:C34($_l_Repeats>1000)))
										$_l_Repeats:=$_l_Repeats+1
										DelayTicks(2)
									End while 
									If (Not:C34($_l_Repeats>1000)) & (Not:C34(<>SYS_bo_QuitCalled))
										READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
										$_l_LastMovementTypeNo:=[MOVEMENT_TYPES:60]Number:6-1
										$_l_MaximumRecords:=500
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
										For ($_l_CreateIndex; 1; $_l_MaximumRecords)
											CREATE RECORD:C68([IDENTIFIERS_MULTI_NUMBERS:94])
											[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=[MOVEMENT_TYPES:60]MN_Identifier_Number:24
											[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=$_l_LastMovementTypeNo+$_l_CreateIndex
											SAVE RECORD:C53([IDENTIFIERS_MULTI_NUMBERS:94])
										End for 
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
										UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
										[MOVEMENT_TYPES:60]Number:6:=$_l_LastMovementTypeNo+$_l_MaximumRecords
										DB_SaveRecord(->[MOVEMENT_TYPES:60])
										//UNLOAD RECORD([MOVEMENT TYPES])
										// READ ONLY([MOVEMENT TYPES])
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=ID_t_Parameter4)
									End if 
									CLEAR SEMAPHORE:C144(CreateSem)
									DelayTicks(2*Abs:C99(<>MCUSED)+1)
								End if 
							End if 
							
							QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
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
							
						Until (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0) | (<>SYS_bo_QuitCalled) | ($_l_Repeats>10)
						CLEAR SEMAPHORE:C144(CreateSem2)
						
						Repeat 
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
							DelayTicks(2*Abs:C99(<>MCUSED)+1)
							
							QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
							If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)
								CreateSem2:="CodeCrMTN"+ID_t_Parameter4+"_"
								While (Semaphore:C143(Createsem2)) & (Not:C34(<>SYS_bo_QuitCalled))
									DelayTicks(2)
								End while 
								If (Not:C34($_bo_IsLocked))
									If (Application type:C494=4D Remote mode:K5:5)
										$_l_CodeCreateProcess:=Execute on server:C373("Gen_CodeCreate"; 128000; ID_t_Parameter4; [MOVEMENT_TYPES:60]MN_Identifier_Number:24; Current process:C322; *)  //NG Added CUrrent process JUNE 2004
									Else 
										$_l_CodeCreateProcess:=New process:C317("Gen_CodeCreate"; 128000; ID_t_Parameter4; [MOVEMENT_TYPES:60]MN_Identifier_Number:24; Current process:C322; *)  //NG Added CUrrent process JUNE 2004
									End if 
								Else 
									CreateSem:="CodeCr"+ID_t_Parameter4
									$_l_Repeats:=0
									While ((Semaphore:C143(CreateSem)) & (Not:C34(<>SYS_bo_QuitCalled)) & (Not:C34($_l_Repeats>1000)))
										$_l_Repeats:=$_l_Repeats+1
										DelayTicks(2)
									End while 
									
									If (Not:C34($_l_Repeats>1000)) & (Not:C34(<>SYS_bo_QuitCalled))
										READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
										$_l_LastMovementTypeNo:=[MOVEMENT_TYPES:60]Number:6-1
										$_l_MaximumRecords:=500
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
										For ($_l_CreateIndex; 1; $_l_MaximumRecords)
											CREATE RECORD:C68([IDENTIFIERS_MULTI_NUMBERS:94])
											[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=[MOVEMENT_TYPES:60]MN_Identifier_Number:24
											[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=$_l_LastMovementTypeNo+$_l_CreateIndex
											SAVE RECORD:C53([IDENTIFIERS_MULTI_NUMBERS:94])
										End for 
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
										UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
										[MOVEMENT_TYPES:60]Number:6:=$_l_LastMovementTypeNo+$_l_MaximumRecords
										DB_SaveRecord(->[MOVEMENT_TYPES:60])
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=ID_t_Parameter4)
										
									End if 
									CLEAR SEMAPHORE:C144(CreateSem)
									DelayTicks(3*Abs:C99(<>MCUSED)+1)
								End if 
								CLEAR SEMAPHORE:C144(CreateSem2)
							End if 
							QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
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
						Until (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0) | (<>SYS_bo_QuitCalled) | ($_l_Repeats>1000)
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
						If ($_l_Repeats>1000) & (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0) & (Not:C34(<>SYS_bo_QuitCalled))
							//Use the single number method as a get ou
							//MOVETYPES_NO_PROCESS
							$_l_TypeNo:=1
							$_l_Repeats:=0
							$_bo_NoCheck:=True:C214
						End if 
						
						
					End if 
					If (Not:C34(<>SYS_bo_QuitCalled))
						MESSAGES OFF:C175
						ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2; >)
						MESSAGES ON:C181
						READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
						FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
						Repeat 
							While (Semaphore:C143("UpVar"))
								DelayTicks(2)
							End while 
							If (Application type:C494=4D Remote mode:K5:5)
								GET PROCESS VARIABLE:C371(-1; <>MCUSED; <>MCUSED)
							End if 
							<>MCUSED:=<>MCUSED+2
							If (Application type:C494=4D Remote mode:K5:5)
								SET PROCESS VARIABLE:C370(-1; <>MCUSED; <>MCUSED)
							End if 
							CLEAR SEMAPHORE:C144("UpVar")
							If (Check_Locked(->[IDENTIFIERS_MULTI_NUMBERS:94]; 0))
								
								If (Not:C34(<>SYS_bo_QuitCalled))
									If ([IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1<9000)
										$_bo_IsFileNos:=True:C214
										If ([IDENTIFIERS_MULTI_NUMBERS:94]Number:2<1)
											[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=1
										End if 
										
										$_l_TypeNoOLD:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
										$_l_TypeNo:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
										[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1+9000
										DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
										QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2=$_l_TypeNoOLD; *)
										QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  & ; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
										If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
											CreateSem2:="CodeCrMTN"+ID_t_Parameter4+"_"
											While (Semaphore:C143(Createsem2)) & (Not:C34(<>SYS_bo_QuitCalled))
												DelayTicks(2)
											End while 
											DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
											CLEAR SEMAPHORE:C144(CreateSem2)
										End if 
										
									Else 
										$_l_TypeNoOLD:=0
										$_l_TypeNo:=0
										NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
									End if 
								End if 
							Else 
								$_l_TypeNoOLD:=0
								$_l_TypeNo:=0
								NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
							End if 
							While (Semaphore:C143("UpVar"))
								DelayTicks(2)
							End while 
							If (Application type:C494=4D Remote mode:K5:5)
								GET PROCESS VARIABLE:C371(-1; <>MCUSED; <>MCUSED)
							End if 
							<>MCUSED:=<>MCUSED-2
							If (Application type:C494=4D Remote mode:K5:5)
								SET PROCESS VARIABLE:C370(-1; <>MCUSED; <>MCUSED)
							End if 
							CLEAR SEMAPHORE:C144("UpVar")
						Until (End selection:C36([IDENTIFIERS_MULTI_NUMBERS:94])) | ($_l_TypeNo>0) | (<>SYS_bo_QuitCalled)
						UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
						READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
					End if 
					
				End if 
			Until ($_l_TypeNo>0) | (<>SYS_bo_QuitCalled)
		Else 
			
			If (Not:C34(<>SYS_bo_QuitCalled))
				READ WRITE:C146([MOVEMENT_TYPES:60])
				LOAD RECORD:C52([MOVEMENT_TYPES:60])
				Repeat 
					If (Not:C34($_bo_IsLocked))
						$_bo_Continue:=Check_Locked(->[MOVEMENT_TYPES:60]; 1)
					Else 
						$_bo_Continue:=True:C214
					End if 
					If ($_bo_Continue)
						If (Not:C34(<>SYS_bo_QuitCalled))
							If ([MOVEMENT_TYPES:60]Number:6<0)
								[MOVEMENT_TYPES:60]Number:6:=0
							End if 
							
							[MOVEMENT_TYPES:60]Number:6:=[MOVEMENT_TYPES:60]Number:6+1
							$_l_TypeNo:=[MOVEMENT_TYPES:60]Number:6
							$_bo_isMovementsType:=True:C214
							$_l_OK:=0
						End if 
					Else 
						SHOW PROCESS:C325(Current process:C322)
						BRING TO FRONT:C326(Current process:C322)
						$_l_OK:=1
						Gen_Confirm("The "+[MOVEMENT_TYPES:60]Number_Name:5+" is locked by another User or Process."+Char:C90(13)+"Continue waiting?"; "Yes"; "No")
						If (OK=1)
							$_l_OK:=1
							$_l_TypeNo:=0
							If (Not:C34($_bo_IsLocked))
								LOAD RECORD:C52([MOVEMENT_TYPES:60])
							End if 
							$_l_TypeNo:=0
						Else 
							$_l_OK:=0
						End if 
					End if 
				Until ($_l_TypeNo>0) | ($_l_OK=0) | (<>SYS_bo_QuitCalled)
				
			End if 
		End if 
		$_l_Clashes:=0
		Repeat 
			If (Not:C34(<>SYS_bo_QuitCalled)) & (Not:C34($_bo_NoCheck=True:C214))
				$_l_Clash:=0
				If (ID_l_ParameterCount>=4)
					$_l_Span:=-1
					Repeat 
						$_l_LengthA:=Length:C16(String:C10($_l_TypeNo))
						Case of 
							: (ID_l_ParameterCount<4)
								$_t_TypeNoSTR:=("0"*(11-$_l_LengthA))+String:C10($_l_TypeNo)
							: (ID_l_ParameterCount=5)
								$_l_LengthB:=Length:C16(ID_t_Parameter5)
								$_l_LengthC:=$_l_LengthB+$_l_LengthA
								$_t_TypeNoSTR:=("0"*(11-$_l_LengthC))+String:C10($_l_TypeNo)
							: (ID_l_ParameterCount=6)
								$_l_LengthB:=Length:C16(ID_t_Parameter5)
								$_l_LengthD:=Length:C16(ID_t_Parameter6)
								$_l_LengthC:=$_l_LengthB+$_l_LengthA
								$_t_TypeNoSTR:=("0"*(11-$_l_LengthC))+String:C10($_l_TypeNo)
						End case 
						Repeat 
							Case of 
								: (ID_l_ParameterCount=3)
									$_t_TestClashnoSTR:=$_t_TypeNoSTR
								: (ID_l_ParameterCount=4)
									$_t_TestClashnoSTR:=$_t_TypeNoSTR
								: (ID_l_ParameterCont=5)
									$_t_TestClashnoSTR:=ID_t_Parameter4+$_t_TypeNoSTR
								: (ID_l_ParameterCount=6)
									$_t_TestClashnoSTR:=ID_t_Parameter4+$_t_TypeNoSTR+ID_t_Parameter6
							End case 
							$_l_Clash:=Find in field:C653([STOCK_MOVEMENTS:40]Type_Number:4; $_t_TestClashnoSTR)
							If ($_l_Clash=-1)
								$_l_Clash:=0
							End if 
							If ($_l_Clash=0)
								// ◊MPNUMBERSTR:=$_t_TypeNoSTR
								
							Else 
								$_l_Clashes:=$_l_Clashes+1
								If ($_l_Span<=0)
									$_l_Span:=1024
									$_l_TypeNo:=$_l_TypeNo+$_l_Span
									$_l_LengthA:=Length:C16(String:C10($_l_TypeNo))
									Case of 
										: (ID_l_ParameterCount<4)
											$_t_TypeNoSTR:=("0"*(11-$_l_LengthA))+String:C10($_l_TypeNo)
										: (ID_l_ParameterCount=5)
											$_l_LengthB:=Length:C16(ID_t_Parameter5)
											$_l_LengthC:=$_l_LengthB+$_l_LengthA
											$_t_TypeNoSTR:=("0"*(11-$_l_LengthC))+String:C10($_l_TypeNo)
										: (ID_l_ParameterCount=6)
											$_l_LengthB:=Length:C16(ID_t_Parameter5)
											$_l_LengthD:=Length:C16(ID_t_Parameter6)
											$_l_LengthC:=$_l_LengthB+$_l_LengthA
											$_t_TypeNoSTR:=("0"*(11-$_l_LengthC))+String:C10($_l_TypeNo)
									End case 
								Else 
									If ($_l_Span>=1)
										$_l_TypeNo:=$_l_TypeNo+$_l_Span
									End if 
									$_l_LengthA:=Length:C16(String:C10($_l_TypeNo))
									Case of 
										: (ID_l_ParameterCount<4)
											$_t_TypeNoSTR:=("0"*(11-$_l_LengthA))+String:C10($_l_TypeNo)
										: (ID_l_ParameterCount=5)
											$_l_LengthB:=Length:C16(ID_t_Parameter5)
											$_l_LengthC:=$_l_LengthB+$_l_LengthA
											$_t_TypeNoSTR:=("0"*(11-$_l_LengthC))+String:C10($_l_TypeNo)
										: (ID_l_ParameterCount=6)
											$_l_LengthB:=Length:C16(ID_t_Parameter5)
											$_l_LengthD:=Length:C16(ID_t_Parameter6)
											$_l_LengthC:=$_l_LengthB+$_l_LengthA
											$_t_TypeNoSTR:=("0"*(11-$_l_LengthC))+String:C10($_l_TypeNo)
									End case 
									[MOVEMENT_TYPES:60]Number:6:=$_l_TypeNo
									//        $_l_Span:=$_l_Span+Int($_l_Span/2)
								End if 
							End if 
						Until ($_l_Clash=0)
						If ($_l_Span<=1)
							//there was no clash
							If ($_l_Span=1)
								$_l_Span:=0
							End if 
						Else 
							//there has been a clash
							If ($_l_Clashes>0)
								$_l_TypeNo:=($_l_TypeNo-$_l_Span)
							End if 
							$_l_Span:=Int:C8($_l_Span/2)
						End if 
					Until ($_l_Span<1)
					<>MPNUMBER:=$_l_TypeNo
				Else 
					
					// `Message($_t_Method+" The number "+$_t_TestClashnoSTR+" was already used-getting another n
				End if 
			End if 
			$_bo_Exit:=False:C215
			
			PROCESS PROPERTIES:C336(AA_l_CallBackProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			If ($_l_ProcessState<0) | ($_t_ProcessName#ID_t_ParentProcessName)
				$_bo_Exit:=True:C214
			End if 
			
		Until ($_l_Clash=0) | (<>SYS_bo_QuitCalled) | ($_bo_Exit)
		If (Not:C34($_bo_Exit)) & (Not:C34(<>SYS_bo_QuitCalled))
			$_ptr_VarToSet:=Get pointer:C304(AA_t_VariableName2)
			SET PROCESS VARIABLE:C370(AA_l_CallBackProcess; MPNUMBERSTR; $_t_TypeNoSTR)
			RESUME PROCESS:C320(AA_l_CallBackProcess)
			Case of 
				: ($_bo_IsFileNos)
					DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
					UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
					READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
					DB_SaveRecord(->[MOVEMENT_TYPES:60])
					UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
					READ ONLY:C145([MOVEMENT_TYPES:60])
					
					
					DelayTicks(3*Abs:C99(<>MCUSED)+1)
				: ($_bo_isMovementsType)
					DB_SaveRecord(->[MOVEMENT_TYPES:60])
					UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
					READ ONLY:C145([MOVEMENT_TYPES:60])
					
					DelayTicks(3*Abs:C99(<>MCUSED)+1)
				Else 
					
					
					DelayTicks(3*Abs:C99(<>MCUSED)+1)
					
			End case 
		End if 
		
		
		//◊MPNUMBERSTR:=$_t_TypeNoSTR
		If (($_bo_IsFileNos))
			If ($_l_TypeNoOLD<$_l_TypeNo)
				$_l_Difference:=$_l_TypeNo-$_l_TypeNoOLD
				READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
				QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$_l_MNTableNumber)
				APPLY TO SELECTION:C70([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2+$_l_Difference)
				UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
				READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
				
			End if 
			
		End if 
		CLEAR SEMAPHORE:C144(CreateSem3)
		DelayTicks(60*Abs:C99(<>MCUSED)+1)
		$_bo_Exit:=False:C215
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
		
		Repeat   //NG APril 2004 test
			If (Not:C34(ID_bo_MoveCodeActivate))
				//DelayTicks (200) `NG modifying this. May 2008 possible cause of delay when getting number.(only real difference since build 60)
				DELAY PROCESS:C323(Current process:C322; 60)
				
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
ERR_MethodTrackerReturn("MOVETYPES_NO_PROCESS"; $_t_oldMethodName)
