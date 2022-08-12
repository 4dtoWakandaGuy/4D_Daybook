//%attributes = {}

If (False:C215)
	//Project Method Name:      AA_GetNextID
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
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_CloseWindow; $_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_OK; $_bo_OpenWindow; $_bo_RunHere; $_bo_Stop; $_bo_TablePointer; $_bo_UseNegative)
	C_BOOLEAN:C305($_bo_UseRandom; $_bo_UseTableNos; $3; SYS_bo_IDCodeActivate)
	C_LONGINT:C283(<>RecNo; $_l_BreakOut; $_l_Clashes; $_l_Count; $_l_DefaultID; $_l_Difference; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_IndexingProcess; $_l_isUnique)
	C_LONGINT:C283($_l_ItemReference; $_l_LastNumber; $_l_OldSpan; $_l_ProcessState; $_l_ProcessTime; $_l_QuantityToGet; $_l_RandomNumber; $_l_RecNumberFIx; $_l_RecordNumber; $_l_Repeats; $_l_SemaphoreTrap)
	C_LONGINT:C283($_l_Span; $_l_StartingNumber; $_l_TableNum2; $_l_TableNumber; $0; $2; ID_l_Parameter4; ID_l_Parameter5; ID_l_Parameter6; RecNo; SYS_l_IDCodeProcess)
	C_POINTER:C301($_ptr_Field; $_ptr_Table2; $1)
	C_TEXT:C284($_t_DefaultValue; $_t_oldMethodName; $_t_ProcessName; $_t_ProcessNameTest; $_t_ProcessNoSTR; $_t_VariableName; $4; DB_t_Methodname; ID_t_Parameter3; SEM_t_GetID; Sem_t_SemaphoreName2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_GetNextID")


DB_t_Methodname:=Current method name:C684
MESSAGES OFF:C175

$_l_QuantityToGet:=1
$_l_StartingNumber:=0
If (Count parameters:C259>=2)
	$_l_StartingNumber:=$2
	
	If ($2<0)
		$_l_QuantityToGet:=Abs:C99($2)
		$_l_StartingNumber:=0
	End if 
End if 
$0:=0
If (Count parameters:C259>=1)
	
	If (GenValidatePointer($1))
		
		//If (◊ConUsers>0)|(Application type<4)`AA_GetNextID
		
		//gets the next ID from the numbers table
		//First get the context
		$_bo_TablePointer:=False:C215
		$_bo_UseRandom:=False:C215
		Case of 
			: (Trigger level:C398=0) & (Not:C34(In transaction:C397))
				
				$_bo_OpenWindow:=True:C214
				$_bo_CloseWindow:=False:C215
				Sem_t_SemaphoreName2:=""
				If (Is a variable:C294($1))
					If (Type:C295($1->)=0) | (Type:C295($1->)=2)
						$_t_VariableName:=$1->
					Else 
						RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					End if 
					Sem_t_SemaphoreName2:="Busy_"+$_t_VariableName
				Else 
					$_l_TableNumber:=Table:C252($1)
					Sem_t_SemaphoreName2:="Busy_"+String:C10($_l_TableNumber)
				End if 
				$_l_Count:=0
				While (Semaphore:C143(Sem_t_SemaphoreName2)) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_Count<1000)
					$_l_Count:=$_l_Count+1
					DelayTicks(2*$_l_Count)
					If (Application type:C494#4D Server:K5:6) & ($_l_Count>50)
						//`If ($_bo_OpenWindow)
						//Open window(30;100;200;120;-1984)
						//$_bo_OpenWindow:=False
						//$_bo_CloseWindow:=True
						//End if
						ERASE WINDOW:C160
						//MESSAGE("Waiting for record unlocked Flag")
					End if 
				End while 
				//If ($_bo_CloseWindow)
				//CLOSE WINDOW
				//End if
				If ($_l_Count>=1000)
					$_bo_UseRandom:=True:C214
				End if 
				$_bo_RunHere:=True:C214
			: (Trigger level:C398=0) & (In transaction:C397)
				
				$_bo_OpenWindow:=True:C214
				$_bo_CloseWindow:=False:C215
				$_l_Count:=0
				If (Is a variable:C294($1))
					If (Type:C295($1->)=0) | (Type:C295($1->)=2)
						$_t_VariableName:=$1->
					Else 
						RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					End if 
					Sem_t_SemaphoreName2:="Busy_"+$_t_VariableName
				Else 
					$_l_TableNumber:=Table:C252($1)
					Sem_t_SemaphoreName2:="Busy_"+String:C10($_l_TableNumber)
				End if 
				$_l_Count:=0
				If (False:C215)  //Dont use a semaphore here-it will be handled in the process
					While (Semaphore:C143(Sem_t_SemaphoreName2)) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_Count<1000)
						$_l_Count:=$_l_Count+1
						DelayTicks(2*$_l_Count)
						If (Application type:C494#4D Server:K5:6) & ($_l_Count>50)
							//If ($_bo_OpenWindow)
							//Open window(30;100;200;120;1984)
							//$_bo_OpenWindow:=False
							//$_bo_CloseWindow:=True
							//End if
							//ERASE WINDOW
							//MESSAGE("Waiting for record unlocked Flag")
						End if 
					End while 
					//If ($_bo_CloseWindow)
					//CLOSE WINDOW
					//End if
					If ($_l_Count>=1000)
						$_bo_UseRandom:=True:C214
					End if 
				End if 
				$_bo_RunHere:=False:C215
			: (Trigger level:C398>0) & (In transaction:C397)
				If (Test semaphore:C652("SavingRecord"))
					$_bo_RunHere:=False:C215
				Else 
					$_bo_RunHere:=True:C214
				End if 
			Else 
				$_bo_RunHere:=True:C214
		End case 
		If ($_bo_RunHere)
			
			//Here check record Locking
			READ WRITE:C146([IDENTIFIERS:16])
			If (Is a variable:C294($1)=True:C214)  // if it's a variableä
				//Modified for v1.1.2 pointer to longint var
				//reference is name of var or pointer to string var
				//reference is content of var
				If (Count parameters:C259<4)
					If (Type:C295($1->)=0) | (Type:C295($1->)=2)
						$_t_VariableName:=$1->
					Else 
						RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					End if 
				Else 
					$_t_VariableName:=$4
				End if 
				SEM_t_GetID:="ID_"+$_t_VariableName
				$_l_SemaphoreTrap:=0
				While (Semaphore:C143(SEM_t_GetID)) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_SemaphoreTrap<1000)
					$_l_SemaphoreTrap:=$_l_SemaphoreTrap+1
					DelayTicks(2*$_l_SemaphoreTrap)
					
				End while 
				If ($_t_VariableName#"")
					$_bo_Stop:=False:C215
					QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]X_Reference_Contextual:4=$_t_VariableName)
					
					ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2; <)
					$_l_LastNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
					//these are additional numbers created because the record was locked
					//TRACE  //unlike other uses of this table these are not PRE-CREATED
					QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]XRef_Contextual:9=$_t_VariableName; *)
					QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]XRef_FIELD:8=0; *)  // search using the identifier
					QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1=0)
					
					If (Records in selection:C76([IDENTIFIERS:16])>1)
						$_l_Count:=Records in selection:C76([IDENTIFIERS:16])
						ORDER BY:C49([IDENTIFIERS:16]; [IDENTIFIERS:16]Number:2; >)
						REDUCE SELECTION:C351([IDENTIFIERS:16]; $_l_Count-1)
						DELETE SELECTION:C66([IDENTIFIERS:16])
						QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]XRef_Contextual:9=$_t_VariableName)
					End if 
				Else 
					RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					Gen_Alert("Problem with Var"+$_t_VariableName+String:C10($_l_TableNumber)+" "+String:C10($_l_FieldNumber))
					$_bo_Stop:=True:C214
					
				End if 
				If (Not:C34($_bo_Stop))
					If ($_l_LastNumber>$_l_StartingNumber)
						$_l_StartingNumber:=$_l_LastNumber
					End if 
					$_bo_UseTableNos:=False:C215
					If (Records in selection:C76([IDENTIFIERS:16])=0)
						CREATE RECORD:C68([IDENTIFIERS:16])
						[IDENTIFIERS:16]XRef_Contextual:9:=$_t_VariableName
						If (Count parameters:C259>=2)  //SET THE NUMBER FIRST
							[IDENTIFIERS:16]Number:2:=$_l_StartingNumber
							// $_l_LastNumber:=$_l_StartingNumber
						End if 
						DB_SaveRecord(->[IDENTIFIERS:16])
						$_bo_OK:=False:C215
						$_l_BreakOut:=0  //Added NG June 2004
						$_l_SemaphoreTrap:=0
						Repeat 
							
							While (Semaphore:C143(SEM_t_GetID)) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_SemaphoreTrap<1000)
								$_l_SemaphoreTrap:=$_l_SemaphoreTrap+1
								DelayTicks(2*$_l_SemaphoreTrap)
								
							End while 
							//If it drops out because of the semaphore trap the
							//record will be locked so it will drop into the breakout(eventually)
							$_bo_OK:=Check_Locked(->[IDENTIFIERS:16]; 0)
							If (Not:C34($_bo_OK))
								If (False:C215)
									If ([IDENTIFIERS:16]XRef_Contextual:9#$_t_VariableName)  // search using the identifier
										QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]XRef_Contextual:9=$_t_VariableName)  // search using the identifier
									End if   //we will create a number in the FILE NOS TABLE
									READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
									CREATE RECORD:C68([IDENTIFIERS_MULTI_NUMBERS:94])
									[IDENTIFIERS_MULTI_NUMBERS:94]X_Reference_Contextual:4:=$_t_VariableName
									If ($_l_LastNumber=0)
										[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=[IDENTIFIERS:16]Number:2+1
									Else 
										[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=$_l_LastNumber+1
									End if 
									$_bo_UseTableNos:=True:C214
									DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])  //dont forget to unload at the end!
									$_bo_OK:=True:C214
									CLEAR SEMAPHORE:C144(SEM_t_GetID)
									//3)
								End if 
								$_l_BreakOut:=$_l_BreakOut+1
								If ($_l_BreakOut>1000)
									$_bo_UseRandom:=True:C214
								End if 
							Else   //we can use the files record so kill the 'subrecords'
								If ($_l_LastNumber>0)
									If ($_l_LastNumber<[IDENTIFIERS:16]Number:2)
										[IDENTIFIERS:16]Number:2:=$_l_LastNumber
									End if 
									READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
									QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]X_Reference_Contextual:4=$_t_VariableName; *)
									QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  & ; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2<=$_l_LastNumber)
									DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
									READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])  //remember that will not have deleted any locked records!
								End if 
								$_bo_UseTableNos:=False:C215
							End if 
						Until ($_bo_OK) | (<>SYS_bo_QuitCalled)
					Else 
						$_bo_OK:=False:C215
						$_l_BreakOut:=0
						Repeat 
							$_l_SemaphoreTrap:=0
							While (Semaphore:C143(SEM_t_GetID)) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_SemaphoreTrap<1000)
								$_l_SemaphoreTrap:=$_l_SemaphoreTrap+1
								DelayTicks(2*$_l_SemaphoreTrap)
								
								
							End while 
							$_bo_OK:=Check_Locked(->[IDENTIFIERS:16]; 0)
							If (Not:C34($_bo_OK))
								If (False:C215)
									If ([IDENTIFIERS:16]XRef_Contextual:9#$_t_VariableName)  // search using the identifier
										QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]XRef_Contextual:9=$_t_VariableName)  // search using the identifier
									End if 
									If ([IDENTIFIERS:16]XRef_Contextual:9#$_t_VariableName)  // search using the identifier
										QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]XRef_Contextual:9=$_t_VariableName)  // search using the identifier
									End if   //we will create a number in the FILE NOS TABLE
									READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
									CREATE RECORD:C68([IDENTIFIERS_MULTI_NUMBERS:94])
									[IDENTIFIERS_MULTI_NUMBERS:94]X_Reference_Contextual:4:=$_t_VariableName
									If ($_l_LastNumber=0)
										[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=[IDENTIFIERS:16]Number:2+1
									Else 
										[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=$_l_LastNumber+1
									End if 
									$_bo_UseTableNos:=True:C214
									DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])  //dont forget to unload at the end!
									$_bo_OK:=True:C214
									CLEAR SEMAPHORE:C144(SEM_t_GetID)
									//DelayTicks (3)
								End if 
								$_l_BreakOut:=$_l_BreakOut+1
								If ($_l_BreakOut>1000)
									$_bo_UseRandom:=True:C214
								End if 
							Else   //we can use the files record so kill the 'subrecords'
								If ($_l_LastNumber>0)
									If ($_l_LastNumber<[IDENTIFIERS:16]Number:2)
										[IDENTIFIERS:16]Number:2:=$_l_LastNumber
									End if 
									READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
									QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]X_Reference_Contextual:4=$_t_VariableName; *)
									QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  & ; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2<=$_l_LastNumber)
									DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
									READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
									//remember that will not have deleted any locked records!
								End if 
								$_bo_UseTableNos:=False:C215
							End if 
						Until ($_bo_OK) | (<>SYS_bo_QuitCalled) | ($_bo_UseRandom)
					End if 
					If (Not:C34(<>SYS_bo_QuitCalled))
						If (Count parameters:C259<3)
							Case of 
								: ($_bo_UseRandom)
									$0:=(Random:C100%100000)+10
								: ($_bo_UseTableNos)
									$0:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2+($_l_QuantityToGet)-1  //because the number is already the NEXT number
								Else 
									$0:=[IDENTIFIERS:16]Number:2+$_l_QuantityToGet
							End case 
						Else 
							If ($3)  //this is a process(see below-in transaction)
								Case of 
									: ($_bo_UseRandom)
										<>RecNo:=(Random:C100%100000)+10
									: ($_bo_UseTableNos)
										<>RecNo:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2+($_l_QuantityToGet)-1  //because the number is already the NEXT number
									Else 
										<>RecNo:=[IDENTIFIERS:16]Number:2+$_l_QuantityToGet
								End case 
							Else 
								Case of 
									: ($_bo_UseRandom)
										$0:=(Random:C100%100000)+10
									: ($_bo_UseTableNos)
										$0:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2+($_l_QuantityToGet)-1  //because the number is already the NEXT number
									Else 
										$0:=[IDENTIFIERS:16]Number:2+$_l_QuantityToGet
								End case 
							End if 
						End if 
						Case of 
							: ($_bo_UseRandom)
								
							: ($_bo_UseTableNos)
								[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2+($_l_QuantityToGet)-1
								DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
								UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
								READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
							Else 
								[IDENTIFIERS:16]Number:2:=[IDENTIFIERS:16]Number:2+$_l_QuantityToGet
								DB_SaveRecord(->[IDENTIFIERS:16])
								UNLOAD RECORD:C212([IDENTIFIERS:16])
								READ ONLY:C145([IDENTIFIERS:16])
						End case 
						
					End if 
				End if 
				CLEAR SEMAPHORE:C144(SEM_t_GetID)
				//DelayTicks (3)
			Else   // äit's a pointer to a field
				$_bo_TablePointer:=True:C214
				
				$_bo_UseNegative:=False:C215
				$_l_TableNumber:=Table:C252($1) << 24  //shift the number 24 bits to the left
				If ($_l_TableNumber<0)
					$_bo_UseNegative:=True:C214
					//This is after table 127... so the number is an overflow. this will work up to table 254..which is enough for daybook
					$_l_Difference:=Table:C252($1)-127
					$_l_TableNumber:=$_l_Difference << 24  //shift the number 24 bits to the left
					
					
				End if 
				$_l_FieldNumber:=Field:C253($1)
				$_l_ItemReference:=$_l_TableNumber | $_l_FieldNumber
				If ($_bo_UseNegative)
					$_l_ItemReference:=0-$_l_ItemReference
				End if 
				
				SEM_t_GetID:="ID_"+String:C10($_l_ItemReference)
				$_l_SemaphoreTrap:=0
				While (Semaphore:C143(SEM_t_GetID)) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_SemaphoreTrap<1000)
					$_l_SemaphoreTrap:=$_l_SemaphoreTrap+1
					DelayTicks(2*$_l_SemaphoreTrap)
					
				End while 
				If ($_l_ItemReference#0)
					QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]X_Reference_Field:3=$_l_ItemReference)
					ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2; <)
					$_l_LastNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
					//these are additional numbers created because the record was locked
					//unlike other uses of this table these are not PRE-CREATED
					If ($_l_LastNumber>$_l_StartingNumber)
						$_l_StartingNumber:=$_l_LastNumber
					End if 
					$_bo_UseTableNos:=False:C215
					If (Not:C34(<>SYS_bo_QuitCalled))
						$_bo_Stop:=False:C215
						If ([IDENTIFIERS:16]XRef_FIELD:8#$_l_ItemReference)
							QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]XRef_FIELD:8=$_l_ItemReference; *)
							QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]XRef_Contextual:9=""; *)
							QUERY:C277([IDENTIFIERS:16];  & ; [IDENTIFIERS:16]Table_Number:1=0)
							
							If (Records in selection:C76([IDENTIFIERS:16])>1)
								$_l_Count:=Records in selection:C76([IDENTIFIERS:16])
								ORDER BY:C49([IDENTIFIERS:16]; [IDENTIFIERS:16]Number:2; >)
								REDUCE SELECTION:C351([IDENTIFIERS:16]; $_l_Count-1)
								DELETE SELECTION:C66([IDENTIFIERS:16])
								QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]XRef_FIELD:8=$_l_ItemReference)
							End if 
							
							If (Not:C34($_bo_Stop))
								
								
								If (Records in selection:C76([IDENTIFIERS:16])=0)
									CREATE RECORD:C68([IDENTIFIERS:16])
									[IDENTIFIERS:16]XRef_FIELD:8:=$_l_ItemReference
									If (Count parameters:C259>=2)
										[IDENTIFIERS:16]Number:2:=$_l_StartingNumber
									End if 
									DB_SaveRecord(->[IDENTIFIERS:16])
									$_bo_OK:=False:C215
									$_l_BreakOut:=0
									Repeat 
										$_l_SemaphoreTrap:=0
										While (Semaphore:C143(SEM_t_GetID)) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_SemaphoreTrap<1000)
											If ($_l_SemaphoreTrap>10)
												//MESSAGE("Called from"+$_t_oldMethodName)
											End if 
											DelayTicks(2*$_l_SemaphoreTrap)
											$_l_SemaphoreTrap:=$_l_SemaphoreTrap+1
										End while 
										$_bo_OK:=Check_Locked(->[IDENTIFIERS:16]; 0)
										If (Not:C34($_bo_OK))
											If (False:C215)
												If ([IDENTIFIERS:16]XRef_FIELD:8=$_l_ItemReference)  // search using the identifier
													QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]XRef_FIELD:8=$_l_ItemReference)
												End if   //we will create a number in the FILE NOS TABLE
												READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
												CREATE RECORD:C68([IDENTIFIERS_MULTI_NUMBERS:94])
												[IDENTIFIERS:16]XRef_FIELD:8:=$_l_ItemReference
												If ($_l_LastNumber=0)
													[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=[IDENTIFIERS:16]Number:2+1
												Else 
													[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=$_l_LastNumber+1
												End if 
												$_bo_UseTableNos:=True:C214
												DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])  //dont forget to unload at the end!
												$_bo_OK:=True:C214
												CLEAR SEMAPHORE:C144(SEM_t_GetID)
												//DelayTicks (2)
											End if 
											$_l_BreakOut:=$_l_BreakOut+1
											If ($_l_BreakOut>1000)
												$_bo_UseRandom:=True:C214
											End if 
											$_bo_OK:=True:C214
										Else   //we can use the files record so kill the 'subrecords'
											If ($_l_LastNumber>0)
												If ($_l_LastNumber<[IDENTIFIERS:16]Number:2)
													[IDENTIFIERS:16]Number:2:=$_l_LastNumber
												End if 
												READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
												QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]X_Reference_Field:3=$_l_ItemReference; *)
												QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  & ; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2<=$_l_LastNumber)
												DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
												READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])  //remember that will not have deleted any locked records!
											End if 
											$_bo_UseTableNos:=False:C215
										End if 
									Until ($_bo_OK) | (<>SYS_bo_QuitCalled) | ($_bo_UseRandom)
								Else 
									$_bo_OK:=False:C215
									$_l_BreakOut:=0
									Repeat 
										$_l_SemaphoreTrap:=0
										While (Semaphore:C143(SEM_t_GetID)) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_SemaphoreTrap<1000)
											$_l_SemaphoreTrap:=$_l_SemaphoreTrap+1
											DelayTicks(2*$_l_SemaphoreTrap)
											
										End while 
										$_bo_OK:=Check_Locked(->[IDENTIFIERS:16]; 0)
										If (Not:C34($_bo_OK))
											
											$_l_BreakOut:=$_l_BreakOut+1
											If ($_l_BreakOut>1000)
												$_bo_UseRandom:=True:C214
											End if 
											$_bo_OK:=True:C214
										Else   //we can use the files record so kill the 'subrecords'
											If ($_l_LastNumber>0)
												If ($_l_LastNumber<[IDENTIFIERS:16]Number:2)
													[IDENTIFIERS:16]Number:2:=$_l_LastNumber
												End if 
												READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
												QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]X_Reference_Field:3=$_l_ItemReference)
												QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  & ; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2<=$_l_LastNumber)
												DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
												READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])  //remember that will not have deleted any locked records!
											End if 
											$_bo_UseTableNos:=False:C215
										End if 
									Until ($_bo_OK) | (<>SYS_bo_QuitCalled) | ($_bo_UseRandom)
								End if 
							End if 
						End if 
						If (Not:C34(<>SYS_bo_QuitCalled)) & (Not:C34($_bo_Stop))
							If ($_bo_UseRandom)
								$_l_RandomNumber:=(Random:C100%100000)+10
							End if 
							Repeat 
								IDLE:C311  //The number returned will contain the file and reference and the record reference
								$_l_TableNumber:=Table:C252($1) << 24  //shift the number 24 bits to the left
								$_bo_UseNegative:=False:C215
								If ($_l_TableNumber<0)
									$_bo_UseNegative:=True:C214
									$_l_Difference:=Table:C252($1)-127
									$_l_TableNumber:=$_l_Difference << 24  //shift the number 24 bits to the left
								End if 
								
								If ($_l_RecNumberFIx>0)
									Case of 
										: ($_bo_UseRandom)
											$_l_RecordNumber:=$_l_RecNumberFIx
										: ($_bo_UseTableNos)
											[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=$_l_RecNumberFIx
										Else 
											[IDENTIFIERS:16]Number:2:=$_l_RecNumberFIx
									End case 
								End if 
								Case of 
									: ($_bo_UseRandom)
										$_l_RecordNumber:=$_l_RandomNumber+$_l_QuantityToGet-1
										If ($_l_RecordNumber<$_l_StartingNumber)
											$_l_RecordNumber:=$_l_StartingNumber
										End if 
									: ($_bo_UseTableNos)
										$_l_RecordNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2+$_l_QuantityToGet-1
										If ($_l_RecordNumber<$_l_StartingNumber)
											$_l_RecordNumber:=$_l_StartingNumber
										End if 
										[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2+$_l_QuantityToGet-1
									Else 
										$_l_RecordNumber:=[IDENTIFIERS:16]Number:2+$_l_QuantityToGet
										If ($_l_RecordNumber<$_l_StartingNumber)
											$_l_RecordNumber:=$_l_StartingNumber
										End if 
										[IDENTIFIERS:16]Number:2:=[IDENTIFIERS:16]Number:2+$_l_QuantityToGet
								End case 
								If (Count parameters:C259<3)
									Case of 
										: ($_bo_UseRandom)
										: ($_bo_UseTableNos)
											DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
										Else 
											DB_SaveRecord(->[IDENTIFIERS:16])
									End case 
								Else 
									If (Not:C34($3))
										Case of 
											: ($_bo_UseRandom)
											: ($_bo_UseTableNos)
												DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
											Else 
												
												DB_SaveRecord(->[IDENTIFIERS:16])
										End case 
									End if 
								End if 
								
								$_l_isUnique:=0
								If (Count parameters:C259>=1)
									If (Not:C34(Is nil pointer:C315($1)))
										$_l_TableNum2:=Table:C252($1)
										$_l_FieldNumber:=Field:C253($1)
										
										$_ptr_Table2:=Table:C252($_l_TableNum2)
										$_ptr_Field:=Field:C253($_l_TableNum2; $_l_FieldNumber)
										If (Records in table:C83($_ptr_Table2->)>0)
											GET FIELD PROPERTIES:C258($1; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
											If (Not:C34($_bo_FieldIndexed))
												$_l_IndexingProcess:=Execute on server:C373("AA_IndexoneField"; DB_ProcessMemoryinit(1); "Set Field Index"; $_l_TableNum2; $_l_FieldNumber; *)
											End if 
											Case of 
												: ($_l_FieldType=9) | ($_l_FieldType=8) | ($_l_FieldType=1)
													If (Not:C34($_bo_FieldIndexed))
														SET QUERY DESTINATION:C396(3; $_l_isUnique)
														QUERY:C277($_ptr_Table2->; $1->=$_l_RecordNumber)
														SET QUERY DESTINATION:C396(0)
													Else 
														$_l_isUnique:=Find in field:C653($_ptr_Field->; $_l_RecordNumber)
														If ($_l_isUnique<0)
															$_l_isUnique:=0
														End if 
														
													End if 
												: ($_l_FieldType=2) | ($_l_FieldType=0)
													If (Not:C34($_bo_FieldIndexed))
														SET QUERY DESTINATION:C396(3; $_l_isUnique)
														QUERY:C277($_ptr_Table2->; $1->=String:C10($_l_RecordNumber))
														SET QUERY DESTINATION:C396(0)
													Else 
														$_t_ProcessNoSTR:=String:C10($_l_RecordNumber)
														$_l_isUnique:=Find in field:C653($_ptr_Field->; $_t_ProcessNoSTR)
														If ($_l_isUnique<0)
															$_l_isUnique:=0
														End if 
													End if 
											End case 
										End if 
									End if 
								End if 
								If ($_l_isUnique>0)
									$_l_Clashes:=1
									
									$_l_Span:=1024
									Repeat 
										Repeat 
											IDLE:C311
											$_l_RecordNumber:=$_l_RecordNumber+$_l_Span
											If (Records in table:C83($_ptr_Table2->)>0)
												Case of 
													: ($_l_FieldType=9) | ($_l_FieldType=8) | ($_l_FieldType=1)
														If (Not:C34($_bo_FieldIndexed))
															SET QUERY DESTINATION:C396(3; $_l_isUnique)
															QUERY:C277($_ptr_Table2->; $1->=$_l_RecordNumber)
															SET QUERY DESTINATION:C396(0)
														Else 
															$_l_isUnique:=Find in field:C653($_ptr_Field->; $_l_RecordNumber)
															If ($_l_isUnique<0)
																$_l_isUnique:=0
															End if 
														End if 
													: ($_l_FieldType=2) | ($_l_FieldType=0)
														If (Not:C34($_bo_FieldIndexed))
															SET QUERY DESTINATION:C396(3; $_l_isUnique)
															QUERY:C277($_ptr_Table2->; $1->=String:C10($_l_RecordNumber))
															SET QUERY DESTINATION:C396(0)
														Else 
															$_t_ProcessNoSTR:=String:C10($_l_RecordNumber)
															$_l_isUnique:=Find in field:C653($_ptr_Field->; $_t_ProcessNoSTR)
															If ($_l_isUnique<0)
																$_l_isUnique:=0
															End if 
														End if 
												End case 
											End if 
											If ($_l_isUnique>0)
												$_l_Clashes:=$_l_Clashes+1
											End if 
										Until ($_l_isUnique=0) | (<>SYS_bo_QuitCalled)
										$_l_OldSpan:=$_l_Span
										$_l_Span:=Int:C8($_l_Span/2)
										If ($_l_Span>1)
											If ($_l_Clashes>0)
												$_l_RecordNumber:=$_l_RecordNumber-$_l_OldSpan
											End if 
										End if 
									Until ($_l_Span<=1) | (<>SYS_bo_QuitCalled)
									If (Not:C34(<>SYS_bo_QuitCalled))  //go to the last clashing number
										$_l_RecordNumber:=$_l_RecordNumber-1
										If (Records in table:C83($_ptr_Table2->)>0)
											Case of 
												: ($_l_FieldType=9) | ($_l_FieldType=8) | ($_l_FieldType=1)
													If (Not:C34($_bo_FieldIndexed))
														SET QUERY DESTINATION:C396(3; $_l_isUnique)
														QUERY:C277($_ptr_Table2->; $1->=$_l_RecordNumber)
														SET QUERY DESTINATION:C396(0)
													Else 
														$_l_isUnique:=Find in field:C653($1->; $_l_RecordNumber)
														If ($_l_isUnique<0)
															$_l_isUnique:=0
														End if 
													End if 
												: ($_l_FieldType=2) | ($_l_FieldType=0)
													If (Not:C34($_bo_FieldIndexed))
														SET QUERY DESTINATION:C396(3; $_l_isUnique)
														QUERY:C277($_ptr_Table2->; $1->=String:C10($_l_RecordNumber))
														SET QUERY DESTINATION:C396(0)
													Else 
														$_t_ProcessNoSTR:=String:C10($_l_RecordNumber)
														$_l_isUnique:=Find in field:C653($1->; $_t_ProcessNoSTR)
														If ($_l_isUnique<0)
															$_l_isUnique:=0
														End if 
													End if 
											End case 
										End if 
										$_l_RecNumberFIx:=$_l_RecordNumber
										//this will clash but will then go
										//and get the next number and update the [files]
									End if 
								End if 
							Until ($_l_isUnique=0) | (<>SYS_bo_QuitCalled)
						End if 
						If (Not:C34(<>SYS_bo_QuitCalled)) & (Not:C34($_bo_Stop))
							If ($_l_RecNumberFIx>0)
								Case of 
									: ($_bo_UseRandom)
									: ($_bo_UseTableNos)
										[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=$_l_RecNumberFIx
									Else 
										[IDENTIFIERS:16]Number:2:=$_l_RecNumberFIx
								End case 
							End if 
							If (Count parameters:C259<3)
								$0:=$_l_RecordNumber
							Else 
								If ($3)  //this is a process(see below-in transaction)
									<>RecNo:=$_l_RecordNumber
									Case of 
										: ($_bo_UseRandom)
										: ($_bo_UseTableNos)
											DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
										Else 
											DB_SaveRecord(->[IDENTIFIERS:16])
									End case 
								Else 
									$0:=$_l_RecordNumber
								End if 
							End if 
							
						End if 
						If ($_bo_UseTableNos)
							UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
							READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
						Else 
							UNLOAD RECORD:C212([IDENTIFIERS:16])
							READ ONLY:C145([IDENTIFIERS:16])
						End if 
					End if 
				Else 
					Gen_Alert("Problem with file reference for table "+String:C10(Table:C252($1)))
					$_bo_Stop:=True:C214
				End if 
			End if 
			UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
			UNLOAD RECORD:C212([IDENTIFIERS:16])
			READ ONLY:C145([IDENTIFIERS:16])
			READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
			CLEAR SEMAPHORE:C144(SEM_t_GetID)
			CLEAR SEMAPHORE:C144(Sem_t_SemaphoreName2)
			//DelayTicks (2)
			
		Else 
			//TRACE
			//in a transaction this would lock up because the record would not be released
			//so we need to run a process and retreive the number that way
			//but that causes a problem if this is running from a trigger
			If (Is a variable:C294($1)=True:C214)  // if it's a variableä
				//modified for version 1.1.2
				If (Type:C295($1->)=0) | (Type:C295($1->)=2)
					$_t_VariableName:=$1->
				Else 
					RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
				End if 
				SEM_t_GetID:="ID_"+$_t_VariableName+"P"
			Else 
				$_bo_UseNegative:=False:C215
				$_l_TableNumber:=Table:C252($1) << 24  //shift the number 24 bits to the left
				If ($_l_TableNumber<0)
					$_bo_UseNegative:=True:C214
					$_l_Difference:=Table:C252($1)-127
					$_l_TableNumber:=$_l_Difference << 24  //shift the number 24 bits to the left
				End if 
				$_l_FieldNumber:=Field:C253($1)
				$_l_ItemReference:=$_l_TableNumber | $_l_FieldNumber
				If ($_bo_UseNegative)
					$_l_ItemReference:=0-$_l_ItemReference
				End if 
				SEM_t_GetID:="ID_"+String:C10($_l_ItemReference)+"P"
			End if 
			$_l_SemaphoreTrap:=0
			While (Semaphore:C143(SEM_t_GetID)) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_SemaphoreTrap<1000)
				$_l_SemaphoreTrap:=$_l_SemaphoreTrap+1
				DelayTicks(2*$_l_SemaphoreTrap)
				
			End while 
			
			If (Not:C34(<>SYS_bo_QuitCalled))
				RecNo:=0
				If (Is a variable:C294($1)=True:C214)  // if it's a variableä
					
					If (Type:C295($1->)=0) | (Type:C295($1->)=2)
						$_t_DefaultValue:=$1->
					Else 
						RESOLVE POINTER:C394($1; $_t_DefaultValue; $_l_TableNumber; $_l_FieldNumber)
					End if 
					$_l_DefaultID:=0
					If (Count parameters:C259>=2)
						$_l_StartingNumber:=$2
						If ($2<0)
							$_l_QuantityToGet:=Abs:C99($2)
							$_l_StartingNumber:=0
						End if 
					End if 
					If (SYS_l_IDCodeProcess>0)
						PROCESS PROPERTIES:C336(SYS_l_IDCodeProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
						$_t_ProcessNameTest:="Record ID Server for process"+String:C10(Current process:C322)
						If ($_t_ProcessName#$_t_ProcessNameTest)
							SYS_l_IDCodeProcess:=0
						End if 
					End if 
					If (SYS_l_IDCodeProcess>0)
						SET PROCESS VARIABLE:C370(SYS_l_IDCodeProcess; ID_t_Parameter3; $_t_DefaultValue)
						SET PROCESS VARIABLE:C370(SYS_l_IDCodeProcess; ID_l_Parameter4; $_l_DefaultID)
						SET PROCESS VARIABLE:C370(SYS_l_IDCodeProcess; ID_l_Parameter5; $_l_DefaultID)
						SET PROCESS VARIABLE:C370(SYS_l_IDCodeProcess; ID_l_Parameter6; $_l_StartingNumber)
						If ($_l_QuantityToGet>0)
							SET PROCESS VARIABLE:C370(SYS_l_IDCodeProcess; ID_l_Parameter6; -$_l_QuantityToGet)
						End if 
						SET PROCESS VARIABLE:C370(SYS_l_IDCodeProcess; SYS_bo_IDCodeActivate; True:C214)
						RESUME PROCESS:C320(SYS_l_IDCodeProcess)
					Else 
						If ($_l_QuantityToGet>0)
							$_l_StartingNumber:=-$_l_QuantityToGet
						End if 
						$_t_ProcessNoSTR:="RecNo"
						
						SYS_l_IDCodeProcess:=New process:C317("AA_GetNextIDINPROCESS"; DB_ProcessMemoryinit(4); "Record ID Server for process"+String:C10(Current process:C322); Current process:C322; $_t_ProcessNoSTR; $_t_DefaultValue; $_l_DefaultID; $_l_DefaultID; $_l_StartingNumber; True:C214)
					End if 
				Else 
					$_l_TableNum2:=Table:C252($1)
					$_l_FieldNumber:=Field:C253($1)
					$_t_DefaultValue:=""
					If (Count parameters:C259>=2)
						$_l_StartingNumber:=$2
						If ($2<0)
							$_l_QuantityToGet:=Abs:C99($2)
							$_l_StartingNumber:=0
						End if 
					End if 
					If (SYS_l_IDCodeProcess>0)
						PROCESS PROPERTIES:C336(SYS_l_IDCodeProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
						$_t_ProcessNameTest:="Record ID Server for process"+String:C10(Current process:C322)
						If ($_t_ProcessName#$_t_ProcessNameTest)
							SYS_l_IDCodeProcess:=0
						End if 
					End if 
					If (SYS_l_IDCodeProcess>0)
						//SET PROCESS VARIABLE(SYS_l_IDCodeProcess;ID_l_CallBackProcess;Current process)
						SET PROCESS VARIABLE:C370(SYS_l_IDCodeProcess; ID_t_Parameter3; $_t_DefaultValue)
						SET PROCESS VARIABLE:C370(SYS_l_IDCodeProcess; ID_l_Parameter4; $_l_TableNum2)
						SET PROCESS VARIABLE:C370(SYS_l_IDCodeProcess; ID_l_Parameter5; $_l_FieldNumber)
						SET PROCESS VARIABLE:C370(SYS_l_IDCodeProcess; ID_l_Parameter6; $_l_StartingNumber)
						If ($_l_QuantityToGet>0)
							SET PROCESS VARIABLE:C370(SYS_l_IDCodeProcess; ID_l_Parameter6; -$_l_QuantityToGet)
						End if 
						SET PROCESS VARIABLE:C370(SYS_l_IDCodeProcess; SYS_bo_IDCodeActivate; True:C214)
						RESUME PROCESS:C320(SYS_l_IDCodeProcess)
					Else 
						If ($_l_QuantityToGet>0)
							$_l_StartingNumber:=-$_l_QuantityToGet
						End if 
						$_t_ProcessNoSTR:="RecNo"
						
						SYS_l_IDCodeProcess:=New process:C317("AA_GetNextIDINPROCESS"; DB_ProcessMemoryinit(4); "Record ID Server for process"+String:C10(Current process:C322); Current process:C322; $_t_ProcessNoSTR; $_t_DefaultValue; $_l_TableNum2; $_l_FieldNumber; $_l_StartingNumber; True:C214)
					End if 
				End if 
				$_l_Repeats:=0
				Repeat 
					IDLE:C311
					$_l_Repeats:=$_l_Repeats+1
					$_l_ProcessState:=Process state:C330(SYS_l_IDCodeProcess)
					If ($_l_Repeats<1000)
						If ($_l_ProcessState>=0) & (RecNo=0)
							DelayTicks(1*$_l_Repeats)
							RESUME PROCESS:C320(SYS_l_IDCodeProcess)
						End if 
						$_l_ProcessState:=Process state:C330(SYS_l_IDCodeProcess)
						If ($_l_ProcessState<0) & (RecNo=0)  //restart it
							If (Is a variable:C294($1)=True:C214)  // if it's a variable
								$_t_ProcessNoSTR:="RecNo"
								If ($_l_QuantityToGet>0)
									$_l_StartingNumber:=-$_l_QuantityToGet
								End if 
								SYS_l_IDCodeProcess:=New process:C317("AA_GetNextIDINPROCESS"; DB_ProcessMemoryinit(4); "Record ID Server for process"+String:C10(Current process:C322); Current process:C322; $_t_ProcessNoSTR; $_t_DefaultValue; $_l_TableNum2; $_l_FieldNumber; $_l_StartingNumber; True:C214)
							Else 
								If ($_l_QuantityToGet>0)
									$_l_StartingNumber:=-$_l_QuantityToGet
								End if 
								
								$_t_ProcessNoSTR:="RecNo"
								SYS_l_IDCodeProcess:=New process:C317("AA_GetNextIDINPROCESS"; DB_ProcessMemoryinit(4); "Record ID Server for process"+String:C10(Current process:C322); Current process:C322; $_t_ProcessNoSTR; $_t_DefaultValue; $_l_TableNum2; $_l_FieldNumber; $_l_StartingNumber; True:C214)
							End if 
						End if 
					Else   //at this point we will give up
						RecNo:=(Random:C100%100000)+10
					End if 
				Until ($_l_ProcessState<0) | (RecNo>0) | (<>SYS_bo_QuitCalled)
			End if 
			CLEAR SEMAPHORE:C144(SEM_t_GetID)
			CLEAR SEMAPHORE:C144(Sem_t_SemaphoreName2)
			//DelayTicks (2)
			$0:=RecNo
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("AA_GetNextID"; $_t_oldMethodName)
