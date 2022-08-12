//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_Datacheckunique
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/06/2010 13:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_ReloadPrefs; <>SYS_bo_QuitCalled; $_bo_indexed; $_bo_unique; $5; $6)
	C_LONGINT:C283($_l_CountRecords; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_Index; $_l_QueryVariable; $_l_RecordNumber; $_l_RecordNumber2; $_l_StringLength; $_l_TableNumber; $_l_Value)
	C_LONGINT:C283($1; $2; $3; $4; BD_l_recordIdent)
	C_REAL:C285($_r_FieldValueNumber)
	C_TEXT:C284($_t_Character; $_t_FieldValueSTR; $_t_Number1; $_t_Number2; $_t_oldMethodName; $_t_PtrSTR; $_t_String; $_t_String2; $_t_Value)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_Datacheckunique")
$_l_TableNumber:=$1
$_l_FieldNumber:=$2
$_l_FieldType:=$3
$_l_FieldLength:=$4
$_bo_indexed:=$5
$_bo_unique:=$6
$_l_CountRecords:=Records in table:C83(Table:C252($_l_TableNumber)->)
For ($_l_RecordNumber; 1; $_l_CountRecords)
	If (<>DB_bo_ReloadPrefs)
		DB_LoadDatacheckPrefs
	End if 
	If (<>SYS_bo_QuitCalled) | (DB_l_cbdatacheckActive=0)
		$_l_RecordNumber:=$_l_CountRecords+1
		
	Else 
		ALL RECORDS:C47(Table:C252($_l_TableNumber)->)
		GOTO SELECTED RECORD:C245(Table:C252($_l_TableNumber)->; $_l_RecordNumber)
		$_l_RecordNumber:=Record number:C243(Table:C252($_l_TableNumber)->)
		Case of 
			: ($_l_FieldType=0)  //Alpha
				$_t_FieldValueSTR:=Field:C253($_l_TableNumber; $_l_FieldNumber)->
				QUERY:C277(Table:C252($_l_TableNumber)->; Field:C253($_l_TableNumber; $_l_FieldNumber)->=$_t_FieldValueSTR)
				If (Records in selection:C76(Table:C252($_l_TableNumber)->)>1)
					//more than one!@!
					READ WRITE:C146(Table:C252($_l_TableNumber)->)
					For ($_l_Index; 1; Records in selection:C76(Table:C252($_l_TableNumber)->))
						If (<>DB_bo_ReloadPrefs)
							DB_LoadDatacheckPrefs
						End if 
						If (<>SYS_bo_QuitCalled) | (DB_l_cbdatacheckActive=0)
							$_l_Index:=Records in table:C83(Table:C252($_l_TableNumber)->)
						Else 
							$_l_RecordNumber2:=Record number:C243(Table:C252($_l_TableNumber)->)
							If ($_l_RecordNumber2#$_l_RecordNumber)
								$_t_FieldValueSTR:=Field:C253($_l_TableNumber; $_l_FieldNumber)->
								BD_l_recordIdent:=AA_GetNextIDinMethod(->BD_l_recordIdent)
								
								If ($_t_FieldValueSTR="")
									$_t_String:=String:C10(BD_l_recordIdent)
									
									If (Length:C16($_t_String)<$_l_FieldLength)
										
										$_l_QueryVariable:=0
										SET QUERY DESTINATION:C396(3; $_l_QueryVariable)
										Repeat   //BSW 9/06/03 Check the value we r going to use is not used already
											IDLE:C311
											QUERY:C277(Table:C252($_l_TableNumber)->; Field:C253($_l_TableNumber; $_l_FieldNumber)->=$_t_String)
											DelayTicks(2)
											If ($_l_QueryVariable#0)
												BD_l_recordIdent:=AA_GetNextIDinMethod(->BD_l_recordIdent)
												$_t_String:=String:C10(BD_l_recordIdent)
											End if 
										Until ($_l_QueryVariable=0)
										SET QUERY DESTINATION:C396(0)
										
										Field:C253($_l_TableNumber; $_l_FieldNumber)->:=$_t_String
										
									Else 
										//too long
										$_t_Number1:=$_t_String[[Length:C16($_t_String)]]
										$_t_Number2:=$_t_String[[(Length:C16($_t_String)-1)]]
										
										$_t_String2:=$_t_Number2+$_t_Number1
										$_t_Character:=Char:C90(Num:C11($_t_String2))
										$_t_Value:=$_t_Character+Substring:C12($_t_String; 1; $_l_FieldLength-1)
										
										$_l_QueryVariable:=0
										SET QUERY DESTINATION:C396(3; $_l_QueryVariable)
										Repeat   //BSW 9/06/03 Check the value we r going to use is not used already
											IDLE:C311
											QUERY:C277(Table:C252($_l_TableNumber)->; Field:C253($_l_TableNumber; $_l_FieldNumber)->=$_t_Value)
											DelayTicks(2)
											If ($_l_QueryVariable#0)
												BD_l_recordIdent:=AA_GetNextIDinMethod(->BD_l_recordIdent)
												$_t_String:=String:C10(BD_l_recordIdent)
												$_t_Number1:=$_t_String[[Length:C16($_t_String)]]
												$_t_Number2:=$_t_String[[(Length:C16($_t_String)-1)]]
												$_t_String2:=$_t_Number2+$_t_Number1
												$_t_Character:=Char:C90(Num:C11($_t_String2))
												$_t_Value:=$_t_Character+Substring:C12($_t_String; 1; $_l_FieldLength-1)
											End if 
										Until ($_l_QueryVariable=0)
										SET QUERY DESTINATION:C396(0)
										
										Field:C253($_l_TableNumber; $_l_FieldNumber)->:=$_t_Value
										
									End if 
									
								Else 
									//there is a value but it aint unique
									$_t_String:=$_t_FieldValueSTR+String:C10(BD_l_recordIdent)
									$_l_StringLength:=Length:C16($_t_String)
									If ($_l_StringLength<$_l_FieldLength)
										
										$_l_QueryVariable:=0
										SET QUERY DESTINATION:C396(3; $_l_QueryVariable)
										Repeat   //BSW 9/06/03 Check the value we r going to use is not used already
											IDLE:C311
											QUERY:C277(Table:C252($_l_TableNumber)->; Field:C253($_l_TableNumber; $_l_FieldNumber)->=$_t_Value)
											DelayTicks(2)
											If ($_l_QueryVariable#0)
												BD_l_recordIdent:=AA_GetNextIDinMethod(->BD_l_recordIdent)
												$_t_String:=String:C10(BD_l_recordIdent)
												$_t_Number1:=$_t_String[[Length:C16($_t_String)]]
												$_t_Number2:=$_t_String[[(Length:C16($_t_String)-1)]]
												$_t_String2:=$_t_Number2+$_t_Number1
												$_t_Character:=Char:C90(Num:C11($_t_String2))
												$_t_Value:=$_t_Character+Substring:C12($_t_String; 1; $_l_FieldLength-1)
											End if 
										Until ($_l_QueryVariable=0)
										SET QUERY DESTINATION:C396(0)
										
										Field:C253($_l_TableNumber; $_l_FieldNumber)->:=$_t_String
										
									Else 
										//too long
										$_t_Number1:=$_t_String[[Length:C16($_t_String)]]
										$_t_Number2:=$_t_String[[(Length:C16($_t_String)-1)]]
										$_t_String2:=$_t_Number2+$_t_Number1
										$_t_Character:=Char:C90(Num:C11($_t_String2))
										
										
										If (Length:C16($_t_FieldValueSTR)<$_l_FieldLength)
											$_t_Value:=$_t_FieldValueSTR+$_t_Character+Substring:C12($_t_String; 1; $_l_FieldLength-(Length:C16($_t_FieldValueSTR)+1))
										Else 
											$_t_Value:=(Substring:C12($_t_FieldValueSTR; 1; $_l_FieldLength-3))+$_t_Character+Substring:C12($_t_String; 1; $_l_FieldLength-1)
										End if 
										$_l_QueryVariable:=0
										
										SET QUERY DESTINATION:C396(3; $_l_QueryVariable)
										
										Repeat   //BSW 9/06/03 Check the value we r going to use is not used already
											IDLE:C311
											QUERY:C277(Table:C252($_l_TableNumber)->; Field:C253($_l_TableNumber; $_l_FieldNumber)->=$_t_Value)
											DelayTicks(2)
											If ($_l_QueryVariable#0)
												BD_l_recordIdent:=AA_GetNextIDinMethod(->BD_l_recordIdent)
												$_t_String:=String:C10(BD_l_recordIdent)
												
												$_t_Number1:=$_t_String[[Length:C16($_t_String)]]
												$_t_Number2:=$_t_String[[(Length:C16($_t_String)-1)]]
												$_t_String2:=$_t_Number2+$_t_Number1
												$_t_Character:=Char:C90(Num:C11($_t_String2))
												If (Length:C16($_t_FieldValueSTR)<$_l_FieldLength)
													$_t_Value:=$_t_FieldValueSTR+$_t_Character+Substring:C12($_t_String; 1; $_l_FieldLength-(Length:C16($_t_FieldValueSTR)+1))
												Else 
													$_t_Value:=(Substring:C12($_t_FieldValueSTR; 1; $_l_FieldLength-3))+$_t_Character+Substring:C12($_t_String; 1; $_l_FieldLength-1)
												End if 
												
											End if 
										Until ($_l_QueryVariable=0)
										SET QUERY DESTINATION:C396(0)
										
										Field:C253($_l_TableNumber; $_l_FieldNumber)->:=$_t_Value
									End if 
								End if 
								
								DB_SaveRecord(Table:C252($_l_TableNumber))
							End if 
							//  if quitting exit here
							
							NEXT RECORD:C51(Table:C252($_l_TableNumber)->)
						End if 
						
					End for 
				End if 
				
				//````
			: ($_l_FieldType=1) | ($_l_FieldType=8) | ($_l_FieldType=9)  //numeric
				$_r_FieldValueNumber:=Field:C253($_l_TableNumber; $_l_FieldNumber)->
				QUERY:C277(Table:C252($_l_TableNumber)->; Field:C253($_l_TableNumber; $_l_FieldNumber)->=$_r_FieldValueNumber)
				If (Records in selection:C76(Table:C252($_l_TableNumber)->)>1)
					//more than one!@!
					READ WRITE:C146(Table:C252($_l_TableNumber)->)
					For ($_l_Index; 1; Records in selection:C76(Table:C252($_l_TableNumber)->))
						If (<>DB_bo_ReloadPrefs)
							DB_LoadDatacheckPrefs
						End if 
						If (<>SYS_bo_QuitCalled) | (DB_l_cbdatacheckActive=0)
							$_l_Index:=Records in table:C83(Table:C252($_l_TableNumber)->)
						Else 
							$_l_RecordNumber2:=Record number:C243(Table:C252($_l_TableNumber)->)
							If ($_l_RecordNumber2#$_l_RecordNumber)
								$_r_FieldValueNumber:=Field:C253($_l_TableNumber; $_l_FieldNumber)->
								BD_l_recordIdent:=0
								
								BD_l_recordIdent:=AA_GetNextIDinMethod(->BD_l_recordIdent)
								
								If ($_r_FieldValueNumber=0)
									$_l_Value:=BD_l_recordIdent
								Else 
									//there is a value but it aint unique
									$_l_Value:=Field:C253($_l_TableNumber; $_l_FieldNumber)->+BD_l_recordIdent
								End if 
								
								$_l_QueryVariable:=0
								
								SET QUERY DESTINATION:C396(3; $_l_QueryVariable)
								
								Repeat   //BSW 9/06/03 Check the value we r going to use is not used already
									IDLE:C311
									QUERY:C277(Table:C252($_l_TableNumber)->; Field:C253($_l_TableNumber; $_l_FieldNumber)->=$_l_Value)
									DelayTicks(2)
									If ($_l_QueryVariable#0)
										BD_l_recordIdent:=AA_GetNextIDinMethod(->BD_l_recordIdent)
										If ($_r_FieldValueNumber=0)
											$_l_Value:=BD_l_recordIdent
										Else 
											//there is a value but it aint unique
											$_l_Value:=Field:C253($_l_TableNumber; $_l_FieldNumber)->+BD_l_recordIdent
										End if 
										
									End if 
								Until ($_l_QueryVariable=0)
								SET QUERY DESTINATION:C396(0)
								
								Field:C253($_l_TableNumber; $_l_FieldNumber)->:=$_l_Value
								DB_SaveRecord(Table:C252($_l_TableNumber))
							End if 
							
							NEXT RECORD:C51(Table:C252($_l_TableNumber)->)
							//if quitting exit here
						End if 
						
					End for 
				End if 
				//i am not dealing with date/time or boolean
				// fields because i cant see that we would set them
				//as unique
				//blob and text fields cant be set as unique
				
		End case 
		//if quitting exit here
	End if 
	
End for 

UNLOAD RECORD:C212(Table:C252($_l_TableNumber)->)
READ ONLY:C145(Table:C252($_l_TableNumber)->)
ERR_MethodTrackerReturn("DB_Datacheckunique"; $_t_oldMethodName)