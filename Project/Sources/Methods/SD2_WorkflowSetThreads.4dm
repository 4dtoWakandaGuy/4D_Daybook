//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_WorkflowSetThreads
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_ThreadLevels;0)
	//ARRAY LONGINT(SD2_al_ThreadStates;0)
	C_BOOLEAN:C305($_bo_Exit)
	C_LONGINT:C283($_l_ColumnWIdth; $_l_CountLevels; $_l_FieldNumber; $_l_Index; $_l_Level; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ParentThreadID; $_l_ParentThreadRow)
	C_LONGINT:C283($_l_PictureArrayColumn; $_l_PictureID; $_l_TableNumber; $_l_ThreadID)
	C_PICTURE:C286($_pic_InfoPicture)
	C_POINTER:C301($_ptr_ArrayArrayNames; $_ptr_ArrayFieldPointers; $_ptr_ArrayofColumnWIdths; $_ptr_InfoArray; $_Ptr_ListBox; $_ptr_PictureArray; $_ptr_RecordIDArray; $_ptr_ThreadArray; $_ptr_ThreadIDArray; $1; $2)
	C_TEXT:C284($_t_ButtPrefix; $_t_InfoArray; $_t_ObjectPrefix; $_t_oldMethodName; $_t_PictureArrayName; $_t_RecordsIDArrayName; $_t_ThreadarrayName; $_t_ThreadIDarrayName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_WorkflowSetThreads")
//This method will use the current loaded records and set the threads

If (Count parameters:C259>=1)
	If (Not:C34(Is nil pointer:C315($1)))
		If (Size of array:C274($1->)>0)
			$_ptr_ArrayArrayNames:=$1->{4}
			If (Not:C34(Is nil pointer:C315($_ptr_ArrayArrayNames)))
				If (Size of array:C274($_ptr_ArrayArrayNames->)>0)
					$_ptr_ArrayFieldPointers:=$1->{2}
					$_t_RecordsIDArrayName:=""
					$_t_ThreadIDarrayName:=""
					$_t_ThreadarrayName:=""
					$_t_PictureArrayName:=""
					$_t_InfoArray:=$_ptr_ArrayArrayNames->{Size of array:C274($_ptr_ArrayArrayNames->)-3}
					//ALWAYS THE LAST COLUMN
					For ($_l_Index; 1; Size of array:C274($_ptr_ArrayFieldPointers->))
						$_l_TableNumber:=Table:C252($_ptr_ArrayFieldPointers->{$_l_Index})
						$_l_FIeldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_Index})
						If ($_l_TableNumber=Table:C252(->[PICTURES:85]))
							If ($_l_FIeldNumber=Field:C253(->[PICTURES:85]Picture:3)) & ($_t_PictureArrayName="")
								$_t_PictureArrayName:=$_ptr_ArrayArrayNames->{$_l_Index}
								$_l_PictureArrayColumn:=$_l_Index
							End if 
						End if 
						If ($_l_TableNumber=Table:C252(->[DIARY:12]))
							If ($_l_FIeldNumber=Field:C253(->[DIARY:12]x_ID:50))
								$_t_RecordsIDArrayName:=$_ptr_ArrayArrayNames->{$_l_Index}
							End if 
							If ($_l_FIeldNumber=Field:C253(->[DIARY:12]x_Is_Thread:68))
								$_t_ThreadarrayName:=$_ptr_ArrayArrayNames->{$_l_Index}
							End if 
							If ($_l_FIeldNumber=Field:C253(->[DIARY:12]ThreadID:64))
								$_t_ThreadIDarrayName:=$_ptr_ArrayArrayNames->{$_l_Index}
							End if 
							
						End if 
						If ($_t_RecordsIDArrayName#"") & ($_t_ThreadIDarrayName#"") & ($_t_ThreadarrayName#"") & ($_t_PictureArrayName#"")
							$_l_Index:=Size of array:C274($_ptr_ArrayFieldPointers->)
						End if 
					End for 
					$_l_CountLevels:=0
					If ($_t_RecordsIDArrayName#"") & ($_t_ThreadIDarrayName#"") & ($_t_ThreadarrayName#"") & ($_t_PictureArrayName#"")
						
						
						//We know where the ID and the the thread ID(the parent ID!) and the is a thead and where the picture is to go
						$_ptr_ThreadArray:=Get pointer:C304($_t_ThreadarrayName)
						$_ptr_ThreadIDArray:=Get pointer:C304($_t_ThreadIDarrayName)
						$_ptr_RecordIDArray:=Get pointer:C304($_t_RecordsIDArrayName)
						$_ptr_PictureArray:=Get pointer:C304($_t_PictureArrayName)
						$_ptr_InfoArray:=Get pointer:C304($_t_InfoArray)
						If (Size of array:C274(SD2_al_ThreadLevels)#Size of array:C274($_ptr_ThreadArray->))
							ARRAY LONGINT:C221(SD2_al_ThreadLevels; Size of array:C274($_ptr_ThreadArray->))
							ARRAY LONGINT:C221(SD2_al_ThreadStates; Size of array:C274($_ptr_ThreadArray->))
						End if 
						For ($_l_Index; 1; Size of array:C274($_ptr_ThreadArray->))
							//$_pic_InfoPicture
							//GET PICTURE FROM LIBRARY(418; $_pic_InfoPicture)
							$_pic_InfoPicture:=Get_Picture(418)
							$_ptr_InfoArray->{$_l_Index}:=$_pic_InfoPicture
							If ($_ptr_ThreadArray->{$_l_Index}=False:C215)
								//Set the picture to blank
								SD2_al_ThreadStates{$_l_Index}:=0  //closed
								$_l_PictureID:=0
								//Does not mean it is not part of a thread
								$_l_ThreadID:=$_ptr_ThreadIDArray->{$_l_Index}
								If ($_l_ThreadID=0)  //it is not part of a thread
									SD2_al_ThreadLevels{$_l_Index}:=0
								Else 
									$_l_Level:=1
									$_l_ParentThreadID:=$_ptr_ThreadIDArray->{$_l_Index}
									$_bo_Exit:=False:C215
									Repeat 
										$_l_ParentThreadRow:=Find in array:C230($_ptr_RecordIDArray->; $_l_ParentThreadID)
										If ($_l_ParentThreadRow>0)  //it should be!
											If ($_ptr_ThreadIDArray->{$_l_ParentThreadRow}>0)
												$_l_ParentThreadID:=$_ptr_ThreadIDArray->{$_l_ParentThreadRow}
												$_bo_Exit:=False:C215
												$_l_Level:=$_l_Level+1
											Else 
												$_bo_Exit:=True:C214
											End if 
										Else 
											$_bo_Exit:=True:C214
										End if 
										
									Until ($_bo_Exit)
									SD2_al_ThreadLevels{$_l_Index}:=$_l_Level
								End if 
								
							Else 
								//it is not  a thread..still need to know the leve
								SD2_al_ThreadStates{$_l_Index}:=0  //closed
								$_l_PictureID:=1
								$_l_ThreadID:=$_ptr_ThreadIDArray->{$_l_Index}
								If ($_l_ThreadID=0)  //it is not part of a thread
									SD2_al_ThreadLevels{$_l_Index}:=0
								Else 
									$_l_Level:=1
									$_l_ParentThreadID:=$_ptr_ThreadIDArray->{$_l_Index}
									$_bo_Exit:=False:C215
									Repeat 
										$_l_ParentThreadRow:=Find in array:C230($_ptr_RecordIDArray->; $_l_ParentThreadID)
										If ($_l_ParentThreadRow>0)  //it should be!
											If ($_ptr_ThreadIDArray->{$_l_ParentThreadRow}>0)
												$_l_ParentThreadID:=$_ptr_ThreadIDArray->{$_l_ParentThreadRow}
												$_bo_Exit:=False:C215
												$_l_Level:=$_l_Level+1
											Else 
												$_bo_Exit:=True:C214
											End if 
										Else 
											$_bo_Exit:=True:C214
										End if 
									Until ($_bo_Exit)
									SD2_al_ThreadLevels{$_l_Index}:=$_l_Level
									If ($_l_Level>$_l_CountLevels)
										$_l_CountLevels:=$_l_Level
									End if 
								End if 
								
							End if 
							If ($_l_PictureID=0)
								//GET PICTURE FROM LIBRARY(417; $_pic_InfoPicture)
								$_pic_InfoPicture:=Get_Picture(417)
							Else 
								If (SD2_al_ThreadStates{$_l_Index}=0)  //closed
									//GET PICTURE FROM LIBRARY(402+(SD2_al_ThreadLevels{$_l_Index}-1); $_pic_InfoPicture)
									$_pic_InfoPicture:=Get_Picture(402+(SD2_al_ThreadLevels{$_l_Index}-1))
								Else 
									//GET PICTURE FROM LIBRARY(409+(SD2_al_ThreadLevels{$_l_Index}-1); $_pic_InfoPicture)
									$_pic_InfoPicture:=Get_Picture(409+(SD2_al_ThreadLevels{$_l_Index}-1))
									
								End if 
							End if 
							//Get Picture FROM LIBRARY(416;$_pic_InfoPicture)
							
							$_ptr_PictureArray->{$_l_Index}:=$_pic_InfoPicture
						End for 
						//Set the column width for the levels
						$_l_ColumnWIdth:=($_l_CountLevels*20)  // 2 pixels per level
						If ($_l_PictureArrayColumn>0)
							$_ptr_ArrayofColumnWIdths:=$1->{13}
							$_ptr_ArrayofColumnWIdths->{$_l_PictureArrayColumn}:=$_l_ColumnWIdth
							$_Ptr_ListBox:=$1->{1}
							
							$_ptr_ArrayFieldPointers:=$1->{2}
							RESOLVE POINTER:C394($_ptr_ArrayFieldPointers; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							Case of 
								: ($_t_VariableName="a01FldP")
									$_t_ObjectPrefix:="o1"
									$_t_ButtPrefix:="o1_L"
								: ($_t_VariableName="a02FldP")
									$_t_ObjectPrefix:="o2"
									$_t_ButtPrefix:="o2_L"
								: ($_t_VariableName="a03FldP")
									$_t_ObjectPrefix:="o3"
									$_t_ButtPrefix:="o3_L"
								: ($_t_VariableName="a04FldP")
									$_t_ObjectPrefix:="o4"
									$_t_ButtPrefix:="o4_L"
								: ($_t_VariableName="a05FldP")
									$_t_ObjectPrefix:="o5"
									$_t_ButtPrefix:="o5_L"
								: ($_t_VariableName="a06FldP")
									$_t_ObjectPrefix:="o6"
									$_t_ButtPrefix:="o6_L"
							End case 
							LB_SetColumnWidths($_Ptr_ListBox; $_t_ObjectPrefix; 1; $_l_ColumnWIdth)
							SD2_SetInfoVisible($1; $_Ptr_ListBox)
							
							OBJECT GET COORDINATES:C663($_Ptr_ListBox->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
							//$Ob
						End if 
						
					Else 
						//ERROR
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SD2_WorkflowSetThreads"; $_t_oldMethodName)
