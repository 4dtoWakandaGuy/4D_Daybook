//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_LoadFtrs
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
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aPtr_FooterVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_FooterNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_BOOLEAN:C305($_bo_Footer)
	C_LONGINT:C283($_l_4DFooterType; $_l_AreaType; $_l_BackGround; $_l_ColumnColour; $_l_DataType; $_l_FieldNumber; $_l_FooterOffset; $_l_FootersCount; $_l_FootersHeight; $_l_FooterType; $_l_Foreground)
	C_LONGINT:C283($_l_Height; $_l_Index; $_l_Index2; $_l_NumberOfColumns; $_l_NumberofRows; $_l_TableNumber; LBI_l_FooterSet)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_ptr_ArrayofColumnFooters; $_ptr_LBTable; $_Ptr_ListBox; $_ptr_ListboxSetup; $_ptr_Table; $_Ptr_ThisColumnArray; $_Ptr_ThisColumnField)
	C_POINTER:C301($_ptr_ThisColumnPointer; $1)
	C_REAL:C285($_r_FooterCalculation; $2)
	C_TEXT:C284($_t_BackGround; $_t_ColumnFormat; $_t_FooterValueasString; $_t_Foreground; $_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_LoadFtrs")

//This method will be used to FILL the footers. This is a direct replacement for ALLoadFTRS

//NG 13/7/2006
//note that as I write this we have not created a way to display footers on the list box areas..that will be added in there
//NG 29/09/2006 Footers now work
If (Count parameters:C259>=2)
	LBI_l_FooterSet:=$2
Else 
	LBI_l_FooterSet:=1
End if 

//ALLoadFtrs - fill in Ftrs values



$_l_FooterOffset:=0
$_ptr_ListboxSetup:=$1
$_Ptr_ListBox:=$_ptr_ListboxSetup->{1}
RESOLVE POINTER:C394($_Ptr_ListBox; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
//OBJECT SET VISIBLE(*; "oFootRct"+$_t_VariableName; False)
$_ptr_LBTable:=$_ptr_ListboxSetup->{7}

$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
$_ptr_ArrayOfColumFormats:=$_ptr_ListboxSetup->{5}
$_ptr_ArrayofColumnFooters:=$_ptr_ListboxSetup->{18}
//$_ptr_ArrayofColumnLabels:=$1->{12}
If (Size of array:C274($_ptr_ListboxSetup->)>=19)
	$_ptr_areaTypeVariable:=$_ptr_ListboxSetup->{19}
	$_l_AreaType:=$_ptr_areaTypeVariable->
Else 
	$_l_AreaType:=1
End if 

$_l_NumberOfColumns:=Size of array:C274($_ptr_ArrayofArrayPointers->)
$_l_NumberOfColumns:=LISTBOX Get number of columns:C831($_Ptr_ListBox->)
ARRAY TEXT:C222($_at_ColumnNames; 0)
ARRAY TEXT:C222($_at_HeaderNames; 0)
ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
ARRAY TEXT:C222($_at_FooterNames; 0)
ARRAY POINTER:C280($_aPtr_FooterVars; 0)
LISTBOX GET ARRAYS:C832($_Ptr_ListBox->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles; $_at_FooterNames; $_aPtr_FooterVars)
//TRACE  // OBJECT SET VISIBLE(*;"header3";False)
If (False:C215)
	//$_l_FooterOffset:=LB_SetFooters($_Ptr_ListBox; 1; 20; $_l_FooterOffset)  // That will set them all to invisible
	
	$_l_FooterOffset:=0
	
End if 
If ($_l_NumberOfColumns>0)
	$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
	If ($_l_AreaType<3)
		$_l_NumberofRows:=Size of array:C274($_Ptr_ThisColumnArray->)
		If ($_l_NumberofRows>0)
			$_l_FootersCount:=0
			For ($_l_Index; 1; $_l_NumberOfColumns)
				$_ptr_ThisColumnPointer:=$_aPtr_FooterVars{$_l_Index}
				OBJECT SET VISIBLE:C603($_ptr_ThisColumnPointer->; False:C215)
			End for 
			For ($_l_Index; 1; $_l_NumberOfColumns)
				//$ColLeft:=$ColRight
				//$ColRight:=$ColLeft+($_ptr_ArrayofColumnWIdths->{$_l_Index})
				
				If ($_ptr_ArrayofColumnFooters->{$_l_Index}>1)
					$_l_FootersCount:=$_l_FootersCount+1
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
					$_l_DataType:=Type:C295($_Ptr_ThisColumnArray->)
					$_l_FooterType:=$_ptr_ArrayofColumnFooters->{$_l_Index}
					
					$_l_4DFooterType:=0
					Case of 
						: ($_l_FooterType=2)
							$_t_FooterValueasString:=String:C10($_l_NumberofRows)
							$_l_4DFooterType:=1
						: ($_l_FooterType=3)
							$_r_FooterCalculation:=0
							For ($_l_Index2; 1; $_l_NumberofRows)
								If (Type:C295($_Ptr_ThisColumnArray->{$_l_Index2})=Type:C295($_r_FooterCalculation))
									$_r_FooterCalculation:=$_r_FooterCalculation+$_Ptr_ThisColumnArray->{$_l_Index2}
								End if 
							End for 
							$_t_FooterValueasString:=String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer sum:K70:4
						: ($_l_FooterType=4)
							$_r_FooterCalculation:=0
							For ($_l_Index2; 1; $_l_NumberofRows)
								If (Type:C295($_Ptr_ThisColumnArray->{$_l_Index2})=Type:C295($_r_FooterCalculation))
									$_r_FooterCalculation:=$_r_FooterCalculation+$_Ptr_ThisColumnArray->{$_l_Index2}
								End if 
								
							End for 
							$_r_FooterCalculation:=$_r_FooterCalculation/$_l_NumberofRows
							$_t_FooterValueasString:="Av: "+String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer average:K70:6
						: ($_l_FooterType=5)
							$_r_FooterCalculation:=0
							For ($_l_Index2; 1; $_l_NumberofRows)
								If ($_Ptr_ThisColumnArray->{$_l_Index2}>$_r_FooterCalculation)
									If (Type:C295($_Ptr_ThisColumnArray->{$_l_Index2})=Type:C295($_r_FooterCalculation))
										$_r_FooterCalculation:=$_Ptr_ThisColumnArray->{$_l_Index2}
									End if 
								End if 
							End for 
							$_t_FooterValueasString:="Hi: "+String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer max:K70:3
						: ($_l_FooterType=6)
							$_r_FooterCalculation:=999999999
							For ($_l_Index2; 1; $_l_NumberofRows)
								If ($_Ptr_ThisColumnArray->{$_l_Index2}<$_r_FooterCalculation)
									If (Type:C295($_Ptr_ThisColumnArray->{$_l_Index2})=Type:C295($_r_FooterCalculation))
										$_r_FooterCalculation:=$_Ptr_ThisColumnArray->{$_l_Index2}
									End if 
								End if 
							End for 
							$_t_FooterValueasString:="Lo: "+String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer min:K70:2
							
					End case 
					
					
					If ($_l_4DFooterType>0) & ($_at_FooterNames{$_l_Index}#"")
						//TRACE
						$_bo_Footer:=True:C214
						$_ptr_ThisColumnPointer:=$_aPtr_FooterVars{$_l_Index}
						If ($_l_4DFooterType=1) & ($_l_AreaType<3)  //& ((Type($_ptr_ThisColumnPointer->)=Is Text) | (Type($_ptr_ThisColumnPointer->)=Is String Var))
							
							//TRACE
							$_l_4DFooterType:=5
							//$_ptr_ThisColumnPointer->:=$_t_FooterValueasString
						Else 
							
						End if 
						OBJECT SET VISIBLE:C603($_ptr_ThisColumnPointer->; True:C214)
						//$_l_ColumnColour:=-(Black+(256*Light grey))
						$_t_Foreground:=UTIL_4DColorToRGB(Black:K11:16)
						$_t_BackGround:=UTIL_4DColorToRGB(Light grey:K11:13)
						OBJECT SET RGB COLORS:C628($_ptr_ThisColumnPointer->; $_t_Foreground; $_t_BackGround)
						//_O_OBJECT SET COLOR($_ptr_ThisColumnPointer->;$_l_ColumnColour)
						OBJECT SET FONT STYLE:C166($_ptr_ThisColumnPointer->; Bold:K14:2)
						
						$_l_FootersHeight:=LISTBOX Get footers height:C1146($_ptr_ThisColumnPointer->)
						//TRACE
						//Case of 
						//:($_l_DataType=
						//LISTBOX SET FOOTER CALCULATION($_ptr_ThisColumnPointer->;$_l_4DFooterType)
						//End case 
						// /
						//NG july 2019 trying to takle a long since ignored issue of a adata type mismatch here-can only do the right type of footers
						
						Case of 
							: ($_l_DataType=Is longint:K8:6) | ($_l_DataType=Is real:K8:4) | ($_l_DataType=Is integer:K8:5) | ($_l_DataType=LongInt array:K8:19) | ($_l_DataType=Real array:K8:17) | ($_l_DataType=Integer array:K8:18)
								
								Case of 
									: (Type:C295($_ptr_ThisColumnPointer->)=Is string var:K8:2) | (Type:C295($_ptr_ThisColumnPointer->)=String array:K8:15) | (Type:C295($_ptr_ThisColumnPointer->)=Text array:K8:16) | (Type:C295($_ptr_ThisColumnPointer->)=Is text:K8:3)
										
										//$_t_FooterValueasString:=String
										If ($_l_4DFooterType#2)
											$_l_4DFooterType:=5
											$_ptr_ThisColumnPointer->:=Num:C11($_t_FooterValueasString)
											LISTBOX SET FOOTER CALCULATION:C1140($_ptr_ThisColumnPointer->; $_l_4DFooterType)
										Else 
											LISTBOX SET FOOTER CALCULATION:C1140($_ptr_ThisColumnPointer->; $_l_4DFooterType)
										End if 
										
										OBJECT SET FORMAT:C236($_ptr_ThisColumnPointer->; "###,###,##0")
										
										
									Else 
										LISTBOX SET FOOTER CALCULATION:C1140($_ptr_ThisColumnPointer->; $_l_4DFooterType)
										If ($_l_FooterType=2)
											OBJECT SET FORMAT:C236($_ptr_ThisColumnPointer->; "###,###,##0")
										Else 
											$_t_ColumnFormat:=OBJECT Get format:C894(*; $_at_ColumnNames{$_l_Index})
											//object gET Format
											OBJECT SET FORMAT:C236($_ptr_ThisColumnPointer->; $_t_ColumnFormat)
											
										End if 
								End case 
							: ($_l_DataType=Is string var:K8:2) | ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3) | ($_l_DataType=Text array:K8:16) | ($_l_DataType=String array:K8:15)
								
								//TRACE
								$_l_4DFooterType:=5
								$_ptr_ThisColumnPointer->:=Num:C11($_t_FooterValueasString)
								LISTBOX SET FOOTER CALCULATION:C1140($_ptr_ThisColumnPointer->; $_l_4DFooterType)
								
						End case 
						
						
						// /
						If ($_l_FooterType=2)
							OBJECT SET FORMAT:C236($_ptr_ThisColumnPointer->; "###,###,##0")
						Else 
							$_t_ColumnFormat:=OBJECT Get format:C894(*; $_at_ColumnNames{$_l_Index})
							//object gET Format
							OBJECT SET FORMAT:C236($_ptr_ThisColumnPointer->; $_t_ColumnFormat)
							
						End if 
						
						LISTBOX SET FOOTERS HEIGHT:C1145($_ptr_ThisColumnPointer->; 17)
					End if 
					
				End if 
			End for 
			
		Else 
			For ($_l_Index; 1; $_l_NumberOfColumns)
				$_ptr_ThisColumnPointer:=$_aPtr_FooterVars{$_l_Index}
				OBJECT SET VISIBLE:C603($_ptr_ThisColumnPointer->; False:C215)
			End for 
			For ($_l_Index; 1; $_l_NumberOfColumns)
				
				If ($_ptr_ArrayofColumnFooters->{$_l_Index}>1)
					$_ptr_ArrayFieldPointers:=$1->{2}
					$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Index}
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
					$_l_DataType:=Type:C295($_Ptr_ThisColumnArray->)
					
					$_l_FooterType:=$_ptr_ArrayofColumnFooters->{$_l_Index}
					$_l_4DFooterType:=0
					Case of 
						: ($_l_FooterType=2)
							$_t_FooterValueasString:=String:C10($_l_NumberofRows)
							$_l_4DFooterType:=1
						: ($_l_FooterType=3)
							$_r_FooterCalculation:=0
							For ($_l_Index2; 1; $_l_NumberofRows)
								If (Type:C295($_Ptr_ThisColumnArray->{$_l_Index2})=Type:C295($_r_FooterCalculation))
									$_r_FooterCalculation:=$_r_FooterCalculation+$_Ptr_ThisColumnArray->{$_l_Index2}
								End if 
							End for 
							$_t_FooterValueasString:=String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer sum:K70:4
						: ($_l_FooterType=4)
							$_r_FooterCalculation:=0
							For ($_l_Index2; 1; $_l_NumberofRows)
								If (Type:C295($_Ptr_ThisColumnArray->{$_l_Index2})=Type:C295($_r_FooterCalculation))
									$_r_FooterCalculation:=$_r_FooterCalculation+$_Ptr_ThisColumnArray->{$_l_Index2}
								End if 
								
							End for 
							$_r_FooterCalculation:=$_r_FooterCalculation/$_l_NumberofRows
							$_t_FooterValueasString:="Av: "+String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer average:K70:6
						: ($_l_FooterType=5)
							$_r_FooterCalculation:=0
							For ($_l_Index2; 1; $_l_NumberofRows)
								If ($_Ptr_ThisColumnArray->{$_l_Index2}>$_r_FooterCalculation)
									If (Type:C295($_Ptr_ThisColumnArray->{$_l_Index2})=Type:C295($_r_FooterCalculation))
										$_r_FooterCalculation:=$_Ptr_ThisColumnArray->{$_l_Index2}
									End if 
								End if 
							End for 
							$_t_FooterValueasString:="Hi: "+String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer max:K70:3
						: ($_l_FooterType=6)
							$_r_FooterCalculation:=9999999
							
							For ($_l_Index2; 1; $_l_NumberofRows)
								If ($_Ptr_ThisColumnArray->{$_l_Index2}<$_r_FooterCalculation)
									If (Type:C295($_Ptr_ThisColumnArray->{$_l_Index2})=Type:C295($_r_FooterCalculation))
										$_r_FooterCalculation:=$_Ptr_ThisColumnArray->{$_l_Index2}
									End if 
								End if 
							End for 
							$_t_FooterValueasString:="Lo: "+String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer min:K70:2
							
					End case 
					
					
					If ($_l_4DFooterType>0) & ($_at_FooterNames{$_l_Index}#"")
						
						$_bo_Footer:=True:C214
						$_ptr_ThisColumnPointer:=$_aPtr_FooterVars{$_l_Index}
						Case of 
							: ($_l_4DFooterType=1) & ($_l_AreaType<3)  //& ((Type($_ptr_ThisColumnPointer->)=Is Text) | (Type($_ptr_ThisColumnPointer->)=Is String Var))
								
								//TRACE
								$_l_4DFooterType:=5
							: ($_l_4DFooterType=4) & ($_l_AreaType<3)
								//$_l_4DFooterType:=5
							Else 
						End case 
						OBJECT SET VISIBLE:C603($_ptr_ThisColumnPointer->; True:C214)
						$_l_ColumnColour:=-(Black:K11:16+(256*Light grey:K11:13))
						$_t_Foreground:=UTIL_4DColorToRGB(Black:K11:16)
						$_t_BackGround:=UTIL_4DColorToRGB(Light grey:K11:13)
						OBJECT SET RGB COLORS:C628($_ptr_ThisColumnPointer->; $_t_Foreground; $_t_BackGround)
						
						//_O_OBJECT SET COLOR($_ptr_ThisColumnPointer->;$_l_ColumnColour)
						OBJECT SET FONT STYLE:C166($_ptr_ThisColumnPointer->; Bold:K14:2)
						
						$_l_Height:=LISTBOX Get footers height:C1146($_ptr_ThisColumnPointer->)
						//NG july 2019 trying to takle a long since ignored issue of a adata type mismatch here-can only do the right type of footers
						
						Case of 
							: ($_l_DataType=Is longint:K8:6) | ($_l_DataType=Is real:K8:4) | ($_l_DataType=Is integer:K8:5) | ($_l_DataType=LongInt array:K8:19) | ($_l_DataType=Real array:K8:17) | ($_l_DataType=Integer array:K8:18)
								
								Case of 
									: (Type:C295($_ptr_ThisColumnPointer->)=Is string var:K8:2) | (Type:C295($_ptr_ThisColumnPointer->)=String array:K8:15) | (Type:C295($_ptr_ThisColumnPointer->)=Text array:K8:16) | (Type:C295($_ptr_ThisColumnPointer->)=Is text:K8:3)
										
										//$_t_FooterValueasString:=String
										If ($_l_4DFooterType#2)
											$_l_4DFooterType:=5
											$_ptr_ThisColumnPointer->:=Num:C11($_t_FooterValueasString)
											LISTBOX SET FOOTER CALCULATION:C1140($_ptr_ThisColumnPointer->; $_l_4DFooterType)
										Else 
											LISTBOX SET FOOTER CALCULATION:C1140($_ptr_ThisColumnPointer->; $_l_4DFooterType)
										End if 
										
										OBJECT SET FORMAT:C236($_ptr_ThisColumnPointer->; "###,###,##0")
										
										
									Else 
										LISTBOX SET FOOTER CALCULATION:C1140($_ptr_ThisColumnPointer->; $_l_4DFooterType)
										If ($_l_FooterType=2)
											OBJECT SET FORMAT:C236($_ptr_ThisColumnPointer->; "###,###,##0")
										Else 
											$_t_ColumnFormat:=OBJECT Get format:C894(*; $_at_ColumnNames{$_l_Index})
											//object gET Format
											OBJECT SET FORMAT:C236($_ptr_ThisColumnPointer->; $_t_ColumnFormat)
											
										End if 
								End case 
							: ($_l_DataType=Is string var:K8:2) | ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3) | ($_l_DataType=Text array:K8:16) | ($_l_DataType=String array:K8:15)
								
								//TRACE
								$_l_4DFooterType:=5
								$_ptr_ThisColumnPointer->:=Num:C11($_t_FooterValueasString)
								LISTBOX SET FOOTER CALCULATION:C1140($_ptr_ThisColumnPointer->; $_l_4DFooterType)
								
						End case 
						LISTBOX SET FOOTERS HEIGHT:C1145($_ptr_ThisColumnPointer->; 17)
						
					End if 
				Else 
					
				End if 
			End for 
			
		End if 
		
	Else 
		If (Table:C252($_ptr_LBTable)>0)
			$_l_TableNumber:=Table:C252($_ptr_LBTable)
		Else 
			
			
			LISTBOX GET TABLE SOURCE:C1014($_Ptr_ListBox->; $_l_TableNumber)
		End if 
		
		
		//$_l_TableNumber:=$3
		
		$_ptr_Table:=Table:C252($_l_TableNumber)
		$_ptr_ArrayFieldPointers:=$1->{2}
		$_l_NumberofRows:=Records in selection:C76($_ptr_Table->)
		If ($_l_NumberofRows>0)
			$_l_FootersCount:=0
			For ($_l_Index; 1; $_l_NumberOfColumns)
				$_ptr_ThisColumnPointer:=$_aPtr_FooterVars{$_l_Index}
				OBJECT SET VISIBLE:C603($_ptr_ThisColumnPointer->; False:C215)
			End for 
			For ($_l_Index; 1; $_l_NumberOfColumns)
				
				$_t_FooterValueasString:=""
				If ($_ptr_ArrayofColumnFooters->{$_l_Index}>1)
					
					$_l_FootersCount:=$_l_FootersCount+1
					$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Index}
					$_l_FooterType:=$_ptr_ArrayofColumnFooters->{$_l_Index}
					$_l_4DFooterType:=0
					Case of 
						: ($_l_FooterType=2)
							$_t_FooterValueasString:=String:C10($_l_NumberofRows)
							$_l_4DFooterType:=1  //COUNT
							
						: ($_l_FooterType=3)
							$_r_FooterCalculation:=0
							If (Type:C295($_Ptr_ThisColumnField->)=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnField->)=Is real:K8:4) | (Type:C295($_Ptr_ThisColumnField->)=Is integer:K8:5)
								
								$_r_FooterCalculation:=Sum:C1($_Ptr_ThisColumnField->)
							End if 
							
							$_t_FooterValueasString:=String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer sum:K70:4
						: ($_l_FooterType=4)
							$_r_FooterCalculation:=0
							If (Type:C295($_Ptr_ThisColumnField->)=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnField->)=Is real:K8:4) | (Type:C295($_Ptr_ThisColumnField->)=Is integer:K8:5)
								
								
								
								$_r_FooterCalculation:=Average:C2($_Ptr_ThisColumnField->)
							End if 
							$_r_FooterCalculation:=$_r_FooterCalculation/$_l_NumberofRows
							$_t_FooterValueasString:="Av: "+String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer average:K70:6
						: ($_l_FooterType=5)
							$_r_FooterCalculation:=0
							If (Type:C295($_Ptr_ThisColumnField->)=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnField->)=Is real:K8:4) | (Type:C295($_Ptr_ThisColumnField->)=Is integer:K8:5)
								
								
								
								$_r_FooterCalculation:=Max:C3($_Ptr_ThisColumnField->)
							End if 
							$_t_FooterValueasString:="Hi: "+String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer max:K70:3
						: ($_l_FooterType=6)
							
							
							
							$_r_FooterCalculation:=0
							
							If (Type:C295($_Ptr_ThisColumnField->)=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnField->)=Is real:K8:4) | (Type:C295($_Ptr_ThisColumnField->)=Is integer:K8:5)
								
								
								
								$_r_FooterCalculation:=Min:C4($_Ptr_ThisColumnField->)
							End if 
							$_t_FooterValueasString:="Lo: "+String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer min:K70:2
					End case 
					If ($_l_4DFooterType>0) & ($_at_FooterNames{$_l_Index}#"")
						//TRACE
						$_ptr_ThisColumnPointer:=$_aPtr_FooterVars{$_l_Index}
						Case of 
							: ($_l_4DFooterType=1) & ((Type:C295($_ptr_ThisColumnPointer->)=Is text:K8:3) | (Type:C295($_ptr_ThisColumnPointer->)=Is string var:K8:2))
								
								
								
								
								$_l_4DFooterType:=5
								$_ptr_ThisColumnPointer->:=Num:C11($_t_FooterValueasString)
							: ($_l_4DFooterType=1) & ((Type:C295($_Ptr_ThisColumnField->)=Is text:K8:3) | (Type:C295($_Ptr_ThisColumnField->)=Is alpha field:K8:1))
								
								
								
								//$_l_4DFooterType:=5
								
								$_ptr_ThisColumnPointer->:=Num:C11($_t_FooterValueasString)
							Else 
						End case 
						
						//End if
						
						OBJECT SET VISIBLE:C603($_ptr_ThisColumnPointer->; True:C214)
						$_l_ColumnColour:=-(Black:K11:16+(256*Light grey:K11:13))
						$_t_Foreground:=UTIL_4DColorToRGB(Black:K11:16)
						$_t_BackGround:=UTIL_4DColorToRGB(Light grey:K11:13)
						OBJECT SET RGB COLORS:C628($_ptr_ThisColumnPointer->; $_t_Foreground; $_t_BackGround)
						
						//_O_OBJECT SET COLOR($_ptr_ThisColumnPointer->;$_l_ColumnColour)
						OBJECT SET FONT STYLE:C166($_ptr_ThisColumnPointer->; Bold:K14:2)
						
						$_l_Height:=LISTBOX Get footers height:C1146($_ptr_ThisColumnPointer->)
						LISTBOX SET FOOTER CALCULATION:C1140($_ptr_ThisColumnPointer->; $_l_4DFooterType)
						If ($_l_FooterType=2)
							OBJECT SET FORMAT:C236($_ptr_ThisColumnPointer->; "###,###,##0")
						Else 
							$_t_ColumnFormat:=OBJECT Get format:C894(*; $_at_ColumnNames{$_l_Index})
							//object gET Format
							OBJECT SET FORMAT:C236($_ptr_ThisColumnPointer->; $_t_ColumnFormat)
							
						End if 
						
						LISTBOX SET FOOTERS HEIGHT:C1145($_ptr_ThisColumnPointer->; 17)
					End if 
				Else 
					//$_ptr_ThisColumnPointer:=$_aPtr_FooterVars{$_l_Index}
					
					//OBJECT SET VISIBLE($_ptr_ThisColumnPointer->;True)
					//$_l_Height:=LISTBOX Get footers height($_ptr_ThisColumnPointer->)
					//LISTBOX SET FOOTER CALCULATION($_ptr_ThisColumnPointer->;0)
					
				End if 
			End for 
		Else 
			For ($_l_Index; 1; $_l_NumberOfColumns)
				$_ptr_ThisColumnPointer:=$_aPtr_FooterVars{$_l_Index}
				$_l_ColumnColour:=-(Black:K11:16+(256*Light grey:K11:13))
				$_t_Foreground:=UTIL_4DColorToRGB(Black:K11:16)
				$_t_BackGround:=UTIL_4DColorToRGB(Light grey:K11:13)
				OBJECT SET RGB COLORS:C628($_ptr_ThisColumnPointer->; $_t_Foreground; $_t_BackGround)
				
				//_O_OBJECT SET COLOR($_ptr_ThisColumnPointer->;$_l_ColumnColour)
				OBJECT SET VISIBLE:C603($_ptr_ThisColumnPointer->; False:C215)
			End for 
			
			
			For ($_l_Index; 1; $_l_NumberOfColumns)
				//$ColLeft:=$ColRight
				//$ColRight:=$ColRight+$_ptr_ArrayofColumnWIdths->{$_l_Index}
				
				If ($_ptr_ArrayofColumnFooters->{$_l_Index}>1)
					$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Index}
					$_l_FooterType:=$_ptr_ArrayofColumnFooters->{$_l_Index}
					$_l_4DFooterType:=0
					Case of 
						: ($_l_FooterType=2)
							$_t_FooterValueasString:=String:C10($_l_NumberofRows)
							$_l_4DFooterType:=1  //Custom
							
						: ($_l_FooterType=3)
							$_r_FooterCalculation:=0
							$_r_FooterCalculation:=Sum:C1($_Ptr_ThisColumnField->)
							$_t_FooterValueasString:=String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer sum:K70:4
						: ($_l_FooterType=4)
							$_r_FooterCalculation:=0
							If (Type:C295($_Ptr_ThisColumnArray->{$_l_Index2})=Type:C295($_r_FooterCalculation))
								$_r_FooterCalculation:=Average:C2($_Ptr_ThisColumnField->)
							End if 
							$_r_FooterCalculation:=$_r_FooterCalculation/$_l_NumberofRows
							$_t_FooterValueasString:="Av: "+String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer average:K70:6
						: ($_l_FooterType=5)
							$_r_FooterCalculation:=0
							If (Type:C295($_Ptr_ThisColumnArray->{$_l_Index2})=Type:C295($_r_FooterCalculation))
								$_r_FooterCalculation:=Max:C3($_Ptr_ThisColumnField->)
							End if 
							$_t_FooterValueasString:="Hi: "+String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer max:K70:3
						: ($_l_FooterType=6)
							$_r_FooterCalculation:=9999999
							
							If (Type:C295($_Ptr_ThisColumnArray->{$_l_Index2})=Type:C295($_r_FooterCalculation))
								$_r_FooterCalculation:=Min:C4($_Ptr_ThisColumnField->)
							End if 
							$_t_FooterValueasString:="Lo: "+String:C10($_r_FooterCalculation; $_ptr_ArrayOfColumFormats->{$_l_Index})
							$_l_4DFooterType:=lk footer min:K70:2
					End case 
					If ($_l_4DFooterType>0) & ($_at_FooterNames{$_l_Index}#"")
						//TRACE
						$_bo_Footer:=True:C214
						$_ptr_ThisColumnPointer:=$_aPtr_FooterVars{$_l_Index}
						If ($_l_4DFooterType=1)  //& ((Type($_ptr_ThisColumnPointer->)=Is Text) | (Type($_ptr_ThisColumnPointer->)=Is String Var))
							
							//TRACE
							//$_l_4DFooterType:=5
							//$_ptr_ThisColumnPointer->:=$_t_FooterValueasString
							$_ptr_ThisColumnPointer->:=0
							
						End if 
						OBJECT SET VISIBLE:C603($_ptr_ThisColumnPointer->; True:C214)
						$_l_ColumnColour:=-(Black:K11:16+(256*Light grey:K11:13))
						$_t_Foreground:=UTIL_4DColorToRGB(Black:K11:16)
						$_t_BackGround:=UTIL_4DColorToRGB(Light grey:K11:13)
						OBJECT SET RGB COLORS:C628($_ptr_ThisColumnPointer->; $_t_Foreground; $_t_BackGround)
						
						//_O_OBJECT SET COLOR($_ptr_ThisColumnPointer->;$_l_ColumnColour)
						OBJECT SET FONT STYLE:C166($_ptr_ThisColumnPointer->; Bold:K14:2)
						
						$_l_FootersHeight:=LISTBOX Get footers height:C1146($_ptr_ThisColumnPointer->)
						
						LISTBOX SET FOOTER CALCULATION:C1140($_ptr_ThisColumnPointer->; $_l_4DFooterType)
						If ($_l_FooterType=2)
							OBJECT SET FORMAT:C236($_ptr_ThisColumnPointer->; "###,###,##0")
						Else 
							$_t_ColumnFormat:=OBJECT Get format:C894(*; $_at_ColumnNames{$_l_Index})
							//object gET Format
							OBJECT SET FORMAT:C236($_ptr_ThisColumnPointer->; $_t_ColumnFormat)
							
						End if 
						LISTBOX SET FOOTERS HEIGHT:C1145($_ptr_ThisColumnPointer->; 17)
					End if 
				Else 
					
				End if 
			End for 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_LoadFtrs"; $_t_oldMethodName)
