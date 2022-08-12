//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_FixMethodDeclarations2020
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/06/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_AlreadyStored; $_L_NUM; $_l_Position; $_l_Position2; $_l_Position3; $_l_Position4; $_l_Position5; $_l_PositionB; $_l_Positionblob; $_l_PositionBoolean; $_l_PositionCOllection)
	C_LONGINT:C283($_l_PositionDate; $_l_PositionInteger; $_l_PositionLongint; $_l_PositionObject; $_l_Positionpicture; $_l_PositionPointer; $_l_PositionReal; $_l_PositionText; $_l_PositionTime; $_l_PositionVariant)
	C_POINTER:C301($_ptr_AllArrayNames; $_ptr_AllArrayTypes; $_ptr_AllVarNames; $_ptr_allVarTypes; $_ptr_DeclareType; $_ptr_MethodDeclares; $_ptr_MethodNames; $3; $4; $5; $6)
	C_POINTER:C301($7; $8; $9)
	C_TEXT:C284($_t_ArrayName; $_T_CONSTRUCT; $_t_Declarations; $_t_MethodName; $_t_MethodNamr; $_t_Thisline; $_t_Type; $_t_VarName; $1; $2)
End if 
//Code Starts Here
$_t_MethodName:=$1
$_t_Declarations:=$2
$_ptr_AllArrayNames:=$3
$_ptr_AllArrayTypes:=$4
$_ptr_AllVarNames:=$5
$_ptr_allVarTypes:=$6
$_ptr_MethodDeclares:=$7
$_ptr_MethodNames:=$8
$_ptr_DeclareType:=$9
Repeat 
	$_l_Position:=Position:C15("Array "; $_t_Declarations)
	//
	If (True:C214)
		$_l_POsitionText:=0
		
		If (Position:C15(" Array text"; $_t_Declarations)>0)
			$_l_PositionText:=Position:C15("C_Longint"; $_t_Declarations)
		End if 
		If (Position:C15("Array longint"; $_t_Declarations)>0)
			$_l_PositionB:=Position:C15("Array Longint"; $_t_Declarations)
			If ($_l_PositionB<$_l_PositionText)
				$_l_PositionText:=$_l_PositionB
			End if 
		End if 
		If (Position:C15("Array integer"; $_t_Declarations)>0)
			$_l_PositionB:=Position:C15("Array Integer"; $_t_Declarations)
			If ($_l_PositionB<$_l_PositionText)
				$_l_PositionText:=$_l_PositionB
			End if 
			
		End if 
		If (Position:C15("array real"; $_t_Declarations)>0)
			$_l_PositionB:=Position:C15("Array Real"; $_t_Declarations)
			If ($_l_PositionB<$_l_PositionText)
				$_l_PositionText:=$_l_PositionB
			End if 
			
		End if 
		If (Position:C15("array picture"; $_t_Declarations)>0)
			$_l_PositionB:=Position:C15("Array Picture"; $_t_Declarations)
			If ($_l_PositionB<$_l_PositionText)
				$_l_PositionText:=$_l_PositionB
			End if 
		End if 
		If (Position:C15("Array boolean"; $_t_Declarations)>0)
			$_l_PositionB:=Position:C15("Array Boolean"; $_t_Declarations)
			If ($_l_PositionB<$_l_PositionText)
				$_l_PositionText:=$_l_PositionB
			End if 
		End if 
		If (Position:C15("Array time"; $_t_Declarations)>0)
			$_l_PositionB:=Position:C15("Array Time"; $_t_Declarations)
			If ($_l_PositionB<$_l_PositionText)
				$_l_PositionText:=$_l_PositionB
			End if 
		End if 
		If (Position:C15("Array date"; $_t_Declarations)>0)
			$_l_PositionB:=Position:C15("Array Date"; $_t_Declarations)
			If ($_l_PositionB<$_l_PositionText)
				$_l_PositionText:=$_l_PositionB
			End if 
		End if 
		If (Position:C15("Array object"; $_t_Declarations)>0)
			$_l_PositionB:=Position:C15("Array Object"; $_t_Declarations)
			If ($_l_PositionB<$_l_PositionText)
				$_l_PositionText:=$_l_PositionB
			End if 
		End if 
		If (Position:C15("Array blob"; $_t_Declarations)>0)
			$_l_PositionB:=Position:C15("Array Blob"; $_t_Declarations)
			If ($_l_PositionB<$_l_PositionText)
				$_l_PositionText:=$_l_PositionB
			End if 
		End if 
		If (Position:C15("Array pointer"; $_t_Declarations)>0)
			$_l_PositionB:=Position:C15("Array Pointer"; $_t_Declarations)
			If ($_l_PositionB<$_l_PositionText)
				$_l_PositionText:=$_l_PositionB
			End if 
		End if 
		$_l_Position:=$_l_PositionText
	End if 
	
	//
	$_l_Position3:=Position:C15("C_"; $_t_Declarations)
	If ($_l_Position>0) & ($_l_Position3>0) & ($_l_Position3<$_l_Position)
		$_l_Position:=0
	End if 
	If ($_l_Position>0)
		$_t_Declarations:=Substring:C12($_t_Declarations; $_l_Position)
		$_l_Position2:=Position:C15(Char:C90(13); $_t_Declarations)
		If ($_l_Position2=0)
			$_l_Position2:=Position:C15(Char:C90(10); $_t_Declarations)
		End if 
		If ($_l_Position2>0)
			$_t_Thisline:=Substring:C12($_t_Declarations; 1; $_l_Position2-1)
			$_t_Declarations:=Substring:C12($_t_Declarations; $_l_Position2+1)
			
			If ($_t_Thisline#"")
				$_l_Position3:=Position:C15("("; $_t_Thisline)
				If ($_l_Position3>0)
					$_t_Type:=Substring:C12($_t_Thisline; 1; $_l_Position3-1)
					$_t_Thisline:=Substring:C12($_t_Thisline; $_l_Position3+1)
					$_l_Position4:=Position:C15(";"; $_t_Thisline)
					If ($_l_Position4>0)
						$_t_ArrayName:=Substring:C12($_t_Thisline; 1; $_l_Position4-1)
						$_t_Thisline:=Substring:C12($_t_Thisline; $_l_Position4+1)
						$_l_Position5:=Position:C15(";"; $_t_Thisline)
						
						If ($_l_Position5>0)
							//2d array
							//$_ptr_AllArrayNames:=$2
							//$_ptr_AllArrayTypes:=$3
							If ($_t_ArrayName#"$@")
								$_l_AlreadyStored:=Find in array:C230($_ptr_AllArrayNames->; $_t_ArrayName)
								If ($_l_AlreadyStored<0)
									APPEND TO ARRAY:C911($_ptr_AllArrayNames->; $_t_ArrayName)
									
									Case of 
										: (Position:C15("text"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; -Text array:K8:16)
										: (Position:C15("longint"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; -LongInt array:K8:19)
										: (Position:C15("integer"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; -Integer array:K8:18)
										: (Position:C15("real"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; -Real array:K8:17)
										: (Position:C15("picture"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; -Picture array:K8:22)
										: (Position:C15("boolean"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; -Boolean array:K8:21)
										: (Position:C15("time"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; -Time array:K8:29)
										: (Position:C15("date"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; -Date array:K8:20)
										: (Position:C15("object"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; -Object array:K8:28)
										: (Position:C15("blob"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; -Blob array:K8:30)
										: (Position:C15("pointer"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; -Pointer array:K8:23)
											
									End case 
								End if 
								
							End if 
						Else 
							//1d
							If ($_t_ArrayName#"$@")
								$_l_AlreadyStored:=Find in array:C230($_ptr_AllArrayNames->; $_t_ArrayName)
								If ($_l_AlreadyStored<0)
									
									APPEND TO ARRAY:C911($_ptr_AllArrayNames->; $_t_ArrayName)
									
									Case of 
										: (Position:C15("text"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; Text array:K8:16)
										: (Position:C15("longint"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; LongInt array:K8:19)
										: (Position:C15("integer"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; Integer array:K8:18)
										: (Position:C15("real"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; Real array:K8:17)
										: (Position:C15("picture"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; Picture array:K8:22)
										: (Position:C15("boolean"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; Boolean array:K8:21)
										: (Position:C15("time"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; Time array:K8:29)
										: (Position:C15("date"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; Date array:K8:20)
										: (Position:C15("object"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; Object array:K8:28)
										: (Position:C15("blob"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; Blob array:K8:30)
										: (Position:C15("pointer"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_AllArrayTypes->; Pointer array:K8:23)
									End case 
								End if 
								
							End if 
							
							
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
Until ($_l_Position=0)
Repeat 
	$_l_Position:=Position:C15("C_"; $_t_Declarations)
	$_l_PositionText:=0
	If (Position:C15("C_text("; $_t_Declarations)>0)
		$_l_PositionText:=Position:C15("C_Text"; $_t_Declarations)
	End if 
	If (Position:C15("C_longint("; $_t_Declarations)>0)
		$_l_PositionLongint:=Position:C15("C_Longint"; $_t_Declarations)
		If ($_l_PositionLongint<$_l_PositionText)
			$_l_PositionText:=$_l_PositionLongint
		End if 
	End if 
	If (Position:C15("o_C_integer("; $_t_Declarations)>0)
		$_l_PositionInteger:=Position:C15("o_c_Integer"; $_t_Declarations)
		If ($_l_PositionInteger<$_l_PositionText)
			$_l_PositionText:=$_l_PositionInteger
		End if 
	End if 
	If (Position:C15("C_real("; $_t_Declarations)>0)
		$_l_PositionReal:=Position:C15("c_real"; $_t_Declarations)
		If ($_l_PositionReal<$_l_PositionText)
			$_l_PositionText:=$_l_PositionReal
		End if 
	End if 
	If (Position:C15("C_picture("; $_t_Declarations)>0)
		$_l_Positionpicture:=Position:C15("c_Picture"; $_t_Declarations)
		If ($_l_Positionpicture<$_l_PositionText)
			$_l_PositionText:=$_l_Positionpicture
		End if 
	End if 
	If (Position:C15("C_boolean("; $_t_Declarations)>0)
		$_l_PositionBoolean:=Position:C15("c_boolean"; $_t_Declarations)
		If ($_l_PositionBoolean<$_l_PositionText)
			$_l_PositionText:=$_l_PositionBoolean
		End if 
	End if 
	If (Position:C15("C_time("; $_t_Declarations)>0)
		$_l_PositionTime:=Position:C15("C_TIME"; $_t_Declarations)
		If ($_l_PositionTime<$_l_PositionText)
			$_l_PositionText:=$_l_PositionTime
		End if 
	End if 
	If (Position:C15("C_date("; $_t_Declarations)>0)
		$_l_PositionDate:=Position:C15("C_Date"; $_t_Declarations)
		If ($_l_PositionDate<$_l_PositionText)
			$_l_PositionText:=$_l_PositionDate
		End if 
	End if 
	If (Position:C15("C_object("; $_t_Declarations)>0)
		$_l_PositionObject:=Position:C15("c_object"; $_t_Declarations)
		If ($_l_PositionObject<$_l_PositionText)
			$_l_PositionText:=$_l_PositionObject
		End if 
		
	End if 
	If (Position:C15("C_blob("; $_t_Declarations)>0)
		$_l_Positionblob:=Position:C15("c_blob"; $_t_Declarations)
		If ($_l_Positionblob<$_l_PositionText)
			$_l_PositionText:=$_l_Positionblob
		End if 
	End if 
	If (Position:C15("C_pointer("; $_t_Declarations)>0)
		$_l_PositionPointer:=Position:C15("C_pointer"; $_t_Declarations)
		If ($_l_PositionPointer<$_l_PositionText)
			$_l_PositionText:=$_l_PositionPointer
		End if 
		
	End if 
	If (Position:C15("C_Collection"; $_t_Declarations)>0)
		$_l_PositionCOllection:=Position:C15("C_pointer"; $_t_Declarations)
		If ($_l_PositionCOllection<$_l_PositionText)
			$_l_PositionText:=$_l_PositionCOllection
		End if 
	End if 
	If (Position:C15("C_VARIANT"; $_t_Declarations)>0)
		$_l_PositionVariant:=Position:C15("C_variant"; $_t_Declarations)
		If ($_l_PositionVariant<$_l_PositionText)
			$_l_PositionText:=$_l_PositionVariant
		End if 
	End if 
	$_l_Position:=$_l_PositionText
	
	
	
	
	If ($_l_Position>0)
		$_t_Declarations:=Substring:C12($_t_Declarations; $_l_Position)
		$_l_Position2:=Position:C15(Char:C90(13); $_t_Declarations)
		If ($_l_Position2=0)
			$_l_Position2:=Position:C15(Char:C90(10); $_t_Declarations)
		End if 
		If ($_l_Position2>0)
			$_t_Thisline:=Substring:C12($_t_Declarations; 1; $_l_Position2-1)
			$_t_Declarations:=Substring:C12($_t_Declarations; $_l_Position2+1)
			If ($_t_Thisline#"")
				$_l_Position3:=Position:C15("("; $_t_Thisline)
				If ($_l_Position3>0)
					$_t_Type:=Substring:C12($_t_Thisline; 1; $_l_Position3-1)
					$_t_Thisline:=Substring:C12($_t_Thisline; $_l_Position3+1)
					////
					Repeat 
						$_l_Position4:=Position:C15(";"; $_t_Thisline)
						If ($_l_Position4=0)
							$_l_Position4:=Position:C15(")"; $_t_Thisline)
						End if 
						If ($_l_Position4>0)
							$_t_VarName:=Substring:C12($_t_Thisline; 1; $_l_Position4-1)
							If (Length:C16($_t_Thisline)>($_l_Position4+1))
								$_t_Thisline:=Substring:C12($_t_Thisline; $_l_Position4+1)
							Else 
								$_t_Thisline:=""
							End if 
							
							//1d
							If ($_t_VarName#"$@")
								//$_ptr_AllVarNames:=$4
								//$_ptr_allVarTypes:=$5
								$_l_AlreadyStored:=Find in array:C230($_ptr_AllVarNames->; $_t_VarName)
								If ($_l_AlreadyStored<0)
									
									APPEND TO ARRAY:C911($_ptr_AllVarNames->; $_t_VarName)
									
									Case of 
										: (Position:C15("text"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_allVarTypes->; Is text:K8:3)
										: (Position:C15("longint"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_allVarTypes->; Is longint:K8:6)
										: (Position:C15("integer"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_allVarTypes->; Is integer:K8:5)
										: (Position:C15("real"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_allVarTypes->; Is real:K8:4)
										: (Position:C15("picture"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_allVarTypes->; Is picture:K8:10)
										: (Position:C15("boolean"; $_t_Type)>0)
											
											APPEND TO ARRAY:C911($_ptr_allVarTypes->; Is boolean:K8:9)
										: (Position:C15("time"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_allVarTypes->; Is time:K8:8)
										: (Position:C15("date"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_allVarTypes->; Is date:K8:7)
										: (Position:C15("object"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_allVarTypes->; Is object:K8:27)
										: (Position:C15("blob"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_allVarTypes->; Is BLOB:K8:12)
										: (Position:C15("pointer"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_allVarTypes->; Is pointer:K8:14)
										: (Position:C15("Collection"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_allVarTypes->; Is collection:K8:32)
										: (Position:C15("VARIANT"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_allVarTypes->; Is variant:K8:33)
										Else 
											APPEND TO ARRAY:C911($_ptr_allVarTypes->; -1)
											
									End case 
								End if 
							Else 
								//here we only store if it is $1 etc
								$_L_NUM:=Num:C11($_t_VarName)
								$_T_CONSTRUCT:="$"+String:C10($_t_VarName)
								If ($_T_CONSTRUCT=$_t_VarName)
									//THIS IS A TO GO IN THE DECLARATIONS.
									APPEND TO ARRAY:C911($_ptr_MethodDeclares->; $_t_VarName)
									APPEND TO ARRAY:C911($_ptr_MethodNames->; $1)
									
									Case of 
										: (Position:C15("text"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_DeclareType->; Is text:K8:3)
										: (Position:C15("longint"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_DeclareType->; Is longint:K8:6)
										: (Position:C15("integer"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_DeclareType->; Is integer:K8:5)
										: (Position:C15("real"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_DeclareType->; Is real:K8:4)
										: (Position:C15("picture"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_DeclareType->; Is picture:K8:10)
										: (Position:C15("boolean"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_DeclareType->; Is boolean:K8:9)
										: (Position:C15("time"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_DeclareType->; Is time:K8:8)
										: (Position:C15("date"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_DeclareType->; Is date:K8:7)
										: (Position:C15("object"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_DeclareType->; Is object:K8:27)
										: (Position:C15("blob"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_DeclareType->; Is BLOB:K8:12)
										: (Position:C15("pointer"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_DeclareType->; Is pointer:K8:14)
										: (Position:C15("Collection"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_DeclareType->; Is collection:K8:32)
										: (Position:C15("VARIANT"; $_t_Type)>0)
											APPEND TO ARRAY:C911($_ptr_DeclareType->; Is variant:K8:33)
										Else 
											APPEND TO ARRAY:C911($_ptr_DeclareType->; -1)
											
									End case 
									
									
								End if 
								
							End if 
							
							
							
						End if 
					Until ($_l_Position4=0)
					///
				End if 
			End if 
		End if 
	End if 
Until ($_l_Position=0)



