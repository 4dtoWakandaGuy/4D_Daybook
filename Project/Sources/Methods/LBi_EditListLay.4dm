//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_EditListLay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>LB_al_FormTables;0)
	ARRAY LONGINT:C221($_al_SelectedLines; 0)
	//ARRAY TEXT(<>DB_at_LBViews;0)
	//ARRAY TEXT(<>LB_at_EditModes;0)
	ARRAY TEXT:C222($_at_PersonInitials; 0)
	C_BOOLEAN:C305(<>PER_bo_LbDefinitiionsInited; <>PER_bo_SystemSettingAccess; $_bo_ReadOnly; $_bo_Set; $_bo_Switch; $5; LBI_bo_NoEdit)
	C_LONGINT:C283(<>ALselectinEntryMode; <>vALMode; $_l_AddMode; $_l_ArrayType; $_l_Column; $_l_CUrrentDefinitionsFormID; $_l_CurrentWinRefOLD; $_l_FieldNumber; $_l_Index; $_l_ItemRow; $_l_LayoutLevel)
	C_LONGINT:C283($_l_ListboxMode; $_l_No; $_l_Row; $_l_SizeofArray; $_l_TableNumber; $_l_Type2; $_l_TypeArrayPointers; $_l_TypeEnterabilityArray; $_l_TypeFirstColumnArray; LAY_l_CurrentDefsFormID; LAY_l_CurrentDefsTable)
	C_LONGINT:C283(LB_l_ColumnNumber; LB_l_RowNumber; vAdd; vNo; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_PICTURE:C286(<>LB_pic_ModePicture)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayofNumbers; $_ptr_ArrayReferences; $_ptr_EditSetting; $_ptr_EnterabilityArray; $_ptr_LBTable; $_ptr_ListboxArea)
	C_POINTER:C301($_ptr_ListboxSetup; $_Ptr_ThisColumnArray; $1; $2; $3; $4)
	C_TEXT:C284($_t_AreaHandlingSettings; $_t_CloseSave; $_t_CurrentDefinitionsName; $_t_CurrentFormUsage3; $_t_FormName; $_t_LayoutReference; $_t_oldMethodName; $_t_VariableName; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(DB_t_CurrentFormUsage3; LAY_t_CurrentDefsName; LAY_t_CurrentUserDefs)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_EditListLay")

//NG 20/7/06 This method is a replacement for ALEditListLay

$_bo_Switch:=False:C215

If (Count parameters:C259>=1)
	$_ptr_ListboxSetup:=$1
	$_ptr_EditSetting:=$2
	
	//ALEditListLayout definitions - See also ALModeSimple
	
	$_l_Type2:=Type:C295($_ptr_ListboxSetup->)
	If ($_l_Type2=20)
		If (Count parameters:C259>=2)
			$_l_ArrayType:=Type:C295($_ptr_EditSetting->)
			If (Count parameters:C259<4)
				$_l_ListboxMode:=$_ptr_EditSetting->
			Else 
				$_l_Row:=$_ptr_EditSetting->
				$_ptr_ArrayofNumbers:=$4
				If ($_l_Row>0) & ($_l_Row<=Size of array:C274($_ptr_ArrayofNumbers->))
					//$_ptr_ArrayofNumbers contains the current mode
					$_l_ListboxMode:=$_ptr_ArrayofNumbers->{$_l_Row}  //$_ptr_ArrayofNumbers is a pointer to an array of the NUMBERs associated-this is so we can get rid of 'editable and selectable' from the list
				Else 
					$_l_ListboxMode:=1
				End if 
			End if 
			If (Count parameters:C259>=5)
				$_bo_Switch:=$5
				If ($_bo_Switch)  //& (False)
					Case of 
						: ($_l_ListboxMode=1) | ($_l_ListboxMode=2)
							$_l_ListboxMode:=-1
						: ($_l_ListboxMode=-1)
							$_l_ListboxMode:=2
					End case 
				End if 
				
			End if 
		Else 
			$_l_ArrayType:=Type:C295(<>LB_at_EditModes)
			$_l_ListboxMode:=1
		End if 
		RESOLVE POINTER:C394($_ptr_ListboxSetup; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SizeofArray:=Size of array:C274($_ptr_ListboxSetup->)
		//Gen_Alert ("Called from "+$_t_oldMethodName+"$_ptr_ListboxSetup="+$_t_VariableName+"And has a size of"+String($_l_SizeofArray))
		If (Not:C34(Undefined:C82($_ptr_ListboxSetup->)))
			If (Size of array:C274($_ptr_ListboxSetup->)>0)
				$_ptr_ListboxSetup:=$1
				$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
				$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
				$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
				//``
				$_t_AreaHandlingSettings:=$_ptr_ArrayReferences->{4}
				If ($_t_AreaHandlingSettings#"")
					If ($_t_AreaHandlingSettings[[1]]="3")
						//The setting must be selectable not editable
						If ($_l_ListboxMode<3)
							$_l_ListboxMode:=-1
						End if 
					End if 
				End if 
				$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
				$_l_TypeArrayPointers:=Type:C295($_ptr_ArrayofArrayPointers->)
				$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
				$_l_TypeEnterabilityArray:=Type:C295($_ptr_EnterabilityArray->)
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
				$_l_TypeFirstColumnArray:=Type:C295($_Ptr_ThisColumnArray->)
				
				LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_Column; $_l_Row)
				
				If ((($_l_TypeFirstColumnArray=21) | ($_l_TypeFirstColumnArray=17)) & ($_l_TypeArrayPointers=20) & ($_l_TypeEnterabilityArray=22)) | (True:C214)
					$_l_SizeofArray:=Size of array:C274($_Ptr_ThisColumnArray->)
					
					//``
					If ($_l_ListboxMode=0)  // NG this should now never be 0 here
						If (<>vALMode=1)
							$_l_ListboxMode:=2
						Else 
							$_l_ListboxMode:=1
						End if 
					End if 
					
					Case of 
						: (($_l_ListboxMode=-1)) | (LBI_bo_NoEdit)  // NG MODIFIIED SO WE ALWAYS GOTO EDITABLE
							If ($_l_ListboxMode=-1)
								If (Count parameters:C259>=4) & ($_bo_Switch)
									$_l_ItemRow:=Find in array:C230($_ptr_EditSetting->; "No Edit")
									If ($_l_ItemRow>0)
										$_ptr_EditSetting->{$_l_ItemRow}:="Edit"
										$_ptr_ArrayofNumbers->{$_l_ItemRow}:=-1
									Else 
										$_l_ItemRow:=Find in array:C230($_ptr_EditSetting->; "Edit")
										If ($_l_ItemRow>0)
											$_ptr_EditSetting->{$_l_ItemRow}:="Edit"
											$_ptr_ArrayofNumbers->{$_l_ItemRow}:=-1
										End if 
									End if 
								End if 
							End if 
							//NG TODO AL_GetPrevCell ($_ptr_ListboxArea->;bd36;bd37)
							//NG TODOAL_ExitCell ($_ptr_ListboxArea->)
							//NG TODO AL_SetEntryOpts ($_ptr_ListboxArea->;1;0;0;0;0)
							If ($_l_Row=0)
								If (Size of array:C274($_ptr_ArrayofArrayPointers->)>0)
									$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
									If (Size of array:C274($_Ptr_ThisColumnArray->)>0)
										$_l_Row:=1
									End if 
								End if 
							End if 
							If (Count parameters:C259<3)
								//GET PICTURE FROM LIBRARY(20261; <>LB_pic_ModePicture)
								<>LB_pic_ModePicture:=Get_Picture(20261)
								
							Else 
								///GET PICTURE FROM LIBRARY(20261;$3-> )
								$3->:=Get_Picture(20261)
								
							End if 
							$_ptr_LBTable:=$_ptr_ListboxSetup->{10}
							$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
							For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
								If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
									$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
									OBJECT SET ENTERABLE:C238($_Ptr_ThisColumnArray->; False:C215)
								Else 
									$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
									OBJECT SET ENTERABLE:C238($_Ptr_ThisColumnArray->; False:C215)
								End if 
								
								
							End for 
							LBi_SetSelect1($_ptr_ListboxArea; $_l_Row)
							//OK:=0
							<>vALMode:=1
							
						: (($_l_ListboxMode=2) | ($_l_ListboxMode=1) | ($_l_ListboxMode=0))  //& ($_bo_Switch)
							If (Count parameters:C259>=4)
								$_l_ItemRow:=Find in array:C230($_ptr_EditSetting->; "Edit")
								If ($_l_ItemRow>0)
									$_ptr_EditSetting->{$_l_ItemRow}:="No Edit"
									$_ptr_ArrayofNumbers->{$_l_ItemRow}:=2
								Else 
									$_l_ItemRow:=Find in array:C230($_ptr_EditSetting->; "No Edit")
									If ($_l_ItemRow>0)
										$_ptr_EditSetting->{$_l_ItemRow}:="No Edit"
										$_ptr_ArrayofNumbers->{$_l_ItemRow}:=2
									End if 
								End if 
							End if 
							ARRAY LONGINT:C221($_al_SelectedLines; 0)
							//$_l_SizeofArray:=AL_GetSelect ($_ptr_ListboxArea->;$_al_SelectedLines)
							LB_GetSelect($_ptr_ListboxArea; ->$_al_SelectedLines)
							$_ptr_LBTable:=$_ptr_ListboxSetup->{10}
							If (Size of array:C274($_al_SelectedLines)>0)
								$_l_SizeofArray:=$_al_SelectedLines{1}
							Else 
								If ($_l_Row=0)
									If (Size of array:C274($_ptr_ArrayofArrayPointers->)>0)
										$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
										If (Size of array:C274($_Ptr_ThisColumnArray->)>0)
											$_l_Row:=1
										End if 
									End if 
								End if 
								
							End if 
							$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
							For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
								If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
									$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
									OBJECT SET ENTERABLE:C238($_Ptr_ThisColumnArray->; True:C214)
								Else 
									$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
									OBJECT SET ENTERABLE:C238($_Ptr_ThisColumnArray->; False:C215)
								End if 
								
							End for 
							
							
							If (<>ALselectinEntryMode=1)
								//AL_SetEntryOpts ($_ptr_ListboxArea->;3;0;0;0;1)
							Else 
								//AL_SetEntryOpts ($_ptr_ListboxArea->;2;0;0;0;1)
							End if 
							GOTO OBJECT:C206($_ptr_ListboxArea->)
							$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
							For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
								If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
									LB_GoToCell($_ptr_ListboxArea; $_l_SizeofArray; $_l_Index)
									$_l_SizeofArray:=Size of array:C274($_ptr_EnterabilityArray->)
									$_bo_Set:=True:C214
								End if 
								
							End for 
							
							
							//OK:=0
							<>vALMode:=2
							If (Count parameters:C259<3)
								
								//GET PICTURE FROM LIBRARY(20260; <>LB_pic_ModePicture)
								<>LB_pic_ModePicture:=Get_Picture(20260)
								
							Else 
								//GET PICTURE FROM LIBRARY(20260; $3->)
								$3->:=Get_Picture(20260)
							End if 
						: ($_l_ListboxMode=3)
							If ((<>PER_bo_SystemSettingAccess) & (<>PER_bo_LbDefinitiionsInited))
								LBi_DelBckgrdElem($_ptr_ListboxSetup)  //deletes elements from the Interproc arrays
								LBi_pRefs4upd($_ptr_ListboxSetup)  //update the records to reflect changes to the arrays
								
								$_t_CurrentDefinitionsName:=DB_t_CurrentFormUsage2
								$_t_CurrentFormUsage3:=DB_t_CurrentFormUsage3
								$_l_AddMode:=vAdd
								$_l_No:=vNo
								DB_t_CurrentFormUsage2:=$_ptr_ArrayReferences->{6}
								DB_t_CurrentFormUsage3:=$_ptr_ArrayReferences->{7}
								$_t_CurrentFormUsage3:=DB_t_CurrentFormUsage3
								$_t_CurrentDefinitionsName:=DB_t_CurrentFormUsage2
								$_l_LayoutLevel:=Num:C11(Substring:C12(DB_t_CurrentFormUsage2; 1; 3))
								LAY_l_CurrentDefsTable:=$_l_LayoutLevel
								LAY_t_CurrentUserDefs:=$_ptr_ArrayReferences->{7}
								LAY_t_CurrentDefsName:=$_ptr_ArrayReferences->{6}
								$_l_CUrrentDefinitionsFormID:=Num:C11(Substring:C12(DB_t_CurrentFormUsage2; 4))
								LAY_l_CurrentDefsFormID:=$_l_CUrrentDefinitionsFormID
								TRACE:C157
								$_l_LayoutLevel:=Num:C11(Substring:C12(DB_t_CurrentFormUsage2; 1; 3))
								$_l_CUrrentDefinitionsFormID:=Num:C11(Substring:C12(DB_t_CurrentFormUsage2; 4; 2))
								$_t_FormName:=LBI_GetLayoutName(DB_t_CurrentFormUsage2)
								If ($_t_FormName="")
									LB_CheckLayouts($_l_LayoutLevel)
									$_l_Row:=Find in array:C230(<>LB_al_FormTables; $_l_LayoutLevel)
									If ($_l_Row>0)
										If ($_l_CUrrentDefinitionsFormID<=Size of array:C274(<>DB_at_LBViews{$_l_Row}))
											$_t_FormName:=<>DB_at_LBViews{$_l_Row}{$_l_CUrrentDefinitionsFormID}
										Else 
											$_t_FormName:="??"
										End if 
									Else 
										$_t_FormName:="??"
									End if 
								End if 
								$_t_CloseSave:=DB_t_CallOnCloseorSave
								DB_t_CallOnCloseorSave:="DClose"
								Open_Pro_Window("Definitions for "+$_t_FormName; 0; 1; ->[LIST_LAYOUTS:96]; "Layouts_Out")
								DIALOG:C40("LAYOUT_CONFIG")
								Close_ProWin
								If ($_t_CurrentFormUsage3="")
									Gen_Confirm("You have been editing the Default Listing Layout Definitions.  "+"You might therefore like to Delete all Personal Definitions"+" (ie those with Personnel Initials)"+" in order that they will revert to the Default."; "Keep them"; "Delete them")
									If (OK=0)
										Gen_Confirm("Are you sure you want to Delete the Personal Definitions?"; "No"; "Yes")
										If (OK=0)
											ALL RECORDS:C47([PERSONNEL:11])
											SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; $_at_PersonInitials)
											$_l_SizeofArray:=Size of array:C274($_at_PersonInitials)
											For ($_l_Index; 1; $_l_SizeofArray)
												$_t_LayoutReference:=$_t_CurrentDefinitionsName+$_at_PersonInitials{$_l_Index}
												QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_LayoutReference)
												DELETE SELECTION:C66([LIST_LAYOUTS:96])
											End for 
										End if 
									End if 
								End if 
								DB_t_CallOnCloseorSave:=$_t_CloseSave
								
								READ ONLY:C145([LIST_LAYOUTS:96])
								UNLOAD RECORD:C212([LIST_LAYOUTS:96])
								vAdd:=$_l_AddMode
								DB_t_CurrentFormUsage2:=$_t_CurrentDefinitionsName
								DB_t_CurrentFormUsage3:=$_t_CurrentFormUsage3  //$_t_CurrentFormUsage3
								vNo:=$_l_No
								$_l_ListboxMode:=0
								If (Count parameters:C259>=2)
									$_ptr_EditSetting->:=$_l_ListboxMode
								Else 
									<>LB_at_EditModes:=$_l_ListboxMode
								End if 
								
							Else 
								Gen_AlertAcc("Listing Layout Definitions")
								//OK:=0
								If (Count parameters:C259>=2)
									$_ptr_EditSetting->:=0
								Else 
									<>LB_at_EditModes:=0
								End if 
							End if 
							
							
						: ($_l_ListboxMode=4)  //Nothing to do with AL
							//To set up the diary tabs displayed in the area list area
							
							$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
							WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 4)
							DIALOG:C40([USER:15]; "SD2_TabSettingForm")
							CLOSE WINDOW:C154
							WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
							If (Count parameters:C259>=2)
								$_ptr_EditSetting->:=0
							Else 
								<>LB_at_EditModes:=0
							End if 
							
							
					End case 
				Else 
					//TRACE
				End if 
				
				
			End if 
		Else 
			//TRACE
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("LBi_EditListLay"; $_t_oldMethodName)
////
