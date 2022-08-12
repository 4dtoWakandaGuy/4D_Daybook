//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_Code_PROCESS
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
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_CanIndex; $_bo_Exit; $_bo_indexed; $_bo_IsFileNos; $_bo_isFIles; $_bo_IsLocked; ID_bo_GenCodeActivate)
	C_LONGINT:C283(<>GCUSED; <>MPNUMBER; $_l_Clash; $_l_Clashes; $_l_Difference; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_GCIndex; $_l_GenCodeProcess; $_l_IdNumber)
	C_LONGINT:C283($_l_MaxGC; $_l_MpNumber; $_l_MultiTableNumber; $_l_NumberClash; $_l_OK; $_l_Process; $_l_processState; $_l_processTime; $_l_RecordsCount; $_l_Repeats; $_l_Span)
	C_LONGINT:C283($_l_TableNumber; $0; $1; $3; $4; $5; AA_l_CallBackProcess; GenCodeProcess; ID_l_Parameter3; ID_l_Parameter4; ID_l_Parameter5)
	C_LONGINT:C283(ID_l_ParameterCount; MPNUMBER; SYS_l_LastNumber)
	C_POINTER:C301($_ptr_FieldPointer)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; $_t_processName; $_t_SemaphoreName; $_t_SemaphoreName3; $_t_SemaphoreNameA; $_t_TestClash; $2; $6; $7; AA_t_VariableName2)
	C_TEXT:C284(ID_t_Parameter6; ID_t_Parameter7; ID_t_ParentProcessName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Gen_Code_PROCESS")

If (Count parameters:C259>=3)
	$_t_MethodName:="Gen_Code Process"
	AA_t_VariableName2:=$2  //NG APRIL 2004 not using this anymore.
	AA_l_CallBackProcess:=$1
	PROCESS PROPERTIES:C336(AA_l_CallBackProcess; ID_t_ParentProcessName; $_l_processState; $_l_processTime)
	
	Case of 
		: (Count parameters:C259<5)
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
		$_t_oldMethodName:=ERR_MethodTracker("Gen_Code_PROCESS"+"Recalled")
		
		<>GCUSED:=<>GCUSED+1
		$_l_Clash:=0
		$_l_MpNumber:=0
		ID_bo_GenCodeActivate:=False:C215  //set by other process to reactivate
		$_bo_IsLocked:=False:C215
		$_l_Span:=-1
		$_bo_CanIndex:=True:C214
		//1
		$_t_SemaphoreName3:="CodeCrSEL"+String:C10(ID_l_Parameter3)
		While (Semaphore:C143($_t_SemaphoreName3)) & (Not:C34(<>SYS_bo_QuitCalled))  //14
			DelayTicks(1+Abs:C99(<>GCUSED))
		End while 
		
		READ WRITE:C146([IDENTIFIERS:16])
		If ([IDENTIFIERS:16]Table_Number:1#ID_l_Parameter3)  //2
			QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=ID_l_Parameter3)
		End if   //2²
		If (Records in selection:C76([IDENTIFIERS:16])=0)
			QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=ID_l_Parameter3)  // in case someone else created
			If (Records in selection:C76([IDENTIFIERS:16])=0)
				READ WRITE:C146([IDENTIFIERS:16])
				CREATE RECORD:C68([IDENTIFIERS:16])
				[IDENTIFIERS:16]Table_Number:1:=ID_l_Parameter3
				DB_SaveRecord(->[IDENTIFIERS:16])
				$_bo_IsLocked:=True:C214
			End if 
			
		End if 
		
		If ([IDENTIFIERS:16]Multiple_Numbers:7)  //13
			Repeat   //3
				
				If (Not:C34(<>SYS_bo_QuitCalled))
					READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
					QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
					$_l_RecordsCount:=Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])
					If ($_l_RecordsCount<1)  //5
						$_t_SemaphoreName:="CodeCr"+String:C10(ID_l_Parameter3)+"_"
						While (Semaphore:C143($_t_SemaphoreName))
							DelayTicks(2)
						End while 
						
						
						If (Not:C34($_bo_IsLocked))
							If (Application type:C494=4D Remote mode:K5:5)
								$_l_GenCodeProcess:=Execute on server:C373("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10(ID_l_Parameter3); ID_l_Parameter3; *)
							Else 
								$_l_GenCodeProcess:=New process:C317("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10(ID_l_Parameter3); ID_l_Parameter3; *)
							End if 
							
							Repeat   //7
								
								<>GCUSED:=<>GCUSED+60
								
								QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
								If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)
									If (Application type:C494=4D Remote mode:K5:5)
										$_l_GenCodeProcess:=Execute on server:C373("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10(ID_l_Parameter3); ID_l_Parameter3; *)
									Else 
										$_l_GenCodeProcess:=New process:C317("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10(ID_l_Parameter3); ID_l_Parameter3; *)
									End if 
								End if 
								QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
								<>GCUSED:=<>GCUSED-60
							Until (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0) | (<>SYS_bo_QuitCalled)
							
							QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
						Else 
							//Cant do creation in another process
							$_t_SemaphoreNameA:="CodeCr"+String:C10(ID_l_Parameter3)
							$_l_Repeats:=0
							While ((Semaphore:C143($_t_SemaphoreNameA)) & (Not:C34(<>SYS_bo_QuitCalled)) & (Not:C34($_l_Repeats>1000)))
								$_l_Repeats:=$_l_Repeats+1
								DelayTicks(1*Abs:C99(<>GCUSED))
							End while 
							If (Not:C34($_l_Repeats>1000)) & (Not:C34(<>SYS_bo_QuitCalled))
								
								READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
								READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
								QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)  //added NG
								If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
									$_l_IdNumber:=([IDENTIFIERS_MULTI_NUMBERS:94]Number:2)-1
								Else 
									$_l_IdNumber:=[IDENTIFIERS:16]Number:2
								End if 
								<>GCUSED:=<>GCUSED+500
								$_l_MaxGC:=500
								For ($_l_GCIndex; 1; $_l_MaxGC)
									CREATE RECORD:C68([IDENTIFIERS_MULTI_NUMBERS:94])
									[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=ID_l_Parameter3
									[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=$_l_IdNumber+$_l_GCIndex
									SAVE RECORD:C53([IDENTIFIERS_MULTI_NUMBERS:94])
								End for 
								<>GCUSED:=<>GCUSED-500
								UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
								[IDENTIFIERS:16]Number:2:=$_l_IdNumber+$_l_MaxGC
							End if 
							
							CLEAR SEMAPHORE:C144($_t_SemaphoreNameA)
							DelayTicks(2*Abs:C99(<>GCUSED))
							
						End if 
						CLEAR SEMAPHORE:C144($_t_SemaphoreName)
					Else   //6
						Repeat   //7
							<>GCUSED:=<>GCUSED+60
							$_t_SemaphoreName:="CodeCr"+String:C10(ID_l_Parameter3)+"_"
							While (Semaphore:C143($_t_SemaphoreName))
								DelayTicks(2)
							End while 
							QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
							If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)  //8
								If (Not:C34($_bo_IsLocked))
									If (Application type:C494=4D Remote mode:K5:5)
										$_l_GenCodeProcess:=Execute on server:C373("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10(ID_l_Parameter3); ID_l_Parameter3; *)
									Else 
										$_l_GenCodeProcess:=New process:C317("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10(ID_l_Parameter3); ID_l_Parameter3; *)
									End if 
								Else 
									//cant do in process
									$_t_SemaphoreNameA:="CodeCr"+String:C10(ID_l_Parameter3)
									$_l_Repeats:=0
									While ((Semaphore:C143($_t_SemaphoreNameA)) & (Not:C34(<>SYS_bo_QuitCalled)) & (Not:C34($_l_Repeats>1000)))
										$_l_Repeats:=$_l_Repeats+1
										DelayTicks(1+Abs:C99(<>GCUSED))
									End while 
									If (Not:C34($_l_Repeats>1000)) & (Not:C34(<>SYS_bo_QuitCalled))
										
										READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
										READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
										QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)  //added NG
										If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
											$_l_IdNumber:=([IDENTIFIERS_MULTI_NUMBERS:94]Number:2)-1
										Else 
											$_l_IdNumber:=[IDENTIFIERS:16]Number:2
										End if 
										$_l_MaxGC:=500
										<>GCUSED:=<>GCUSED+500
										For ($_l_GCIndex; 1; $_l_MaxGC)
											CREATE RECORD:C68([IDENTIFIERS_MULTI_NUMBERS:94])
											[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=ID_l_Parameter3
											[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=$_l_IdNumber+$_l_GCIndex
											SAVE RECORD:C53([IDENTIFIERS_MULTI_NUMBERS:94])
										End for 
										UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
										<>GCUSED:=<>GCUSED-500
										[IDENTIFIERS:16]Number:2:=$_l_IdNumber+$_l_MaxGC
									End if 
									CLEAR SEMAPHORE:C144($_t_SemaphoreNameA)
									DelayTicks(2+Abs:C99(<>GCUSED))
								End if 
							End if   //8
							<>GCUSED:=<>GCUSED-60
							QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
							CLEAR SEMAPHORE:C144($_t_SemaphoreName)
						Until (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0) | (<>SYS_bo_QuitCalled)  //7²
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
						
						
					End if   //5²
					If (Not:C34(<>SYS_bo_QuitCalled))
						MESSAGES OFF:C175
						ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2; >)
						// MESSAGE($_t_MethodName+" RETREIVING NEXT MULTI NUMBER")
						MESSAGES ON:C181
						FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
						
						Repeat   //9
							If (Check_Locked(->[IDENTIFIERS_MULTI_NUMBERS:94]; 0))  //10
								//11²
								If (Not:C34(<>SYS_bo_QuitCalled))
									$_bo_IsFileNos:=True:C214
									If ([IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1<9000)  //12
										$_l_MultiTableNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2  //+1
										If ([IDENTIFIERS_MULTI_NUMBERS:94]Number:2<=0)
											[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=1
										End if 
										$_l_MpNumber:=$_l_MultiTableNumber
										SYS_l_LastNumber:=$_l_MultiTableNumber
										[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1+9000
										DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
										QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3; *)
										QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  & ; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2=$_l_MpNumber)
										If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
											DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
										End if 
										
									Else 
										$_l_MpNumber:=0
										NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
									End if 
								End if   //12
							Else   //10
								$_l_MpNumber:=0
								NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
							End if   //10²
							
							
						Until (End selection:C36([IDENTIFIERS_MULTI_NUMBERS:94])) | ($_l_MpNumber>0) | (<>SYS_bo_QuitCalled)  //9²
					End if 
				End if 
				
			Until ($_l_MpNumber>0) | (<>SYS_bo_QuitCalled)  //3
			
		Else   //13
			
			If (Not:C34(<>SYS_bo_QuitCalled))
				
				Repeat   //15
					If (Check_Locked(->[IDENTIFIERS:16]; 0))
						
						
						If (Not:C34(<>SYS_bo_QuitCalled))
							If ([IDENTIFIERS:16]Number:2<0)
								[IDENTIFIERS:16]Number:2:=0
							End if 
							
							[IDENTIFIERS:16]Number:2:=[IDENTIFIERS:16]Number:2+1
							SYS_l_LastNumber:=[IDENTIFIERS:16]Number:2
							$_l_MpNumber:=[IDENTIFIERS:16]Number:2
							$_bo_isFIles:=True:C214
							$_l_OK:=1
						End if 
					Else   //16
						CLEAR SEMAPHORE:C144($_t_SemaphoreName3)
						$_l_OK:=1
						Gen_Confirm("The "+[IDENTIFIERS:16]Name:3+" Number is locked by another User or Process."+Char:C90(13)+"Continue waiting?"; "Wait"; "Cancel")
						If (OK=0)
							$_l_MpNumber:=0
							//LOAD RECORD([FILES])
							$_l_OK:=0
							While (Semaphore:C143($_t_SemaphoreName3)) & (Not:C34(<>SYS_bo_QuitCalled))  //14
								DelayTicks(1*Abs:C99(<>GCUSED))
							End while   //
						End if   //
					End if 
					
				Until ($_l_MpNumber>0) | (OK=0) | (<>SYS_bo_QuitCalled)  //15
			End if 
			
		End if   //13
		$_l_Clashes:=0
		Repeat 
			If (Not:C34(<>SYS_bo_QuitCalled))
				
				$_l_Clash:=0
				Case of 
					: (ID_l_ParameterCount<6)
						$_t_TestClash:=String:C10($_l_MpNumber)
					: (ID_l_ParameterCount=6)
						$_t_TestClash:=ID_t_Parameter6+String:C10($_l_MpNumber)
						
					: (ID_l_ParameterCount=7)
						$_t_TestClash:=ID_t_Parameter6+String:C10($_l_MpNumber)+ID_t_Parameter7
				End case   //19
				
				If (ID_l_ParameterCount>=5)
					If (ID_l_Parameter4>0) & (ID_l_Parameter5>0)
						$_l_Span:=-1
						
						Repeat 
							
							Repeat 
								If ($_l_Span>0)
									
									Case of 
										: (ID_l_ParameterCount=3) | (ID_l_ParameterCount<6)
											$_t_TestClash:=String:C10($_l_MpNumber)
										: (ID_l_ParameterCount=6)
											$_t_TestClash:=ID_t_Parameter6+String:C10($_l_MpNumber)
											
										: (ID_l_ParameterCount=7)
											$_t_TestClash:=ID_t_Parameter6+String:C10($_l_MpNumber)+ID_t_Parameter7
									End case 
								End if 
								
								$_l_TableNumber:=ID_l_Parameter4
								$_l_FieldNumber:=ID_l_Parameter5
								
								$_l_FieldType:=0
								$_l_FieldLength:=0
								$_bo_indexed:=False:C215
								$_ptr_FieldPointer:=Field:C253($_l_TableNumber; $_l_FieldNumber)
								GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_indexed)
								If (Not:C34($_bo_indexed)) & ($_l_FieldType#7) & ($_bo_CanIndex)  //20
									$_bo_CanIndex:=False:C215  //so we dont do it over and over
									$_l_Process:=Execute on server:C373("AA_IndexoneField"; DB_ProcessMemoryinit(1); "Set Field Index"; $_l_TableNumber; $_l_FieldNumber; *)  //BSW 14//03/03 This is done in a separate proces
								End if   //20²
								
								
								Case of   //22
									: (Type:C295($_ptr_FieldPointer->)=Is longint:K8:6) | (Type:C295($_ptr_FieldPointer->)=Is real:K8:4) | (Type:C295($_ptr_FieldPointer->)=Is integer:K8:5)
										If (Not:C34($_bo_indexed))
											SET QUERY DESTINATION:C396(3; $_l_Clash)
											QUERY:C277(Table:C252($_l_TableNumber)->; $_ptr_FieldPointer->=Num:C11($_t_TestClash))
											SET QUERY DESTINATION:C396(0)
										Else 
											$_l_NumberClash:=Num:C11($_t_TestClash)
											$_l_Clash:=Find in field:C653($_ptr_FieldPointer->; $_l_NumberClash)
											
											If ($_l_Clash=-1)
												$_l_Clash:=0
											End if 
											
										End if 
										
									Else 
										If (Not:C34($_bo_indexed))
											SET QUERY DESTINATION:C396(3; $_l_Clash)
											QUERY:C277(Table:C252($_l_TableNumber)->; $_ptr_FieldPointer->=$_t_TestClash)
											SET QUERY DESTINATION:C396(0)
										Else 
											$_l_Clash:=Find in field:C653($_ptr_FieldPointer->; $_t_TestClash)
											If ($_l_Clash=-1)
												$_l_Clash:=0
											End if 
											
										End if 
								End case   //22²
								
								//``
								If ($_l_Clash>0)
									$_l_Clashes:=$_l_Clashes+1
									If ($_l_Span<=0)
										$_l_Span:=1024
									Else 
										$_l_MpNumber:=$_l_MpNumber+$_l_Span
										Case of   //24
											: ($_bo_isFIles)
												[IDENTIFIERS:16]Number:2:=$_l_MpNumber
											: ($_bo_IsFileNos)
												If ([IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
													[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1+9000
												End if 
												[IDENTIFIERS:16]Number:2:=$_l_MpNumber
										End case 
										
									End if 
									
								End if 
								//```
							Until ($_l_Clash=0) | (<>SYS_bo_QuitCalled)
							If ($_l_Span<=1)
								//there was no clash
								If ($_l_Span=1)
									$_l_Span:=0
								End if 
							Else 
								//there has been a clash
								If ($_l_Clashes>0)
									$_l_MpNumber:=($_l_MpNumber-$_l_Span)
								End if 
								
								$_l_Span:=Int:C8($_l_Span/2)
							End if 
							
							
						Until ($_l_Span<1) | (<>SYS_bo_QuitCalled)
						If ($_bo_IsFileNos)
							
							If ($_l_MpNumber>($_l_MultiTableNumber+2))
								//we had to skip numbers
								$_l_Difference:=$_l_MpNumber-$_l_MultiTableNumber
								READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
								QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=ID_l_Parameter3)
								APPLY TO SELECTION:C70([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2+$_l_Difference)
							End if 
						End if 
					End if 
				End if 
				
				
			End if 
			$_bo_Exit:=False:C215
			PROCESS PROPERTIES:C336(AA_l_CallBackProcess; $_t_processName; $_l_processState; $_l_processTime)
			If ($_l_processState<0) | ($_t_processName#ID_t_ParentProcessName)
				$_bo_Exit:=True:C214
			End if 
			
		Until ($_l_Clash=0) | (<>SYS_bo_QuitCalled) | ($_bo_Exit)  //1
		If ($_l_Clash=0)  //23
			SET PROCESS VARIABLE:C370(AA_l_CallBackProcess; MPNUMBER; $_l_MpNumber)
			RESUME PROCESS:C320(AA_l_CallBackProcess)
			Case of   //24
				: ($_bo_isFIles)
					[IDENTIFIERS:16]Number:2:=$_l_MpNumber
					DB_SaveRecord(->[IDENTIFIERS:16])
					UNLOAD RECORD:C212([IDENTIFIERS:16])
					READ ONLY:C145([IDENTIFIERS:16])
					
				: ($_bo_IsFileNos)
					If ([IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1<9000)
						[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1+9000
					End if 
					If (Not:C34($_bo_IsLocked))
						[IDENTIFIERS:16]Number:2:=$_l_MpNumber
						DB_SaveRecord(->[IDENTIFIERS:16])
						UNLOAD RECORD:C212([IDENTIFIERS:16])
						READ ONLY:C145([IDENTIFIERS:16])
					End if 
					DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
					UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
					READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
					
				Else 
					UNLOAD RECORD:C212([IDENTIFIERS:16])
					READ ONLY:C145([IDENTIFIERS:16])
					UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
					READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
					
			End case 
		End if 
		
		CLEAR SEMAPHORE:C144($_t_SemaphoreName3)
		DelayTicks(3*Abs:C99(<>GCUSED))
		$_bo_Exit:=False:C215
		<>GCUSED:=<>GCUSED-1
		
		Repeat   //NG APril 2004 test
			If (Not:C34(ID_bo_GenCodeActivate))
				//DelayTicks (200) Ng Modified may 2008 as possible cause of slight delay-only real  difference to build 60
				DELAY PROCESS:C323(Current process:C322; 60)
			End if 
			PROCESS PROPERTIES:C336(AA_l_CallBackProcess; $_t_processName; $_l_processState; $_l_processTime)
			If ($_l_processState<0) | ($_t_processName#ID_t_ParentProcessName)
				$_bo_Exit:=True:C214
			End if 
			
		Until (ID_bo_GenCodeActivate) | ($_bo_Exit) | (<>SYS_bo_QuitCalled)
		
	Until ($_bo_Exit) | (<>SYS_bo_QuitCalled)
	
End if 
ERR_MethodTrackerReturn("Gen_Code_PROCESS"; $_t_oldMethodName)