//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessServiceImportProcesstoha
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Records; 0)
	C_BOOLEAN:C305($_bo_Boolean)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Index; $_l_Longint1; $_l_Longint2; $_l_Longint3; $_l_Longint4; $_l_RecordNumber; $_l_Status; $_l_TableNumber; $_l_TimeLong)
	C_TEXT:C284($_t_Comment; $_t_line; $_t_line2; $_t_oldMethodName; $_t_ServiceType; $_t_Text; $_t_TimeString)
	C_TIME:C306($_ti_DocumentRef; $_ti_Time)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessServiceImportProcesstoha")

$_ti_DocumentRef:=DB_OpenDocument(""; "")

If ($_ti_DocumentRef#?00:00:00?)
	ARRAY TEXT:C222($_at_Records; 0)
	Repeat 
		RECEIVE PACKET:C104($_ti_DocumentRef; $_t_line; Char:C90(10))
		If ($_t_line#"")
			APPEND TO ARRAY:C911($_at_Records; $_t_line)
		End if 
		RECEIVE PACKET:C104($_ti_DocumentRef; $_t_line2; Char:C90(13))
	Until (OK=0)
	For ($_l_Index; 2; Size of array:C274($_at_Records))
		$_l_CharacterPosition:=Position:C15(Char:C90(9); $_at_Records{$_l_Index})
		If ($_l_CharacterPosition>0)
			$_t_Comment:=Substring:C12($_at_Records{$_l_Index}; 1; $_l_CharacterPosition-1)
			$_at_Records{$_l_Index}:=Substring:C12($_at_Records{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_Records{$_l_Index}))
			$_l_CharacterPosition:=Position:C15(Char:C90(9); $_at_Records{$_l_Index})
			If ($_l_CharacterPosition>0)
				$_l_Longint1:=Num:C11(Substring:C12($_at_Records{$_l_Index}; 1; $_l_CharacterPosition-1))
				$_at_Records{$_l_Index}:=Substring:C12($_at_Records{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_Records{$_l_Index}))
				$_l_CharacterPosition:=Position:C15(Char:C90(9); $_at_Records{$_l_Index})
				If ($_l_CharacterPosition>0)
					$_l_Longint2:=Num:C11(Substring:C12($_at_Records{$_l_Index}; 1; $_l_CharacterPosition-1))
					$_at_Records{$_l_Index}:=Substring:C12($_at_Records{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_Records{$_l_Index}))
					$_l_CharacterPosition:=Position:C15(Char:C90(9); $_at_Records{$_l_Index})
					If ($_l_CharacterPosition>0)
						$_l_Longint3:=Num:C11(Substring:C12($_at_Records{$_l_Index}; 1; $_l_CharacterPosition-1))
						$_at_Records{$_l_Index}:=Substring:C12($_at_Records{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_Records{$_l_Index}))
						$_l_CharacterPosition:=Position:C15(Char:C90(9); $_at_Records{$_l_Index})
						If ($_l_CharacterPosition>0)
							$_l_Longint4:=Num:C11(Substring:C12($_at_Records{$_l_Index}; 1; $_l_CharacterPosition-1))
							$_bo_Boolean:=($_l_Longint4=1)
							$_at_Records{$_l_Index}:=Substring:C12($_at_Records{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_Records{$_l_Index}))
							$_l_CharacterPosition:=Position:C15(Char:C90(9); $_at_Records{$_l_Index})
							If ($_l_CharacterPosition>0)
								$_t_Text:=(Substring:C12($_at_Records{$_l_Index}; 1; $_l_CharacterPosition-1))
								$_at_Records{$_l_Index}:=Substring:C12($_at_Records{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_Records{$_l_Index}))
								$_l_CharacterPosition:=Position:C15(Char:C90(9); $_at_Records{$_l_Index})
								If ($_l_CharacterPosition>0)
									$_d_Date:=Date:C102(Substring:C12($_at_Records{$_l_Index}; 1; $_l_CharacterPosition-1))
									$_at_Records{$_l_Index}:=Substring:C12($_at_Records{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_Records{$_l_Index}))
									$_l_CharacterPosition:=Position:C15(Char:C90(9); $_at_Records{$_l_Index})
									If ($_l_CharacterPosition>0)
										$_l_RecordNumber:=Num:C11(Substring:C12($_at_Records{$_l_Index}; 1; $_l_CharacterPosition-1))
										$_at_Records{$_l_Index}:=Substring:C12($_at_Records{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_Records{$_l_Index}))
										$_l_CharacterPosition:=Position:C15(Char:C90(9); $_at_Records{$_l_Index})
										If ($_l_CharacterPosition>0)
											$_t_ServiceType:=(Substring:C12($_at_Records{$_l_Index}; 1; $_l_CharacterPosition-1))
											$_at_Records{$_l_Index}:=Substring:C12($_at_Records{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_Records{$_l_Index}))
											$_l_CharacterPosition:=Position:C15(Char:C90(9); $_at_Records{$_l_Index})
											If ($_l_CharacterPosition>0)
												$_l_Status:=Num:C11(Substring:C12($_at_Records{$_l_Index}; 1; $_l_CharacterPosition-1))
												$_at_Records{$_l_Index}:=Substring:C12($_at_Records{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_Records{$_l_Index}))
												$_l_CharacterPosition:=Position:C15(Char:C90(9); $_at_Records{$_l_Index})
												If ($_l_CharacterPosition>0)
													$_l_TableNumber:=Num:C11(Substring:C12($_at_Records{$_l_Index}; 1; $_l_CharacterPosition-1))
													$_at_Records{$_l_Index}:=Substring:C12($_at_Records{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_Records{$_l_Index}))
													$_l_CharacterPosition:=Position:C15(Char:C90(10); $_at_Records{$_l_Index})
													If ($_l_CharacterPosition>0)
														$_l_TimeLong:=Num:C11(Substring:C12($_at_Records{$_l_Index}; 1; $_l_CharacterPosition-1))
														$_t_TimeString:=Time string:C180($_l_TimeLong)
														$_ti_Time:=Time:C179($_t_TimeString)
														$_at_Records{$_l_Index}:=Substring:C12($_at_Records{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_Records{$_l_Index}))
														CREATE RECORD:C68([PROCESSES_TO_HANDLE:115])
														[PROCESSES_TO_HANDLE:115]Comments:3:=$_t_Comment
														[PROCESSES_TO_HANDLE:115]Data1Longint:8:=$_l_Longint1
														[PROCESSES_TO_HANDLE:115]Data2Longint:9:=$_l_Longint2
														[PROCESSES_TO_HANDLE:115]Data3Longint:10:=$_l_Longint3
														[PROCESSES_TO_HANDLE:115]Data4Boolean:11:=$_bo_Boolean
														TEXT TO BLOB:C554($_t_Text; [PROCESSES_TO_HANDLE:115]Data5Blob:12; 3)
														[PROCESSES_TO_HANDLE:115]DateCreated:4:=$_d_Date
														[PROCESSES_TO_HANDLE:115]RecordNumber:7:=$_l_RecordNumber
														[PROCESSES_TO_HANDLE:115]ServiceType:6:=$_t_ServiceType
														[PROCESSES_TO_HANDLE:115]Status:2:=$_l_Status
														[PROCESSES_TO_HANDLE:115]TableNumber:1:=$_l_TableNumber
														[PROCESSES_TO_HANDLE:115]TimeCreated:5:=$_ti_Time
														DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
														
													End if 
													
													
												End if 
												
											End if 
											
										End if 
									End if 
									
								End if 
								
							End if 
						End if 
					End if 
					
				End if 
				
			End if 
			
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("ProcessServiceImportProcesstoha"; $_t_oldMethodName)
