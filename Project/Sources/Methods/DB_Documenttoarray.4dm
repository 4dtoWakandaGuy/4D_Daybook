//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_Documenttoarray
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      06/12/2010 12:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Done; $_bo_Exit; $_bo_IgnoreBlankSpace; $_bo_IgnoreLeadingSpace; $_bo_IgnoreTrailingSpace; $4; $5; $6)
	C_LONGINT:C283($_l_LineLength; $_l_Platform)
	C_POINTER:C301($_ptr_Array; $2)
	C_TEXT:C284($_t_Delimiter; $_t_DocumentPath; $_t_Line; $_t_oldMethodName; $1; $3)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_Documenttoarray")
// ----------------------------------------------------

// ----------------------------------------------------
//Here are some mods
$_bo_IgnoreLeadingSpace:=False:C215
$_bo_IgnoreTrailingSpace:=False:C215
$_bo_IgnoreBlankSpace:=False:C215
If (Count parameters:C259>=4)
	$_bo_IgnoreLeadingSpace:=$4
Else 
	$_bo_IgnoreLeadingSpace:=False:C215
End if 
If (Count parameters:C259>=5)
	$_bo_IgnoreTrailingSpace:=$5
Else 
	$_bo_IgnoreTrailingSpace:=False:C215
End if 
If (Count parameters:C259>=6)
	$_bo_IgnoreBlankSpace:=$6
Else 
	$_bo_IgnoreBlankSpace:=False:C215
End if 
$_t_DocumentPath:=$1
$_ptr_Array:=$2
If (Count parameters:C259>2)
	$_ti_DocumentRef:=Open document:C264($1; "TEXT"; Read mode:K24:5)
	$_t_Delimiter:=$3
Else 
	$_ti_DocumentRef:=Open document:C264($1)
	//_O_PLATFORM PROPERTIES($_l_Platform)
	Get_PlatformProperty("Platform"; ->$_l_Platform)
	
	Case of 
		: ($_l_Platform=Windows:K25:3)
			$_t_Delimiter:=Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
		Else 
			$_t_Delimiter:=Char:C90(Carriage return:K15:38)  //Char(Line feed )
	End case 
End if 


If ($_ti_DocumentRef#?00:00:00?)
	Repeat 
		RECEIVE PACKET:C104($_ti_DocumentRef; $_t_Line; $_t_Delimiter)
		If ($_bo_IgnoreLeadingSpace)
			$_bo_Exit:=False:C215
			Repeat 
				If (Length:C16($_t_Line)>0)
					If ($_t_Line[[1]]=" ")
						If (Length:C16($_t_Line)>1)
							$_t_Line:=Substring:C12($_t_Line; 2)
						Else 
							$_t_Line:=""
						End if 
					Else 
						$_bo_Exit:=True:C214
					End if 
				Else 
					$_bo_Exit:=True:C214
				End if 
			Until ($_bo_Exit)
		End if 
		If ($_bo_IgnoreTrailingSpace)
			$_bo_Exit:=False:C215
			Repeat 
				$_l_LineLength:=Length:C16($_t_Line)
				If ($_l_LineLength>0)
					If ($_t_Line[[$_l_LineLength]]=" ")
						If (Length:C16($_t_Line)>1)
							$_t_Line:=Substring:C12($_t_Line; 1; ($_l_LineLength-1))
						Else 
							$_t_Line:=""
						End if 
					Else 
						$_bo_Exit:=True:C214
					End if 
				Else 
					$_bo_Exit:=True:C214
				End if 
			Until ($_bo_Exit)
		End if 
		If ($_bo_IgnoreBlankSpace)
			If ($_t_Line=Char:C90(13))
				$_t_Line:=""
			End if 
			If ($_t_Line=Char:C90(10))
				$_t_Line:=""
			End if 
		End if 
		Case of 
				//: ($_t_Line="")
				//$_bo_Done:=True
			: (OK=0)
				$_bo_Done:=True:C214
			Else 
				If ($_bo_IgnoreBlankSpace)
					If ($_t_Line#"")
						APPEND TO ARRAY:C911($_ptr_Array->; $_t_Line)
					End if 
				Else 
					APPEND TO ARRAY:C911($_ptr_Array->; $_t_Line)
				End if 
		End case 
		
	Until ($_bo_Done)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
End if 
ERR_MethodTrackerReturn("DB_Documenttoarray"; $_t_oldMethodName)