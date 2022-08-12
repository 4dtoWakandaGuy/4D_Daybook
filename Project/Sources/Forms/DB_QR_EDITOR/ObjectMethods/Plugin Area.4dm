If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.Plugin Area
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/02/2012 12:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_REpFieldNum;0)
	//ARRAY LONGINT(DB_al_REPTableNum;0)
	//ARRAY LONGINT(DB_al_RowNumber;0)
	ARRAY TEXT:C222($_at_ActiveTypes; 0)
	ARRAY TEXT:C222($_at_DocumentSIgnatures; 0)
	ARRAY TEXT:C222($_at_FormatNames; 0)
	C_BOOLEAN:C305(DB_bo_CurrentReportEdited; DBQR_bo_MENUSDISPLAYED)
	C_LONGINT:C283($_l_ActiveSections; $_l_BreakField; $_l_BreakTable; $_l_BreakType; $_l_event; $_l_FieldNumber; $_l_IndexRow; $_l_InSection; $_l_MinSpace; $_l_MouseButton; $_l_NumberofColumns)
	C_LONGINT:C283($_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectOK; $_l_ObjectRight; $_l_ObjectTop; $_l_Options; $_l_Position; $_l_Print; $_l_PrintSections; $_l_Result; $_l_Row)
	C_LONGINT:C283($_l_SourceProcess; $_l_SourceRow; $_l_SRError; $_l_SRItemID; $_l_TableNumber; $_l_ThrowPage; $_l_UseSection; $0; DB_l_CurrentDisplayedForm; DB_l_NextObjectID; DB_l_SRarea)
	C_LONGINT:C283(DBQR_l_EDITORAREA)
	C_PICTURE:C286(DB_P_StaticPic)
	C_POINTER:C301($_ptr_Field; $_ptr_SourceObject)
	C_REAL:C285($_l_MouseX; $_l_MouseY)
	C_TEXT:C284($_t_BreakVarName; $_t_ColumnValue; $_t_DocumentPath; $_t_DocumentType; $_t_FieldName; $_t_Formula; $_t_LabelName; $_t_oldMethodName; $_t_VarName; tSR_ HTMLEnd; tSR_HTMLStart)
	C_TEXT:C284(tSR_Script)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_QR_EDITOR.OSRArea"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
		
		
	: ($_l_event=On Drag Over:K2:13)
		
		_O_DRAG AND DROP PROPERTIES:C607($_ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
		RESOLVE POINTER:C394($_ptr_SourceObject; $_t_VarName; $_l_TableNumber; $_l_FieldNumber)
		If ($_l_SourceRow=-1)
			GET PASTEBOARD DATA TYPE:C958($_at_DocumentSIgnatures; $_at_ActiveTypes; $_at_FormatNames)
			If (Size of array:C274($_at_DocumentSIgnatures)>0)
				If ($_at_DocumentSIgnatures{1}="com.4d.private.file.url")
					$0:=0
				Else 
					$0:=-1
				End if 
			Else 
				$0:=-1
			End if 
		Else 
			If ($_l_SourceProcess=Current process:C322)
				
				$0:=-1
				
			Else 
				$0:=-1
			End if 
		End if 
	: ($_l_event=On Drop:K2:12)
		
		OBJECT GET COORDINATES:C663(DB_l_SRarea; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		
		
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		$_l_MouseX:=$_l_MouseX-$_l_ObjectLeft
		If (DBQR_bo_MENUSDISPLAYED)
			$_l_MouseY:=$_l_MouseY-($_l_ObjectTop+60)
		Else 
			$_l_MouseY:=$_l_MouseY-($_l_ObjectTop)
		End if 
		$_l_Result:=SR Get Sections(DB_l_SRarea; $_l_ActiveSections; $_l_PrintSections)
		
		//  //SR Section Header Mask
		//• SR Section SubHeader1 Mask
		//• SR Section SubHeader2 Mask
		//• SR Section SubHeader3 Mask
		//• SR Section SubHeader4 Mask
		//• SR Section SubHeader5 Mask
		//• SR Section SubHeader6 Mask
		//• SR Section Body Mask
		//• SR Section SubTotal6 Mask
		//• SR Section SubTotal5 Mask
		//• SR Section SubTotal4 Mask
		//• SR Section SubTotal3 Mask
		//• SR Section SubTotal2 Mask
		//• SR Section SubTotal1 Mask
		//• SR Section Total Mask
		//• SR Section Footer Mask
		//
		
		$_l_InSection:=-1
		If (($_l_ActiveSections & SR Section Header Mask)>0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section Header; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section Header
			End if 
		End if 
		If (($_l_ActiveSections & SR Section SubHeader1 Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section SubHeader1; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section SubHeader1
			End if 
		End if 
		If (($_l_ActiveSections & SR Section SubHeader2 Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section SubHeader2; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section SubHeader2
			End if 
		End if 
		If (($_l_ActiveSections & SR Section SubHeader3 Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section SubHeader3; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section SubHeader3
			End if 
		End if 
		If (($_l_ActiveSections & SR Section SubHeader4 Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section SubHeader4; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section SubHeader4
			End if 
		End if 
		If (($_l_ActiveSections & SR Section SubHeader5 Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section SubHeader5; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section SubHeader5
			End if 
		End if 
		If (($_l_ActiveSections & SR Section SubHeader6 Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section SubHeader6; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section SubHeader6
			End if 
		End if 
		If (($_l_ActiveSections & SR Section Body Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section Body; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section Body
			End if 
		End if 
		If (($_l_ActiveSections & SR Section SubTotal6 Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section SubTotal6; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section SubTotal6
			End if 
		End if 
		If (($_l_ActiveSections & SR Section SubTotal5 Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section SubTotal5; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section SubTotal5
			End if 
		End if 
		If (($_l_ActiveSections & SR Section SubTotal4 Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section SubTotal4; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section SubTotal4
			End if 
		End if 
		If (($_l_ActiveSections & SR Section SubTotal3 Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section SubTotal3; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section SubTotal3
			End if 
		End if 
		If (($_l_ActiveSections & SR Section SubTotal2 Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section SubTotal2; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section SubTotal2
			End if 
		End if 
		If (($_l_ActiveSections & SR Section SubTotal1 Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section SubTotal1; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section SubTotal1
			End if 
		End if 
		If (($_l_ActiveSections & SR Section Total Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section Total; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section Total
			End if 
		End if 
		If (($_l_ActiveSections & SR Section Footer Mask)>0) & ($_l_InSection<0)
			$_l_Result:=SR Get Section Properties(DB_l_SRarea; SR Section Footer; $_l_UseSection; $_l_Print; $_l_Position; $_l_Options; $_l_ThrowPage; $_l_MinSpace; $_l_BreakType; $_l_BreakTable; $_l_BreakField; $_t_BreakVarName)
			If ($_l_MouseY<=$_l_Position)
				$_l_InSection:=SR Section Footer
			End if 
		End if 
		_O_DRAG AND DROP PROPERTIES:C607($_ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
		If ($_l_SourceRow=-1)
			ARRAY TEXT:C222($_at_DocumentSIgnatures; 0)
			ARRAY TEXT:C222($_at_ActiveTypes; 0)
			ARRAY TEXT:C222($_at_FormatNames; 0)
			GET PASTEBOARD DATA TYPE:C958($_at_DocumentSIgnatures; $_at_ActiveTypes; $_at_FormatNames)
			If (Size of array:C274($_at_DocumentSIgnatures)>0)
				If ($_at_DocumentSIgnatures{1}="com.4d.private.file.url")
					$_t_DocumentPath:=Get file from pasteboard:C976(1)
					$_t_DocumentType:=Substring:C12($_t_DocumentPath; Length:C16($_t_DocumentPath)-2)
					Case of 
						: ($_t_DocumentType="xxx")  //Super report templace
							
							
					End case 
					
				End if 
			Else 
				
			End if 
			
		Else 
			RESOLVE POINTER:C394($_ptr_SourceObject; $_t_VarName; $_l_TableNumber; $_l_FieldNumber)
			If ($_l_SourceProcess=Current process:C322)
				Case of 
					: ($_t_VarName="DB_lb_AvailableFields")
						$_l_IndexRow:=$_l_SourceRow
						If ($_l_IndexRow>0)
							$_l_Row:=DB_al_RowNumber{$_l_IndexRow}
							
							
							$_ptr_Field:=Field:C253(DB_al_REPTableNum{$_l_Row}; DB_al_REpFieldNum{$_l_Row})
							//C_REAL($_l_MouseX;$_l_MouseY)
							Case of 
									
								: ($_l_InSection=SR Section Header) | ($_l_InSection=SR Section SubHeader1) | ($_l_InSection=SR Section SubHeader2) | ($_l_InSection=SR Section SubHeader3) | ($_l_InSection=SR Section SubHeader4) | ($_l_InSection=SR Section SubHeader5) | ($_l_InSection=SR Section SubHeader6)
									DB_bo_CurrentReportEdited:=True:C214
									
									$_l_SRItemID:=SR Create Object(DB_l_SRarea; String:C10(DB_l_NextObjectID); $_l_MouseY; $_l_MouseX; $_l_MouseY+20; $_l_MouseX+60; SR Object Type Field; 1; 1; DB_al_REPTableNum{$_l_Row}; DB_al_REpFieldNum{$_l_Row})
									If ((DB_al_REPTableNum{$_l_Row})#DB_l_CurrentDisplayedForm)
										$_l_TableNumber:=(DB_al_REPTableNum{$_l_Row})
										$_ptr_Field:=Field:C253(DB_al_REPTableNum{$_l_Row}; DB_al_REpFieldNum{$_l_Row})
										$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
										$_t_ColumnValue:=""
										$_t_Formula:="LB_GetRelation ("+String:C10(DB_l_CurrentDisplayedForm)+";"+String:C10(DB_al_REPTableNum{$_l_Row})+")"
										$_l_SRError:=SR Set Object Scripts(DB_l_SRarea; ($_l_SRItemID); $_t_Formula; ""; "")
									End if 
									//SR Do Command (DB_l_SRarea;208;1)
									DB_l_NextObjectID:=DB_l_NextObjectID+1
									Gen_Confirm("Add a label?"; "Yes"; "No")
									If (OK=1)
										$_ptr_Field:=Field:C253(DB_al_REPTableNum{$_l_Row}; DB_al_REpFieldNum{$_l_Row})
										
										$_t_FieldName:=Field name:C257($_ptr_Field)
										$_t_LabelName:=Gen_Request("Label Name"; $_t_FieldName)
										If (OK=1)
											$_l_SRItemID:=SR Create Object(DB_l_SRarea; String:C10(DB_l_NextObjectID); $_l_MouseY; $_l_MouseX-60; $_l_MouseY+20; $_l_MouseX; SR Object Type Text; 1; 1)
											$_l_ObjectOK:=SR Set Object Data(DB_l_SRarea; $_l_SRItemID; DB_P_StaticPic; $_t_LabelName)
											//SR Do Command (DB_l_SRarea;208;1)
											DB_l_NextObjectID:=DB_l_NextObjectID+1
										End if 
										
									End if 
									
									//SR Section SubTotal6 Mask
									//• SR Section SubTotal5 Mask
									//• SR Section SubTotal4 Mask
									//• SR Section SubTotal3 Mask
									//• SR Section SubTotal2 Mask
									//• SR Section SubTotal1 Mask
									//• SR Section Total Mask
								: ($_l_InSection=SR Section SubTotal6) | ($_l_InSection=SR Section SubTotal5) | ($_l_InSection=SR Section SubTotal4) | ($_l_InSection=SR Section SubTotal3) | ($_l_InSection=SR Section SubTotal2) | ($_l_InSection=SR Section SubTotal1) | ($_l_InSection=SR Section SubHeader6)
									DB_bo_CurrentReportEdited:=True:C214
									$_l_SRItemID:=SR Create Object(DB_l_SRarea; String:C10(DB_l_NextObjectID); $_l_MouseY; $_l_MouseX; $_l_MouseY+20; $_l_MouseX+60; SR Object Type Field; 1; 1; DB_al_REPTableNum{$_l_Row}; DB_al_REpFieldNum{$_l_Row})
									If ((DB_al_REPTableNum{$_l_Row})#DB_l_CurrentDisplayedForm)
										$_l_TableNumber:=(DB_al_REPTableNum{$_l_Row})
										$_ptr_Field:=Field:C253(DB_al_REPTableNum{$_l_Row}; DB_al_REpFieldNum{$_l_Row})
										$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
										$_t_ColumnValue:=""
										$_t_Formula:="LB_GetRelation ("+String:C10(DB_l_CurrentDisplayedForm)+";"+String:C10(DB_al_REPTableNum{$_l_Row})+")"
										$_l_SRError:=SR Set Object Scripts(DB_l_SRarea; ($_l_SRItemID); $_t_Formula; ""; "")
									End if 
									//SR Do Command (DB_l_SRarea;208;1)
									DB_l_NextObjectID:=DB_l_NextObjectID+1
									Gen_Confirm("Add a label?"; "Yes"; "No")
									If (OK=1)
										$_ptr_Field:=Field:C253(DB_al_REPTableNum{$_l_Row}; DB_al_REpFieldNum{$_l_Row})
										
										$_t_FieldName:=Field name:C257($_ptr_Field)
										$_t_LabelName:=Gen_Request("Label Name"; $_t_FieldName)
										If (OK=1)
											$_l_SRItemID:=SR Create Object(DB_l_SRarea; String:C10(DB_l_NextObjectID); $_l_MouseY; $_l_MouseX-60; $_l_MouseY+20; $_l_MouseX; SR Object Type Text; 1; 1)
											$_l_ObjectOK:=SR Set Object Data(DB_l_SRarea; $_l_SRItemID; DB_P_StaticPic; $_t_LabelName)
											//SR Do Command (DB_l_SRarea;208;1)
											DB_l_NextObjectID:=DB_l_NextObjectID+1
										End if 
										
									End if 
								: ($_l_InSection=SR Section Body)
									DB_bo_CurrentReportEdited:=True:C214
									$_l_SRItemID:=SR Create Object(DB_l_SRarea; String:C10(DB_l_NextObjectID); $_l_MouseY; $_l_MouseX; $_l_MouseY+20; $_l_MouseX+60; SR Object Type Field; 1; 1; DB_al_REPTableNum{$_l_Row}; DB_al_REpFieldNum{$_l_Row})
									If ((DB_al_REPTableNum{$_l_Row})#DB_l_CurrentDisplayedForm)
										$_l_TableNumber:=(DB_al_REPTableNum{$_l_Row})
										$_ptr_Field:=Field:C253(DB_al_REPTableNum{$_l_Row}; DB_al_REpFieldNum{$_l_Row})
										$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
										$_t_ColumnValue:=""
										$_t_Formula:="LB_GetRelation ("+String:C10(DB_l_CurrentDisplayedForm)+";"+String:C10(DB_al_REPTableNum{$_l_Row})+")"
										$_l_SRError:=SR Set Object Scripts(DB_l_SRarea; ($_l_SRItemID); $_t_Formula; ""; "")
									End if 
									//SR Do Command (DB_l_SRarea;208;1)
									DB_l_NextObjectID:=DB_l_NextObjectID+1
									Gen_Confirm("Add a label?"; "Yes"; "No")
									If (OK=1)
										$_ptr_Field:=Field:C253(DB_al_REPTableNum{$_l_Row}; DB_al_REpFieldNum{$_l_Row})
										
										$_t_FieldName:=Field name:C257($_ptr_Field)
										$_t_LabelName:=Gen_Request("Label Name"; $_t_FieldName)
										If (OK=1)
											$_l_SRItemID:=SR Create Object(DB_l_SRarea; String:C10(DB_l_NextObjectID); $_l_MouseY-22; $_l_MouseX; $_l_MouseY-2; $_l_MouseX+60; SR Object Type Text; 1; 1)
											$_l_ObjectOK:=SR Set Object Data(DB_l_SRarea; $_l_SRItemID; DB_P_StaticPic; $_t_LabelName)
											//SR Do Command (DB_l_SRarea;208;1)
											DB_l_NextObjectID:=DB_l_NextObjectID+1
										End if 
										
									End if 
								: ($_l_InSection=SR Section Footer)
									DB_bo_CurrentReportEdited:=True:C214
									$_l_SRItemID:=SR Create Object(DB_l_SRarea; String:C10(DB_l_NextObjectID); $_l_MouseY; $_l_MouseX; $_l_MouseY+20; $_l_MouseX+60; SR Object Type Field; 1; 1; DB_al_REPTableNum{$_l_Row}; DB_al_REpFieldNum{$_l_Row})
									If ((DB_al_REPTableNum{$_l_Row})#DB_l_CurrentDisplayedForm)
										$_l_TableNumber:=(DB_al_REPTableNum{$_l_Row})
										$_ptr_Field:=Field:C253(DB_al_REPTableNum{$_l_Row}; DB_al_REpFieldNum{$_l_Row})
										$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
										$_t_ColumnValue:=""
										$_t_Formula:="LB_GetRelation ("+String:C10(DB_l_CurrentDisplayedForm)+";"+String:C10(DB_al_REPTableNum{$_l_Row})+")"
										$_l_SRError:=SR Set Object Scripts(DB_l_SRarea; $_l_SRItemID; $_t_Formula; ""; "")
									End if 
									
									//SR Do Command (DB_l_SRarea;208;1)
									DB_l_NextObjectID:=DB_l_NextObjectID+1
									
							End case 
						End if 
					Else 
						
						
						
				End case 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.OSRArea"; $_t_oldMethodName)
