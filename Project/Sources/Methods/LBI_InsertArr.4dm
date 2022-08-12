//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_InsertArr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  05/06/2010 15:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Exit)
	C_LONGINT:C283($_l_AreaType; $_l_ArrayLevel; $_l_ArrayNumber; $_l_DataType; $_l_InsertAt; $_l_offset; $3; $5)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayFontName; $_ptr_ArrayFontStyle; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_ptr_ArrayofColumnColors; $_ptr_ArrayofColumnFonts; $_ptr_ArrayofColumnFooters; $_ptr_ArrayofColumnLabels)
	C_POINTER:C301($_ptr_ArrayofColumnLockFlags; $_ptr_ArrayofColumnWIdths; $_Ptr_ArrayofFormulas; $_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_ptr_ListboxSetup; $_Ptr_ThisArray; $1; $2; $4)
	C_TEXT:C284($_t_LevelID; $_t_oldMethodName; $_t_ThisArrayName; $6; $7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBI_InsertArr")
//this special method adds an array to the setup of list box area  regardless of the Definitions!
//NG NOTE  December 2008. If the table is a subtable the last column is a reference to the subtable, if you insert at the end then the cells wont get populated
//and in fact will make the key' field appear..so if doing this for a subtable make sure you pass one less than the size of the array..or 1
//note that this column cannot be used for sorting i think
If (Count parameters:C259>=5)
	If (Not:C34(Is nil pointer:C315($1)))
		$_ptr_ListboxSetup:=$1
		If (Size of array:C274($_ptr_ListboxSetup->)>0)
			$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
			If (Size of array:C274($_ptr_ListboxSetup->)>=19)
				$_ptr_areaTypeVariable:=$_ptr_ListboxSetup->{19}
				$_l_AreaType:=$_ptr_areaTypeVariable->
			Else 
				$_l_AreaType:=1
			End if 
			If ($_l_AreaType<3)  //its an array based format
				If (Not:C34(Is nil pointer:C315($_ptr_ArrayOfArrayNames)))
					If (Size of array:C274($_ptr_ArrayOfArrayNames->)>0)
						//all just to protect against errrrors
						$_t_ThisArrayName:=$_ptr_ArrayOfArrayNames->{1}
						$_l_ArrayLevel:=Num:C11(Substring:C12($_t_ThisArrayName; 1; 5))
						
						
						$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
						$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
						$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
						$_t_LevelID:=$_ptr_ArrayReferences->{1}
						
						$_ptr_ArrayFontName:=Get pointer:C304("L_at_"+$_t_LevelID+"FontName")
						$_ptr_ArrayFontStyle:=Get pointer:C304("LB_al_"+$_t_LevelID+"FontStyle")
						
						If ($3>0)  // Pass 0 to insert at the end
							$_l_InsertAt:=$3
						Else 
							$_l_InsertAt:=Size of array:C274($_ptr_ArrayFieldPointers->)+1
						End if 
						INSERT IN ARRAY:C227($_ptr_ArrayFieldPointers->; $_l_InsertAt; 1)
						$_ptr_ArrayFieldPointers->{$_l_InsertAt}:=$4  // `Pointer to the field to point at
						INSERT IN ARRAY:C227($_ptr_ArrayofArrayPointers->; $_l_InsertAt; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayOfArrayNames->; $_l_InsertAt; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayFontName->; $_l_InsertAt; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayFontStyle->; $_l_InsertAt; 1)
						
						$_bo_Exit:=False:C215
						$_l_ArrayNumber:=1
						$_l_DataType:=Type:C295($4->)
						If ($_l_ArrayLevel<10)
							$_t_LevelID:="0"
						Else 
							$_t_LevelID:=""
						End if 
						Repeat 
							Case of 
								: ($_l_DataType=Is alpha field:K8:1)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_at_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is text:K8:3)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_at_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is real:K8:4)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_ar_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is date:K8:7)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_ad_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is boolean:K8:9)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_abo_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is longint:K8:6)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_al_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is integer:K8:5)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_ai_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is picture:K8:10)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_apic_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is time:K8:8)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_ati_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
							End case 
							If ($_l_offset<0)
								$_bo_Exit:=True:C214
							Else 
								$_l_ArrayNumber:=$_l_ArrayNumber+1
							End if 
						Until ($_bo_Exit)
						$_l_DataType:=Type:C295($4->)
						Case of 
								
							: ($_l_DataType=Is alpha field:K8:1)
								$_Ptr_ThisArray:=Get pointer:C304("LB_at_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_at_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
							: ($_l_DataType=Is text:K8:3)
								$_Ptr_ThisArray:=Get pointer:C304("LB_at_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_at_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
							: ($_l_DataType=Is real:K8:4)
								$_Ptr_ThisArray:=Get pointer:C304("LB_ar_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_ar_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
								
							: ($_l_DataType=Is date:K8:7)
								$_Ptr_ThisArray:=Get pointer:C304("LB_ad_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_ad_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
								
							: ($_l_DataType=Is picture:K8:10)
								$_Ptr_ThisArray:=Get pointer:C304("LB_apic_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_apic_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
								
							: ($_l_DataType=Is time:K8:8)
								$_Ptr_ThisArray:=Get pointer:C304("LB_ati_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_ati_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
								
								
							: ($_l_DataType=Is boolean:K8:9)
								$_Ptr_ThisArray:=Get pointer:C304("LB_abo_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_abo_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
								
								
							: ($_l_DataType=Is longint:K8:6)
								$_Ptr_ThisArray:=Get pointer:C304("LB_al_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_al_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
								
								
								
							: ($_l_DataType=Is integer:K8:5)
								$_Ptr_ThisArray:=Get pointer:C304("LB_ai_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_ai_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
								
								
								
						End case 
						$_ptr_ArrayOfColumFormats:=$_ptr_ListboxSetup->{5}
						INSERT IN ARRAY:C227($_ptr_ArrayOfColumFormats->; $_l_InsertAt; 1)
						$_ptr_ArrayOfColumFormats->{$_l_InsertAt}:="3"
						$_Ptr_ArrayofFormulas:=$_ptr_ListboxSetup->{6}
						INSERT IN ARRAY:C227($_Ptr_ArrayofFormulas->; $_l_InsertAt; 1)
						$_Ptr_ArrayofFormulas->{$_l_InsertAt}:=""
						// a problem here if the field is a subtable field..the field name needs to be passed as well
						If (Count parameters:C259>=7)
							$_Ptr_ArrayofFormulas->{$_l_InsertAt}:=$7
						End if 
						$_ptr_ArrayofColumnLabels:=$_ptr_ListboxSetup->{12}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnLabels->; $_l_InsertAt; 1)
						If (Count parameters:C259>=6)
							$_ptr_ArrayofColumnLabels->{$_l_InsertAt}:=$6
							
						Else 
							$_ptr_ArrayofColumnLabels->{$_l_InsertAt}:=""
						End if 
						$_ptr_ArrayofColumnWIdths:=$_ptr_ListboxSetup->{13}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnWIdths->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnWIdths->{$_l_InsertAt}:=$5
						$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
						INSERT IN ARRAY:C227($_ptr_EnterabilityArray->; $_l_InsertAt; 1)
						$_ptr_EnterabilityArray->{$_l_InsertAt}:=False:C215
						$_ptr_ArrayofColumnLockFlags:=$_ptr_ListboxSetup->{15}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnLockFlags->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnLockFlags->{$_l_InsertAt}:=False:C215
						$_ptr_ArrayofColumnFonts:=$_ptr_ListboxSetup->{16}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnFonts->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnFonts->{$_l_InsertAt}:=9
						$_ptr_ArrayofColumnColors:=$_ptr_ListboxSetup->{17}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnColors->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnColors->{$_l_InsertAt}:="Black"
						$_ptr_ArrayofColumnFooters:=$_ptr_ListboxSetup->{18}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnFooters->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnFooters->{$_l_InsertAt}:=1
						
					End if 
					
				End if 
			Else 
				//TRACE
				//The columns are field based we just need to add a formula based column in
				If (Not:C34(Is nil pointer:C315($_ptr_ArrayOfArrayNames)))
					If (Size of array:C274($_ptr_ArrayOfArrayNames->)>0)
						//all just to protect against errrrors
						$_t_ThisArrayName:=$_ptr_ArrayOfArrayNames->{1}
						$_l_ArrayLevel:=Num:C11(Substring:C12($_t_ThisArrayName; 1; 5))
						
						
						$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
						$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
						$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
						$_t_LevelID:=$_ptr_ArrayReferences->{1}
						$_ptr_ArrayFontName:=Get pointer:C304("LB_at_"+$_t_LevelID+"FontName")
						$_ptr_ArrayFontStyle:=Get pointer:C304("LB_al_"+$_t_LevelID+"FontStyle")
						
						If ($3>0)  // Pass 0 to insert at the end
							$_l_InsertAt:=$3
						Else 
							$_l_InsertAt:=Size of array:C274($_ptr_ArrayFieldPointers->)+1
						End if 
						INSERT IN ARRAY:C227($_ptr_ArrayFieldPointers->; $_l_InsertAt; 1)
						$_ptr_ArrayFieldPointers->{$_l_InsertAt}:=$4  // `Pointer to the field to point at
						INSERT IN ARRAY:C227($_ptr_ArrayofArrayPointers->; $_l_InsertAt; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayOfArrayNames->; $_l_InsertAt; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayFontName->; $_l_InsertAt; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayFontStyle->; $_l_InsertAt; 1)
						
						$_bo_Exit:=False:C215
						$_l_ArrayNumber:=1
						$_l_DataType:=Type:C295($4->)
						If ($_l_ArrayLevel<10)
							$_t_LevelID:="0"
						Else 
							$_t_LevelID:=""
						End if 
						Repeat 
							Case of 
								: ($_l_DataType=Is alpha field:K8:1)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_at_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is text:K8:3)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_at_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is real:K8:4)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_ar_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is date:K8:7)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_ad_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is time:K8:8)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_ati_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is picture:K8:10)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_apic_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is boolean:K8:9)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_abo_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is longint:K8:6)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_al_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								: ($_l_DataType=Is integer:K8:5)
									$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_ai_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
									
							End case 
							If ($_l_offset<0)
								$_bo_Exit:=True:C214
							Else 
								$_l_ArrayNumber:=$_l_ArrayNumber+1
							End if 
						Until ($_bo_Exit)
						$_l_DataType:=Type:C295($4->)
						Case of 
								
							: ($_l_DataType=Is alpha field:K8:1)
								$_Ptr_ThisArray:=Get pointer:C304("LB_at_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_at_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
							: ($_l_DataType=Is text:K8:3)
								$_Ptr_ThisArray:=Get pointer:C304("LB_at_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_at_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
							: ($_l_DataType=Is real:K8:4)
								$_Ptr_ThisArray:=Get pointer:C304("LB_ar_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_ar_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
								
							: ($_l_DataType=Is date:K8:7)
								$_Ptr_ThisArray:=Get pointer:C304("LB_ad_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_ad_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
								
							: ($_l_DataType=Is boolean:K8:9)
								$_Ptr_ThisArray:=Get pointer:C304("LB_abo_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_abo_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
								
								
							: ($_l_DataType=Is longint:K8:6)
								$_Ptr_ThisArray:=Get pointer:C304("LB_al_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_al_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
								
								
							: ($_l_DataType=Is integer:K8:5)
								$_Ptr_ThisArray:=Get pointer:C304("LB_ai_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_ai_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
								
							: ($_l_DataType=Is picture:K8:10)
								$_Ptr_ThisArray:=Get pointer:C304("LB_apic_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_apic_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
							: ($_l_DataType=Is time:K8:8)
								$_Ptr_ThisArray:=Get pointer:C304("LB_ati_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber))
								$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_Ptr_ThisArray
								$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_ati_"+$_t_LevelID+String:C10($_l_ArrayLevel)+"_"+String:C10($_l_ArrayNumber)
								
								
						End case 
						$_ptr_ArrayOfColumFormats:=$_ptr_ListboxSetup->{5}
						INSERT IN ARRAY:C227($_ptr_ArrayOfColumFormats->; $_l_InsertAt; 1)
						$_ptr_ArrayOfColumFormats->{$_l_InsertAt}:="3"
						$_Ptr_ArrayofFormulas:=$_ptr_ListboxSetup->{6}
						INSERT IN ARRAY:C227($_Ptr_ArrayofFormulas->; $_l_InsertAt; 1)
						$_Ptr_ArrayofFormulas->{$_l_InsertAt}:=""
						// a problem here if the field is a subtable field..the field name needs to be passed as well
						If (Count parameters:C259>=7)
							$_Ptr_ArrayofFormulas->{$_l_InsertAt}:=$7
						End if 
						$_ptr_ArrayofColumnLabels:=$_ptr_ListboxSetup->{12}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnLabels->; $_l_InsertAt; 1)
						If (Count parameters:C259>=6)
							$_ptr_ArrayofColumnLabels->{$_l_InsertAt}:=$6
							
						Else 
							$_ptr_ArrayofColumnLabels->{$_l_InsertAt}:=""
						End if 
						$_ptr_ArrayofColumnWIdths:=$_ptr_ListboxSetup->{13}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnWIdths->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnWIdths->{$_l_InsertAt}:=$5
						$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
						INSERT IN ARRAY:C227($_ptr_EnterabilityArray->; $_l_InsertAt; 1)
						$_ptr_EnterabilityArray->{$_l_InsertAt}:=False:C215
						$_ptr_ArrayofColumnLockFlags:=$_ptr_ListboxSetup->{15}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnLockFlags->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnLockFlags->{$_l_InsertAt}:=False:C215
						$_ptr_ArrayofColumnFonts:=$_ptr_ListboxSetup->{16}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnFonts->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnFonts->{$_l_InsertAt}:=9
						$_ptr_ArrayofColumnColors:=$_ptr_ListboxSetup->{17}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnColors->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnColors->{$_l_InsertAt}:="Black"
						$_ptr_ArrayofColumnFooters:=$_ptr_ListboxSetup->{18}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnFooters->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnFooters->{$_l_InsertAt}:=1
						
					End if 
					
				End if 
				
				
				
				
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("LBI_InsertArr"; $_t_oldMethodName)