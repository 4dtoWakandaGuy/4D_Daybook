//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Startup_Import2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY LONGINT:C221($_al_DelTables; 0)
	//ARRAY LONGINT(aApptO;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	C_BOOLEAN:C305($_bo_Save; $_bo_Write)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; <>SYS_l_LoggedInaccount; $_l_Count; $_l_CountDone; $_l_DataType; $_l_FieldIndex; $_l_LastField; $_l_LastTable; $_l_Number; $_l_PictDoc)
	C_LONGINT:C283($_l_Progress; $_l_TableNumber; $_l_TableRow; $1)
	C_PICTURE:C286(vPicture)
	C_POINTER:C301($_ptr_Field; $_ptr_Table)
	C_TEXT:C284($_t_DocumentName; $_t_DocumentPath; $_t_FileStart; $_t_oldMethodName; $_t_Rest; $_t_TableName; $_t_Unique; $_t_Value; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(vFld; vRec)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup_Import2")
//Startup_Import2
//C_PICTURE($_pic_PIcture)
Load_Fields

If ($1=1)
	$_l_Progress:=Progress2_Start("Setting up ...")
Else 
	$_l_Progress:=Progress2_Start("Setting up Part 2 ...")
End if 
If ($_l_Progress=0)
	<>Process:=Current process:C322
Else 
	<>Process:=$_l_Progress
End if 

$_l_Count:=Num:C11(Remote_Packet(vRec))
$_l_CountDone:=1
$_l_LastTable:=Get last table number:C254
$_l_PictDoc:=0
ARRAY LONGINT:C221($_al_DelTables; 0)

$_t_FileStart:=Remote_Packet(vRec)
While (($_t_FileStart="*FILE*") & (<>SYS_l_CancelProcess#<>Process))
	$_t_TableName:=Remote_Packet(vRec)
	$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName)
	$_l_TableNumber:=<>DB_al_TableNums{$_l_TableNumber}
	If (Is table number valid:C999($_l_TableNumber))
		If ($_l_TableNumber>0)
			$_l_TableRow:=Find in array:C230(aApptO; $_l_TableNumber)
			If (($_l_TableRow<1) & ($1=1))
				INSERT IN ARRAY:C227(aApptO; 1; 1)
				aApptO{1}:=$_l_TableNumber
				$_l_TableRow:=1
			End if 
			
			$_bo_Write:=((MOD_al_ModuleAccessStatus{$_l_TableNumber}>0) & (Not:C34(($1=2) & ($_l_TableRow>0))))
			//only read the file if chose to by holding down option
			//or if has already been read in from the non-generic file
			
			// If (($1=2) & ($_l_TableRow>0))  `if already read in specific, don't read from generic
			
			//  Progress2_Call ($_l_Progress;$_t_TableName+" ("+String($_l_CountDone)+" of "+String($_l_Count)+"
			
			//  $_t_Rest:=Remote_Packet (vRec)  `jump to end of the File section
			// While (($_t_Rest#"*END*@") & (◊Cancel#◊Process))
			//  $_t_Rest:=Remote_Packet (vRec)
			//  End while
			
			// Else
			
			$_ptr_Table:=Table:C252($_l_TableNumber)
			READ WRITE:C146($_ptr_Table->)
			$_l_Number:=Num:C11(Remote_Packet(vRec))
			
			Progress2_Call($_l_Progress; $_t_TableName+" ("+String:C10($_l_CountDone)+" of "+String:C10($_l_Count)+")"; $_l_CountDone; $_l_Count)
			
			Case of 
				: (($_l_TableNumber=1) & ($_bo_Write))
					Remote_ImCont(False:C215)
				: (($_l_TableNumber=2) & ($_bo_Write))
					Remote_ImComp(False:C215)
				: (($_l_TableNumber=9) & ($_bo_Write))
					Remote_ImProd(False:C215)
				Else 
					
					If (((DB_t_CurrentFormUsage2="New") | (DB_t_CurrentFormUsage2="Delete")) & ($_l_TableNumber#15))
						If ($_bo_Write)
							$_l_TableRow:=Find in array:C230($_al_DelTables; $_l_TableNumber)
							If ($_l_TableRow<1)
								ALL RECORDS:C47($_ptr_Table->)
								DELETE SELECTION:C66($_ptr_Table->)
								INSERT IN ARRAY:C227($_al_DelTables; 1; 1)
								$_al_DelTables{1}:=$_l_TableNumber
							End if 
						End if 
					End if 
					$_t_Unique:=Remote_Packet(vFld)
					While (($_t_Unique#"*END*") & (<>SYS_l_CancelProcess#<>Process))
						IDLE:C311  // 7/04/03 pb
						
						If ($_bo_Write)
							If (DB_t_CurrentFormUsage2="Overwrite")
								$_bo_Save:=True:C214
							Else 
								$_bo_Save:=False:C215
							End if 
							If ($_l_TableNumber=15)
								If (DB_t_CurrentFormUsage="Again")
									If (<>SYS_l_LoggedInaccount=0)
										QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
									Else 
										QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
									End if 
								End if 
								$_bo_Save:=True:C214
							Else 
								If ((DB_t_CurrentFormUsage2="New") | (DB_t_CurrentFormUsage2="Delete"))
									CREATE RECORD:C68($_ptr_Table->)
									$_bo_Save:=True:C214
								Else 
									If (<>SYS_al_TableUniqueField{$_l_TableNumber}#0)
										$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
										$_l_DataType:=Type:C295($_ptr_Field->)
										If (($_l_DataType=1) | ($_l_DataType=8) | ($_l_DataType=9))
											QUERY:C277($_ptr_Table->; $_ptr_Field->=Num:C11($_t_Unique))
										Else 
											QUERY:C277($_ptr_Table->; $_ptr_Field->=$_t_Unique)
										End if 
										If (Records in selection:C76($_ptr_Table->)=0)
											CREATE RECORD:C68($_ptr_Table->)
											$_bo_Save:=True:C214
										End if 
									Else 
										CREATE RECORD:C68($_ptr_Table->)
										$_bo_Save:=True:C214
									End if 
								End if 
							End if 
						End if 
						
						$_l_LastField:=Get last field number:C255($_l_TableNumber)
						$_l_FieldIndex:=1
						$_t_Value:=Remote_Packet(vFld)
						While (($_l_FieldIndex<=$_l_LastField) & ($_t_Value#"*END*"))
							If (Is field number valid:C1000($_l_TableNumber; $_l_LastField))
								IDLE:C311  // 7/04/03 pb
								If (($_l_TableNumber#15) | (($_l_FieldIndex#12) & ($_l_FieldIndex#58) & ($_l_FieldIndex#92)))  //remove Licence, Validation & Last Version
									If (($_l_TableNumber#15) | (($_l_FieldIndex#1) & ($_l_FieldIndex#38)))  //remove Organisation & Name
										If (($_l_TableNumber=11) & ($_l_FieldIndex=13))  //Personnel_Id field
											$_l_FieldIndex:=$_l_FieldIndex+1
										End if 
										$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
										$_l_DataType:=Type:C295($_ptr_Field->)
										
										If ($_l_DataType=3)  //if a Picture field
											
											If ($_t_Value="*PCT")
												If ($_l_PictDoc=0)
													//ON ERR CALL("Remote_Err")
													$_t_DocumentPath:=Str_FolderDiv(Str_StripDocNam(Document))
													$_t_DocumentName:=Str_StripSuffix(Str_StripPath(Document))
													$_t_DocumentName:=Substring:C12($_t_DocumentName; 1; 7)+"%.TXT"
													OK:=1
													$_ti_DocumentRef:=DB_OpenDocument($_t_DocumentPath+$_t_DocumentName)  //first check that the picture doc exists
													If (OK=1)
														Close_DocUMENT($_ti_DocumentRef)
														SET CHANNEL:C77(10; $_t_DocumentPath+$_t_DocumentName)
													Else 
														If ($1=1)  //don't try if doing the secondary generic file
															SET CHANNEL:C77(10; $_t_DocumentPath+"ModStar%.TXT")  //if not, open ModStart generic version
														End if 
													End if 
													$_l_PictDoc:=OK
													//ON ERR CALL("")
												End if 
												If ($_l_PictDoc>0)
													RECEIVE VARIABLE:C81(vPicture)
													If ($_bo_Write)
														$_ptr_Field->:=vPicture
													End if 
												End if 
											End if 
											
										Else 
											If ($_bo_Write)
												If (($_l_DataType#5) & ($_l_DataType#3) & ($_l_DataType#7))
													Case of 
														: (($_l_DataType=1) | ($_l_DataType=8) | ($_l_DataType=9))
															$_ptr_Field->:=Num:C11($_t_Value)
														: ($_l_DataType=4)
															$_ptr_Field->:=Date:C102($_t_Value)
														: ($_l_DataType=6)
															$_ptr_Field->:=($_t_Value="1")
														: ($_l_DataType=11)
															$_ptr_Field->:=Time:C179($_t_Value)
														Else 
															$_ptr_Field->:=$_t_Value
													End case 
												End if 
											End if 
										End if 
									End if 
									$_t_Value:=Remote_Packet(vFld)
									
								End if 
							End if 
							$_l_FieldIndex:=$_l_FieldIndex+1
						End while 
						If ($_t_Value="*END*")
							$_t_Rest:=$_t_Value
						Else 
							If ($_bo_Save)
								If ($_bo_Write)
									DB_SaveRecord($_ptr_Table)
								End if 
							End if 
							$_t_Rest:=Remote_Packet(vRec)
						End if 
						If ($_t_Rest="*END*@")
							$_t_Unique:="*END*"
						Else 
							$_t_Unique:=Remote_Packet(vFld)
						End if 
					End while 
					
			End case 
			If ($_l_TableNumber#15)
				UNLOAD RECORD:C212($_ptr_Table->)
			End if 
			
			//  End if
		End if 
		$_t_FileStart:=Remote_Packet(vRec)
		If ($_t_FileStart#"*FILE*")
			$_t_FileStart:=Remote_Packet(vRec)
		End if 
	End if 
	$_l_CountDone:=$_l_CountDone+1
End while 

Progress2_Call($_l_Progress; "")
FLUSH CACHE:C297

$_l_Progress:=Process_No("$Progress2")
While ($_l_Progress>0)
	Progress2_Call($_l_Progress; "")
	$_l_Progress:=Process_No("$Progress2")
End while 

If ($_l_PictDoc>0)
	SET CHANNEL:C77(11)
End if 

If (<>SYS_l_CancelProcess#<>Process)
	<>SYS_l_CancelProcess:=0
End if 
ERR_MethodTrackerReturn("Startup_Import2"; $_t_oldMethodName)
