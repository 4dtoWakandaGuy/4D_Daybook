//%attributes = {}

If (False:C215)
	//Project Method Name:      db_CheckMyUnique
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
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldUnique; $_bo_UseGeneric; $_bo_UseNegative)
	C_LONGINT:C283($_l_Currentprocess; $_l_DBEvent; $_l_DifferenceOffset; $_l_FIeldLength; $_l_FieldNumber; $_l_FIeldType; $_l_FieldValueNum; $_l_ItemRefID; $_l_MaxQuantity; $_l_QueryVariable; $_l_RecordNumber)
	C_LONGINT:C283($_l_RecordNumber2; $_l_Retries; $_l_TableNumber; $_l_Trigger_level; $_l_Value; $_l_ValueLength; $2; BD_l_recordIdent)
	C_POINTER:C301($_ptr_Field2; $_ptr_Table2; $1)
	C_TEXT:C284($_t_Character; $_t_FieldValueSTR; $_t_Num1; $_t_Num2; $_t_oldMethodName; $_t_String; $_t_String2; $_t_Value; DB_t_PtrStr; DB_t_Methodname)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("db_CheckMyUnique")


//BSW July 2004 added find index key
//NG Feb 2004
//This method is verify that the value being assigned to a record is unique
//paramters

$_t_oldMethodName:=ERR_MethodTracker("db_CheckMyUnique")
DB_t_Methodname:=Current method name:C684


$_l_MaxQuantity:=$2  //$2 is the maximum number allowed

//this is so when the method is called during saving a new record
//the value can be 0 -there should be no records with this value in the system
//when saving an existing record the maximum should be

If (Count parameters:C259>=2)
	If (GenValidatePointer($1))
		$_l_TableNumber:=Table:C252($1)
		$_l_FieldNumber:=Field:C253($1)
		$_l_Trigger_level:=Trigger level:C398
		$_l_Currentprocess:=Current process:C322
		
		If ($_l_Trigger_level>0)
			TRIGGER PROPERTIES:C399($_l_Trigger_level; $_l_DBEvent; $_l_TableNumber; $_l_RecordNumber)
			If ($_l_DBEvent=2)
				If ($_l_MaxQuantity=0)
					$_l_MaxQuantity:=1
				End if 
			End if 
		End if 
		
		$_ptr_Table2:=Table:C252($_l_TableNumber)
		
		If ((Not:C34(Is nil pointer:C315($_ptr_Table2))) & (Records in table:C83($_ptr_Table2->)>0))
			
			$_ptr_Field2:=$1
			
			If ((Not:C34(Is nil pointer:C315($_ptr_Field2))))
				GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FIeldType; $_l_FIeldLength; $_bo_FieldIndexed; $_bo_FieldUnique)
				Case of 
					: ($_l_FIeldType=0)  //Alpha
						$_t_FieldValueSTR:=$1->
						If ($_bo_FieldIndexed) & ($_l_MaxQuantity=0)
							$_l_QueryVariable:=Find in field:C653($_ptr_Field2->; $_t_FieldValueSTR)
							If ($_l_QueryVariable=-1)
								$_l_QueryVariable:=0
							Else 
								$_l_QueryVariable:=1  //found something in data already
							End if 
						Else 
							SET QUERY DESTINATION:C396(3; $_l_QueryVariable)
							QUERY:C277($_ptr_Table2->; $_ptr_Field2->=$_t_FieldValueSTR)
							SET QUERY DESTINATION:C396(0)
						End if 
						
						If ($_l_QueryVariable>$_l_MaxQuantity)  //more than one!@!
							
							$_t_FieldValueSTR:=$1->
							BD_l_recordIdent:=AA_GetNextID(->BD_l_recordIdent)
							
							If ($_t_FieldValueSTR="")
								// it is an empty string so fill it with something
								$_t_String:=String:C10(BD_l_recordIdent)
								
								If (Length:C16($_t_String)<$_l_FIeldLength)
									If (Not:C34($_bo_FieldIndexed))
										SET QUERY DESTINATION:C396(3; $_l_QueryVariable)
									End if 
									Repeat   //BSW 9/06/03 Check the value we r going to use is not used already until it is unique
										IDLE:C311
										If (Not:C34($_bo_FieldIndexed))
											QUERY:C277($_ptr_Table2->; $_ptr_Field2->=$_t_String)
										Else 
											$_l_QueryVariable:=Find in field:C653($_ptr_Field2->; $_t_String)
											If ($_l_QueryVariable=-1)
												$_l_QueryVariable:=0
											Else 
												$_l_QueryVariable:=1  //found something in data already
											End if 
										End if 
										$_l_Retries:=0
										If ($_l_QueryVariable#0)
											$_l_Retries:=$_l_Retries+1
											DelayTicks(2*(1+$_l_Retries))
											BD_l_recordIdent:=AA_GetNextID(->BD_l_recordIdent)
											$_t_String:=String:C10(BD_l_recordIdent)
										End if 
									Until ($_l_QueryVariable=0)
									If (Not:C34($_bo_FieldIndexed))
										SET QUERY DESTINATION:C396(0)
									End if 
									
									$_ptr_Field2->:=$_t_String
									
								Else 
									//too long
									$_t_Num1:=$_t_String[[Length:C16($_t_String)]]
									$_t_Num2:=$_t_String[[(Length:C16($_t_String)-1)]]
									
									$_t_String2:=$_t_Num2+$_t_Num1
									$_t_Character:=Char:C90(Num:C11($_t_String2))
									$_t_Value:=$_t_Character+Substring:C12($_t_String; 1; $_l_FIeldLength-1)
									
									If (Not:C34($_bo_FieldIndexed))
										SET QUERY DESTINATION:C396(3; $_l_QueryVariable)
									End if 
									$_l_Retries:=0
									Repeat   //BSW 9/06/03 Check the value we r going to use is not used already
										IDLE:C311
										If (Not:C34($_bo_FieldIndexed))
											QUERY:C277($_ptr_Table2->; $_ptr_Field2->=$_t_Value)
										Else 
											$_l_QueryVariable:=Find in field:C653($_ptr_Field2->; $_t_Value)
											If ($_l_QueryVariable=-1)
												$_l_QueryVariable:=0
											Else 
												$_l_QueryVariable:=1  //found something in data already
											End if 
										End if 
										If ($_l_QueryVariable#0)
											$_l_Retries:=$_l_Retries+1
											DelayTicks(2*(1+$_l_Retries))
											BD_l_recordIdent:=AA_GetNextID(->BD_l_recordIdent)
											$_t_String:=String:C10(BD_l_recordIdent)
											$_t_Num1:=$_t_String[[Length:C16($_t_String)]]
											$_t_Num2:=$_t_String[[(Length:C16($_t_String)-1)]]
											$_t_String2:=$_t_Num2+$_t_Num1
											$_t_Character:=Char:C90(Num:C11($_t_String2))
											$_t_Value:=$_t_Character+Substring:C12($_t_String; 1; $_l_FIeldLength-1)
										End if 
									Until ($_l_QueryVariable=0)
									If (Not:C34($_bo_FieldIndexed))
										SET QUERY DESTINATION:C396(0)
									End if 
									$_ptr_Field2->:=$_t_Value
									
								End if 
								
							Else 
								//there is a value but it aint unique
								$_t_Value:=$_t_FieldValueSTR+String:C10(BD_l_recordIdent)
								$_l_ValueLength:=Length:C16($_t_Value)
								If ($_l_ValueLength<$_l_FIeldLength)
									
									If (Not:C34($_bo_FieldIndexed))
										SET QUERY DESTINATION:C396(3; $_l_QueryVariable)
									End if 
									$_l_Retries:=0
									Repeat   //BSW 9/06/03 Check the value we r going to use is not used already
										IDLE:C311
										If (Not:C34($_bo_FieldIndexed))
											QUERY:C277($_ptr_Table2->; $_ptr_Field2->=$_t_Value)
										Else 
											$_l_QueryVariable:=Find in field:C653($_ptr_Field2->; $_t_Value)
											If ($_l_QueryVariable=-1)
												$_l_QueryVariable:=0
											Else 
												$_l_QueryVariable:=1  //found something in data already
											End if 
										End if 
										If ($_l_QueryVariable#0)
											$_l_Retries:=$_l_Retries+1
											DelayTicks(2*(1+$_l_Retries))
											BD_l_recordIdent:=AA_GetNextID(->BD_l_recordIdent)
											$_t_String:=String:C10(BD_l_recordIdent)
											$_t_Num1:=$_t_String[[Length:C16($_t_String)]]
											$_t_Num2:=$_t_String[[(Length:C16($_t_String)-1)]]
											$_t_String2:=$_t_Num2+$_t_Num1
											$_t_Character:=Char:C90(Num:C11($_t_String2))
											$_t_Value:=$_t_Character+Substring:C12($_t_String; 1; $_l_FIeldLength-1)
										End if 
									Until ($_l_QueryVariable=0)
									If (Not:C34($_bo_FieldIndexed))
										SET QUERY DESTINATION:C396(0)
									End if 
									
									$_ptr_Field2->:=$_t_Value
									
								Else 
									//too long
									$_t_Num1:=$_t_Value[[Length:C16($_t_Value)]]
									$_t_Num2:=$_t_Value[[(Length:C16($_t_Value)-1)]]
									$_t_String2:=$_t_Num2+$_t_Num1
									$_t_Character:=Char:C90(Num:C11($_t_String2))
									
									If (Length:C16($_t_FieldValueSTR)<$_l_FIeldLength)
										$_t_Value:=$_t_FieldValueSTR+$_t_Character+Substring:C12($_t_Value; 1; $_l_FIeldLength-(Length:C16($_t_FieldValueSTR)+1))
									Else 
										$_t_Value:=(Substring:C12($_t_FieldValueSTR; 1; $_l_FIeldLength-3))+$_t_Character+Substring:C12($_t_Value; 1; $_l_FIeldLength-1)
									End if 
									
									If (Not:C34($_bo_FieldIndexed))
										SET QUERY DESTINATION:C396(3; $_l_QueryVariable)
									End if 
									$_l_Retries:=0
									Repeat   //BSW 9/06/03 Check the value we r going to use is not used already
										IDLE:C311
										If (Not:C34($_bo_FieldIndexed))
											QUERY:C277($_ptr_Table2->; $_ptr_Field2->=$_t_Value)
										Else 
											$_l_QueryVariable:=Find in field:C653($_ptr_Field2->; $_t_Value)
											If ($_l_QueryVariable=-1)
												$_l_QueryVariable:=0
											Else 
												$_l_QueryVariable:=1  //found something in data already
											End if 
										End if 
										If ($_l_QueryVariable#0)
											$_l_Retries:=$_l_Retries+1
											DelayTicks(2*(1+$_l_Retries))
											BD_l_recordIdent:=AA_GetNextID(->BD_l_recordIdent)
											$_t_String:=String:C10(BD_l_recordIdent)
											$_t_Num1:=$_t_String[[Length:C16($_t_String)]]
											$_t_Num2:=$_t_String[[(Length:C16($_t_String)-1)]]
											$_t_String2:=$_t_Num2+$_t_Num1
											$_t_Character:=Char:C90(Num:C11($_t_String2))
											If ($_l_Retries>10)
												//TRACE
												$_t_FieldValueSTR:=Substring:C12($_t_FieldValueSTR; 2)
											End if 
											If (Length:C16($_t_FieldValueSTR)<$_l_FIeldLength)
												$_t_Value:=$_t_FieldValueSTR+$_t_Character+Substring:C12($_t_String; 1; $_l_FIeldLength-(Length:C16($_t_FieldValueSTR)+1))
											Else 
												$_t_Value:=(Substring:C12($_t_FieldValueSTR; 1; $_l_FIeldLength-3))+$_t_Character+Substring:C12($_t_String; 1; $_l_FIeldLength-1)
											End if 
										End if 
										$_l_Retries:=$_l_Retries+1
									Until ($_l_QueryVariable=0)
									If (Not:C34($_bo_FieldIndexed))
										SET QUERY DESTINATION:C396(0)
									End if 
									$_ptr_Field2->:=$_t_Value
								End if 
							End if 
						End if 
						//  if quitting exit here
						
					: ($_l_FIeldType=1) | ($_l_FIeldType=8) | ($_l_FIeldType=9)  //numeric
						$_l_FieldValueNum:=$_ptr_Field2->
						
						If ($_bo_FieldIndexed) & ($_l_MaxQuantity=0)
							$_l_QueryVariable:=Find in field:C653($_ptr_Field2->; $_l_FieldValueNum)
							If ($_l_QueryVariable=-1)
								$_l_QueryVariable:=0
							Else 
								$_l_QueryVariable:=1  //found something in data already
							End if 
						Else 
							SET QUERY DESTINATION:C396(3; $_l_QueryVariable)
							QUERY:C277($_ptr_Table2->; $_ptr_Field2->=$_l_FieldValueNum)
							SET QUERY DESTINATION:C396(0)
						End if 
						$_bo_UseNegative:=False:C215
						READ ONLY:C145([IDENTIFIERS:16])
						$_l_TableNumber:=Table:C252($_ptr_Table2) << 24  //shift the number 24 bits to the left
						If ($_l_TableNumber<0)
							$_bo_UseNegative:=True:C214
							//This is after table 127... so the number is an overflow. this will work up to table 254..which is enough for daybook
							$_l_DifferenceOffset:=Table:C252($_ptr_Table2)-127
							$_l_TableNumber:=$_l_DifferenceOffset << 24  //shift the number 24 bits to the left
							
						End if 
						$_l_FieldNumber:=Field:C253($_ptr_Field2)
						$_l_ItemRefID:=$_l_TableNumber | $_l_FieldNumber
						If ($_bo_UseNegative)
							$_l_ItemRefID:=0-$_l_ItemRefID
						End if 
						QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]XRef_FIELD:8=$_l_ItemRefID)
						$_bo_UseGeneric:=False:C215
						If (Records in selection:C76([IDENTIFIERS:16])=0)
							$_bo_UseGeneric:=True:C214
						End if 
						
						If ($_l_QueryVariable>$_l_MaxQuantity)
							//more than one!@!
							$_l_RecordNumber2:=Record number:C243($_ptr_Table2->)
							BD_l_recordIdent:=0
							DB_t_PtrStr:="BD_l_recordIdent"
							If ($_bo_UseGeneric)
								BD_l_recordIdent:=AA_GetNextID(->BD_l_recordIdent)
							Else 
								BD_l_recordIdent:=AA_GetNextID($_ptr_Field2)
							End if 
							
							If ($_l_FieldValueNum=0)
								$_l_Value:=BD_l_recordIdent
							Else   //there is a value but it aint unique
								$_l_Value:=$_ptr_Field2->+BD_l_recordIdent
							End if 
							
							If (Not:C34($_bo_FieldIndexed))
								SET QUERY DESTINATION:C396(3; $_l_QueryVariable)
							End if 
							$_l_Retries:=0
							Repeat   //BSW 9/06/03 Check the value we r going to use is not used already
								IDLE:C311
								If (Not:C34($_bo_FieldIndexed))
									QUERY:C277($_ptr_Table2->; $_ptr_Field2->=$_l_Value)
								Else 
									$_l_QueryVariable:=Find in field:C653($_ptr_Field2->; $_l_Value)
									If ($_l_QueryVariable=-1)
										$_l_QueryVariable:=0
									Else 
										$_l_QueryVariable:=1  //found something in data already
									End if 
								End if 
								
								
								If ($_l_QueryVariable#0)
									$_l_Retries:=$_l_Retries+1
									DelayTicks(2*(1+$_l_Retries))
									If ($_bo_UseGeneric)
										BD_l_recordIdent:=AA_GetNextID(->BD_l_recordIdent)
									Else 
										BD_l_recordIdent:=AA_GetNextID($_ptr_Field2)
									End if 
									
									If ($_l_FieldValueNum=0)
										$_l_Value:=BD_l_recordIdent
									Else   //there is a value but it aint unique
										$_l_Value:=$_ptr_Field2->+BD_l_recordIdent
									End if 
								End if 
							Until ($_l_QueryVariable=0)
							If (Not:C34($_bo_FieldIndexed))
								SET QUERY DESTINATION:C396(0)
							End if 
							$_ptr_Field2->:=$_l_Value
						End if 
						//i am not dealing with date/time or boolean
						// fields because i cant see that we would set them
						//as unique
						//blob and text fields cant be set as unique
				End case 
			End if 
		End if 
	Else 
	End if 
End if 
ERR_MethodTrackerReturn("db_CheckMyUnique"; $_t_oldMethodName)