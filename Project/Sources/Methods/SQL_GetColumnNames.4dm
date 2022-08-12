//%attributes = {}

If (False:C215)
	//Project Method Name:      SQL_GetColumnNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  19/05/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FirstFound; $_bo_FoundInstance)
	C_LONGINT:C283($_l_Exit; $_l_FindEnd; $_l_Format; $_l_OpenBracket; $_l_Position; $_l_Positionb; $_l_TakeoffEnd)
	C_POINTER:C301($_Ptr_ColumnNames; $2)
	C_TEXT:C284($_t_ColumnName; $_t_NumberMaybe; $_t_Statement; $1)
End if 
//Code Starts Here


//Database Method Name:      SQL_GetColumnNames
//------------------ Method Notes ------------------

//------------------ Revision Control ----------------
If (False:C215)
	//Date Created:  21/12/2020
	//Created BY:  sjp
	
	//Date Modified: 
	//Modified By: sjp
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FirstFound; $_bo_FoundInstance)
	C_LONGINT:C283($_l_Exit; $_l_FindEnd; $_l_Format; $_l_OpenBracket; $_l_Position; $_l_Positionb; $_l_TakeoffEnd)
	C_POINTER:C301($_Ptr_ColumnNames; $2)
	C_TEXT:C284($_t_ColumnName; $_t_NumberMaybe; $_t_Statement; $1)
End if 
//Code Starts Here
If (Count parameters:C259>=2)
	
	$_t_Statement:=$1
	$_l_Exit:=0
	Repeat 
		If (Length:C16($_t_Statement)>0)
			If ($_t_Statement[[1]]=" ")
				$_t_Statement:=Substring:C12($_t_Statement; 2)
			Else 
				$_l_Exit:=1
			End if 
		End if 
	Until ($_l_Exit=1) | (Length:C16($_t_Statement)=0)
	
	
	$_Ptr_ColumnNames:=$2
	
	If ($_t_Statement="Select @")
		$_t_Statement:=Substring:C12($_t_Statement; 8)
		For ($_l_TakeoffEnd; Length:C16($_t_Statement); 1; -1)
			If ($_t_Statement[[$_l_TakeoffEnd]]="F")
				If (Substring:C12($_t_Statement; $_l_TakeoffEnd-1)=" From @")
					$_t_Statement:=Substring:C12($_t_Statement; 1; $_l_TakeoffEnd-2)
					$_l_TakeoffEnd:=0
				Else 
					If (Substring:C12($_t_Statement; $_l_TakeoffEnd-1)=")From @")
						$_t_Statement:=Substring:C12($_t_Statement; 1; $_l_TakeoffEnd-1)
						$_l_TakeoffEnd:=0
					End if 
				End if 
			End if 
		End for 
		For ($_l_TakeoffEnd; Length:C16($_t_Statement); 1; -1)
			If ($_t_Statement[[$_l_TakeoffEnd]]=",")
				$_l_TakeoffEnd:=0
			Else 
				If ($_t_Statement[[$_l_TakeoffEnd]]="A")
					If (Substring:C12($_t_Statement; $_l_TakeoffEnd-1)=" As @")
						$_t_Statement:=Substring:C12($_t_Statement; 1; $_l_TakeoffEnd-2)
						$_l_TakeoffEnd:=0
					Else 
						If (Substring:C12($_t_Statement; $_l_TakeoffEnd-1)=")As @")
							$_t_Statement:=Substring:C12($_t_Statement; 1; $_l_TakeoffEnd-1)
							$_l_TakeoffEnd:=0
						End if 
					End if 
				End if 
			End if 
		End for 
		
		
		Repeat 
			$_l_Position:=Position:C15(","; $_t_Statement)
			If ($_l_Position>0)
				$_t_ColumnName:=Substring:C12($_t_Statement; 1; $_l_Position-1)
				//$_t_ColumnName:=G_Trim($_t_ColumnName;"B";" ")
				$_t_Statement:=Substring:C12($_t_Statement; $_l_Position+1)
				If ($_t_ColumnName="Convert@") | ($_t_ColumnName="(Convert@")
					//TRACE
					$_l_OpenBracket:=0
					$_bo_FirstFound:=False:C215
					For ($_l_FindEnd; 1; Length:C16($_t_ColumnName))
						If ($_t_ColumnName[[$_l_FindEnd]]="(")
							$_bo_FirstFound:=True:C214
							$_l_OpenBracket:=$_l_OpenBracket+1
						End if 
						If ($_t_ColumnName[[$_l_FindEnd]]=")")
							
							$_l_OpenBracket:=$_l_OpenBracket-1
						End if 
					End for 
					
					For ($_l_FindEnd; 1; Length:C16($_t_Statement))
						If ($_t_Statement[[$_l_FindEnd]]="(")
							$_l_OpenBracket:=$_l_OpenBracket+1
							
						End if 
						If ($_t_Statement[[$_l_FindEnd]]=")")
							$_l_OpenBracket:=$_l_OpenBracket-1
							
						End if 
						If ($_l_OpenBracket=0) & ($_bo_FirstFound)
							$_t_ColumnName:=$_t_ColumnName+","+Substring:C12($_t_Statement; 1; $_l_FindEnd)
							$_t_Statement:=Substring:C12($_t_Statement; $_l_FindEnd+1)
							If ($_t_Statement#"")
								If ($_t_Statement[[1]]=",")
									$_t_Statement:=Substring:C12($_t_Statement; 2)
								End if 
							End if 
							$_l_FindEnd:=999999
						End if 
					End for 
					APPEND TO ARRAY:C911($_Ptr_ColumnNames->; $_t_ColumnName)
					///
					//$_t_Statement:=G_Trim($_t_Statement;"B";" ")
					If ($_t_Statement="as @") | ($_t_Statement="(As @")
						
						$_l_Positionb:=Position:C15(","; $_t_Statement)
						If ($_l_Positionb>0)
							$_t_Statement:=Substring:C12($_t_Statement; $_l_Positionb+1)
						End if 
					End if 
					////
				Else 
					APPEND TO ARRAY:C911($_Ptr_ColumnNames->; $_t_ColumnName)
				End if 
			Else 
				//$_t_Statement:=G_Trim($_t_Statement;"B";" ")
				If ($_t_Statement#"")
					APPEND TO ARRAY:C911($_Ptr_ColumnNames->; $_t_Statement)
				End if 
			End if 
		Until ($_l_Position=0)
		For ($_l_Format; 1; Size of array:C274($_Ptr_ColumnNames->))
			
			$_t_ColumnName:=$_Ptr_ColumnNames->{$_l_Format}
			For ($_l_TakeoffEnd; Length:C16($_t_ColumnName); 1; -1)
				If ($_t_ColumnName[[$_l_TakeoffEnd]]="F")
					If (Substring:C12($_t_ColumnName; $_l_TakeoffEnd-1)=" From @")
						$_t_ColumnName:=Substring:C12($_t_ColumnName; 1; $_l_TakeoffEnd-2)
						$_l_TakeoffEnd:=0
					Else 
						If (Substring:C12($_t_ColumnName; $_l_TakeoffEnd-1)=")From @")
							$_t_ColumnName:=Substring:C12($_t_ColumnName; 1; $_l_TakeoffEnd-1)
							$_l_TakeoffEnd:=0
						End if 
					End if 
				End if 
			End for 
			For ($_l_TakeoffEnd; Length:C16($_t_ColumnName); 1; -1)
				
				If ($_t_ColumnName[[$_l_TakeoffEnd]]="A")
					If (Substring:C12($_t_ColumnName; $_l_TakeoffEnd-1)=" As @")
						$_t_ColumnName:=Substring:C12($_t_ColumnName; 1; $_l_TakeoffEnd-2)
						$_l_TakeoffEnd:=0
					Else 
						If (Substring:C12($_t_ColumnName; $_l_TakeoffEnd-1)=")As @")
							$_t_ColumnName:=Substring:C12($_t_ColumnName; 1; $_l_TakeoffEnd-1)
							$_l_TakeoffEnd:=0
						End if 
					End if 
				End if 
				
			End for 
			
			////$_t_ColumnName:=G_Trim($_t_ColumnName;"B";" ")
			Repeat 
				$_bo_FoundInstance:=False:C215
				Case of 
					: ($_t_ColumnName="Varchar@")
						//TRACE
						
						///$_t_ColumnName:=G_Trim(Substring($_t_ColumnName;8);"B";" ")
						//there should be a bracket then a number
						If ($_t_ColumnName="(@")
							//$_t_ColumnName:=G_Trim(Substring($_t_ColumnName;2);"B";" ")
							$_l_Positionb:=Position:C15(")"; $_t_ColumnName)
							$_t_NumberMaybe:=Substring:C12($_t_ColumnName; 1; $_l_Positionb-1)
							If ((String:C10(Num:C11($_t_NumberMaybe)))=$_t_NumberMaybe)
								$_t_ColumnName:=Substring:C12($_t_ColumnName; $_l_Positionb+1)
								If ($_t_ColumnName#"")
									If ($_t_ColumnName[[1]]=",")
										$_t_ColumnName:=Substring:C12($_t_ColumnName; 2)
									End if 
									
								End if 
							End if 
						End if 
						$_l_Positionb:=Position:C15(","; $_t_ColumnName)
						If ($_l_Positionb>0)
							$_t_ColumnName:=Substring:C12($_t_ColumnName; 1; $_l_Positionb-1)
						End if 
						$_bo_FoundInstance:=True:C214
					: ($_t_ColumnName="Convert@") | ($_t_ColumnName="103@") | ($_t_ColumnName="(Convert@")
						//TRACE
						If (($_t_ColumnName="(Convert@"))
							//$_t_ColumnName:=G_Trim(Substring($_t_ColumnName;10);"B";" ")
						Else 
							//$_t_ColumnName:=G_Trim(Substring($_t_ColumnName;9);"B";" ")
						End if 
						$_bo_FoundInstance:=True:C214
						//we ignore it
					: ($_t_ColumnName="Cast@")
						
						//$_t_ColumnName:=G_Trim(Substring($_t_ColumnName;5);"B";" ")
						If ($_t_ColumnName#"")
							If ($_t_ColumnName[[1]]="(")
								$_t_ColumnName:=Substring:C12($_t_ColumnName; 2)
							End if 
						End if 
						$_bo_FoundInstance:=True:C214
					: ($_t_ColumnName="(@")
						$_t_ColumnName:=Substring:C12($_t_ColumnName; 2)
						$_bo_FoundInstance:=True:C214
						
					: ($_t_ColumnName="RTRIM@")
						
						//$_t_ColumnName:=G_Trim(Substring($_t_ColumnName;7);"B";" ")
						If ($_t_ColumnName#"")
							If ($_t_ColumnName[[1]]="(")
								$_t_ColumnName:=Substring:C12($_t_ColumnName; 2)
							End if 
						End if 
						$_bo_FoundInstance:=True:C214
						
					: ($_t_ColumnName="STR@") | ($_t_ColumnName="SUM@")
						
						//$_t_ColumnName:=G_Trim(Substring($_t_ColumnName;4);"B";" ")
						If ($_t_ColumnName#"")
							If ($_t_ColumnName[[1]]="(")
								$_t_ColumnName:=Substring:C12($_t_ColumnName; 2)
							End if 
						End if 
						$_bo_FoundInstance:=True:C214
						
						
				End case 
			Until ($_bo_FoundInstance=False:C215)
			If (Position:C15("."; $_t_ColumnName)>0)
				$_l_Positionb:=Position:C15("."; $_t_ColumnName)
				$_t_ColumnName:=Substring:C12($_t_ColumnName; $_l_Positionb+1)
				
			End if 
			$_t_ColumnName:=Replace string:C233($_t_ColumnName; ")"; "")
			$_Ptr_ColumnNames->{$_l_Format}:=$_t_ColumnName
		End for 
		
		
		
		
		
		
	End if 
End if 
