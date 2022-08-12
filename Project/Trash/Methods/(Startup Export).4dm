//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Startup Export
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	C_BOOLEAN:C305(<>StartProc; <>SYS_bo_CurrentWindowModal; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; $_l_Accessible; $_l_CountFields; $_l_Done; $_l_FieldsIndex; $_l_Index; $_l_PictureDoc; $_l_Progress; $_l_SizeOfArray; $_l_Type)
	C_LONGINT:C283($_l_WindowReferenceRow; r0; s2; vNo1; vNo2; vNo3; WIN_l_CurrentWinRef)
	C_PICTURE:C286(vPicture)
	C_POINTER:C301($_ptr_FIeld; $_ptr_Table)
	C_TEXT:C284($_t_CombinedDataValue; $_t_DataValue; $_t_DocumentName; $_t_DocumentOriginal; $_t_DocumentPath; $_t_oldMethodName; $_t_Rec; $_t_TableName; vFld; vRec; vText)
	C_TEXT:C284(vTitle10)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup Export")
//Startup Export
//C_PICTURE($_pic_PIcture)
Load_Fields

Start_Process
<>StartProc:=False:C215
<>SYS_bo_CurrentWindowModal:=True:C214
vTitle10:="AGeneric.TXT"

Open_Any_Window(385; 418)
DIALOG:C40([COMPANIES:2]; "dStartup Export")
CLOSE WINDOW:C154
If (OK=1)
	$_l_PictureDoc:=0
	
	$_l_SizeOfArray:=Size of array:C274(MOD_al_ModuleAccessStatus)
	$_l_Accessible:=0
	For ($_l_Index; 1; $_l_SizeOfArray)  //count the no of files to do
		If (MOD_al_ModuleAccessStatus{$_l_Index}#0)
			$_l_Accessible:=$_l_Accessible+1
		End if 
	End for 
	
	If ($_l_Accessible>0)
		
		If (r0=1)
			vDoc:=DB_CreateDocument("")
		Else 
			Gen_Confirm("Please select the Document to which you would like to Append")
			If (OK=1)
				vDoc:=Append document:C265("")
			End if 
		End if 
		If (OK=1)
			<>SYS_bo_CurrentWindowModal:=True:C214
			$_t_DocumentPath:=Str_FolderDiv(Str_StripDocNam(Document))
			$_t_DocumentOriginal:=Document
			
			$_l_Progress:=Progress2_Start("Exporting ...")
			If ($_l_Progress=0)
				<>Process:=Current process:C322
			Else 
				<>Process:=$_l_Progress
			End if 
			
			vFld:=Char:C90(vNo1)
			vRec:=Char:C90(vNo2)
			If (vNo3>0)
				vRec:=vRec+Char:C90(vNo3)
			Else 
				vNo3:=0
			End if 
			If (r0=1)
				SEND PACKET:C103(vDoc; "Field:"+Str LeadZeros(String:C10(vNo1); 3)+" Record:"+Str LeadZeros(String:C10(vNo2); 3)+"/"+Str LeadZeros(String:C10(vNo3); 3)+vRec+vText)
				If ((s2=1) & (vTitle10#""))  //send the name of the generic file to also import
					SEND PACKET:C103(vDoc; "{}"+vTitle10)
				End if 
				SEND PACKET:C103(vDoc; vRec+String:C10($_l_Accessible)+vRec)
			End if 
			
			$_l_Done:=1
			For ($_l_Index; 1; $_l_SizeOfArray)
				If (MOD_al_ModuleAccessStatus{$_l_Index}#0)
					$_t_TableName:=Uppers2(Lowercase:C14(<>DB_at_TableNames{$_l_Index}))
					Progress2_Call($_l_Progress; $_t_TableName+" ("+String:C10($_l_Done)+" of "+String:C10($_l_Accessible)+")"; $_l_Done; $_l_Accessible)
					
					If (<>SYS_l_CancelProcess#<>Process)
						Case of 
							: ($_l_Index=1)
								If (MOD_al_ModuleAccessStatus{$_l_Index}=1)
									ALL RECORDS:C47([CONTACTS:1])
									OK:=1
								Else 
									$_t_Rec:=vRec  //cos is used in SelAtOp
									Cont_Sel
									vRec:=$_t_Rec
								End if 
								If (OK=1)
									Remote_ExCont(False:C215)
								End if 
							: ($_l_Index=2)
								If (MOD_al_ModuleAccessStatus{$_l_Index}=1)
									ALL RECORDS:C47([COMPANIES:2])
									OK:=1
								Else 
									$_t_Rec:=vRec  //cos is used in SelAtOp
									Comp_Sel
									vRec:=$_t_Rec
								End if 
								If (OK=1)
									Remote_ExComp(False:C215)
								End if 
							: ($_l_Index=9)
								If (MOD_al_ModuleAccessStatus{$_l_Index}=1)
									ALL RECORDS:C47([PRODUCTS:9])
									OK:=1
								Else 
									$_t_Rec:=vRec  //cos is used in SelAtOp
									Prod_Sel
									vRec:=$_t_Rec
								End if 
								If (OK=1)
									Remote_ExProd(False:C215)
								End if 
							Else 
								
								If ($_l_Index#97)  //remove Licence updates
									$_ptr_Table:=Table:C252($_l_Index)
									If (MOD_al_ModuleAccessStatus{$_l_Index}=1)
										ALL RECORDS:C47($_ptr_Table->)
										OK:=1
									Else 
										QUERY:C277($_ptr_Table->)
									End if 
									If ((Records in selection:C76($_ptr_Table->)>0) & (OK=1))
										SEND PACKET:C103(vDoc; "*FILE*"+vRec+$_t_TableName+vRec+String:C10(Records in selection:C76($_ptr_Table->))+vRec)
										FIRST RECORD:C50($_ptr_Table->)
										$_l_CountFields:=Get last field number:C255($_l_Index)
										While ((Not:C34(End selection:C36($_ptr_Table->))) & (<>SYS_l_CancelProcess#<>Process))
											If (<>SYS_al_TableUniqueField{$_l_Index}>0)  //Send the unique fld first
												$_ptr_FIeld:=Field:C253($_l_Index; <>SYS_al_TableUniqueField{$_l_Index})
												$_l_Type:=Type:C295($_ptr_FIeld->)
												If (($_l_Type#5) & ($_l_Type#3) & ($_l_Type#7))
													Case of 
														: (($_l_Type=1) | ($_l_Type=4) | ($_l_Type=8) | ($_l_Type=9))
															$_t_DataValue:=String:C10($_ptr_FIeld->)
														: ($_l_Type=6)
															$_t_DataValue:=String:C10(Num:C11($_ptr_FIeld->))
														: ($_l_Type=11)
															$_t_DataValue:=Time string:C180($_ptr_FIeld->)
														Else 
															$_t_DataValue:=$_ptr_FIeld->
													End case 
													$_t_CombinedDataValue:=$_t_DataValue+vFld
												Else 
													$_t_CombinedDataValue:=vFld
												End if 
											Else 
												$_t_CombinedDataValue:=vFld
											End if 
											For ($_l_FieldsIndex; 1; $_l_CountFields)
												If (($_l_Index#15) | (($_l_FieldsIndex#12) & ($_l_FieldsIndex#58) & ($_l_FieldsIndex#92)))  //remove Licence etc
													$_ptr_FIeld:=Field:C253($_l_Index; $_l_FieldsIndex)
													$_l_Type:=Type:C295($_ptr_FIeld->)
													$_t_DataValue:=""
													
													If ($_l_Type=3)  //if a picture field
														
														If ($_l_PictureDoc=0)
															ON ERR CALL:C155("Remote_Err")
															$_t_DocumentName:=Str_StripSuffix(Str_StripPath($_t_DocumentOriginal))
															$_t_DocumentName:=Substring:C12($_t_DocumentName; 1; 7)+"%.TXT"
															OK:=1
															SET CHANNEL:C77(10; $_t_DocumentPath+$_t_DocumentName)
															$_l_PictureDoc:=OK
															ON ERR CALL:C155("")
														End if 
														If ($_l_PictureDoc>0)
															LOAD RECORD:C52($_ptr_Table->)
															vPicture:=$_ptr_FIeld->
															If (Picture size:C356(vPicture)>0)
																SEND VARIABLE:C80(vPicture)
																$_t_DataValue:="*PCT"
															Else 
																$_t_DataValue:="*PCT Blank"
															End if 
														End if 
														
													Else 
														If (($_l_Type#5) & ($_l_Type#3) & ($_l_Type#7))
															Case of 
																: (($_l_Type=1) | ($_l_Type=4) | ($_l_Type=8) | ($_l_Type=9))
																	$_t_DataValue:=String:C10($_ptr_FIeld->)
																: ($_l_Type=6)
																	$_t_DataValue:=String:C10(Num:C11($_ptr_FIeld->))
																: ($_l_Type=11)
																	$_t_DataValue:=Time string:C180($_ptr_FIeld->)
																Else 
																	$_t_DataValue:=$_ptr_FIeld->
															End case 
														End if 
													End if 
													If (Not:C34(($_l_Index=11) & ($_l_FieldsIndex=13)))  //blank the Personnel_Id
														$_t_CombinedDataValue:=$_t_CombinedDataValue+$_t_DataValue+vFld
													End if 
													
												End if 
											End for 
											SEND PACKET:C103(vDoc; $_t_CombinedDataValue+vRec)
											NEXT RECORD:C51($_ptr_Table->)
										End while 
										SEND PACKET:C103(vDoc; "*END*"+vFld+vRec)
									End if 
									
								End if 
						End case 
						$_l_Done:=$_l_Done+1
					End if 
				End if 
			End for 
			
			Progress2_Call($_l_Progress; "")
			
		End if 
		Close_DocUMENT(vDoc)
		If ($_l_PictureDoc>0)
			SET CHANNEL:C77(11)
		End if 
		
		If (r0=1)  //Add to the ModStart document
			$_t_DocumentName:=Str_StripPath($_t_DocumentOriginal)
			ON ERR CALL:C155("Remote_Err")
			vDoc:=Append document:C265($_t_DocumentPath+"ModStart.TXT")
			If (OK=0)
				vDoc:=DB_CreateDocument($_t_DocumentPath+"ModStart.TXT")
			End if 
			ON ERR CALL:C155("")
			If (OK=1)
				SEND PACKET:C103(vDoc; $_t_DocumentName+Char:C90(9)+vText+Char:C90(13))
				Close_DocUMENT(vDoc)
			End if 
		End if 
		
	End if 
End if 
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 

<>SYS_bo_CurrentWindowModal:=False:C215
Process_End
ERR_MethodTrackerReturn("Startup Export"; $_t_oldMethodName)
