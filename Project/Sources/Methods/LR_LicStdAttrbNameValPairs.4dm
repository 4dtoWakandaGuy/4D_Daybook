//%attributes = {}
If (False:C215)
	//Project Method Name:      LR_LicStdAttrbNameValPairs
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
	C_LONGINT:C283($_l_ArraySIze; $_l_ArraySIze2; $_l_CharPosition; $_l_EndofLicenceFIeldText; $_l_EndofLinePosition; $_l_Index; $_l_NewSIzeofArray)
	C_POINTER:C301($_ptr_LicenceFieldEncryptedBLOB; $_ptr_LicenceFieldNameArray; $_ptr_LicenceFieldValueArray; $1; $2; $3)
	C_TEXT:C284($_t_LicenceFIeldText; $_t_LicenceFileText; $_t_LineText; $_t_oldMethodName; $_t_TextToRemove)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LR_LicStdAttrbNameValPairs")

//
$_ptr_LicenceFieldEncryptedBLOB:=$1
$_ptr_LicenceFieldNameArray:=$2
$_ptr_LicenceFieldValueArray:=$3
//
//
//
$_t_LicenceFileText:=LR_LicenceFileEBLOBToClearTxt($_ptr_LicenceFieldEncryptedBLOB)
//
//
//First clear out any existing values in the specified arrays
$_l_ArraySIze:=Size of array:C274($_ptr_LicenceFieldNameArray->)
$_l_ArraySIze2:=Size of array:C274($_ptr_LicenceFieldValueArray->)
If ($_l_ArraySIze>0)
	For ($_l_Index; $_l_ArraySIze; 1)
		DELETE FROM ARRAY:C228($_ptr_LicenceFieldNameArray->; $_l_Index)
	End for 
End if 
If ($_l_ArraySIze2>0)
	For ($_l_Index; $_l_ArraySIze2; 1)
		DELETE FROM ARRAY:C228($_ptr_LicenceFieldValueArray->; $_l_Index)
	End for 
End if 
//
//
$_t_TextToRemove:="LICENCE NUMBERER FILE"+Char:C90(13)+Char:C90(13)+Char:C90(13)+Char:C90(13)+"LICENCE DETAILS"+Char:C90(13)+Char:C90(13)+Char:C90(13)+"LICENCE STANDARD ATTRIBUTES"+Char:C90(13)+Char:C90(13)
$_t_LicenceFIeldText:=Replace string:C233($_t_LicenceFileText; $_t_TextToRemove; "")
$_l_EndofLicenceFIeldText:=Position:C15((Char:C90(13)+Char:C90(13)); $_t_LicenceFIeldText)
$_t_LicenceFIeldText:=Substring:C12($_t_LicenceFIeldText; 1; ($_l_EndofLicenceFIeldText-1))
//
$_l_EndofLinePosition:=Position:C15(Char:C90(13); $_t_LicenceFIeldText)
While ($_l_EndofLinePosition>0)
	$_t_LineText:=Substring:C12($_t_LicenceFIeldText; 1; ($_l_EndofLinePosition-1))
	$_l_NewSIzeofArray:=Size of array:C274($_ptr_LicenceFieldNameArray->)+1
	INSERT IN ARRAY:C227($_ptr_LicenceFieldNameArray->; $_l_NewSIzeofArray)
	INSERT IN ARRAY:C227($_ptr_LicenceFieldValueArray->; $_l_NewSIzeofArray)
	$_l_CharPosition:=Position:C15(": "; $_t_LineText)
	$_ptr_LicenceFieldNameArray->{$_l_NewSIzeofArray}:=Substring:C12($_t_LineText; 1; ($_l_CharPosition-1))
	$_ptr_LicenceFieldValueArray->{$_l_NewSIzeofArray}:=Substring:C12($_t_LineText; ($_l_CharPosition+2))
	$_t_LicenceFIeldText:=Replace string:C233($_t_LicenceFIeldText; ($_t_LineText+Char:C90(13)); "")
	$_l_EndofLinePosition:=Position:C15(Char:C90(13); $_t_LicenceFIeldText)
End while 
$_t_LineText:=Substring:C12($_t_LicenceFIeldText; 1)
$_l_NewSIzeofArray:=Size of array:C274($_ptr_LicenceFieldNameArray->)+1
INSERT IN ARRAY:C227($_ptr_LicenceFieldNameArray->; $_l_NewSIzeofArray)
INSERT IN ARRAY:C227($_ptr_LicenceFieldValueArray->; $_l_NewSIzeofArray)
$_l_CharPosition:=Position:C15(": "; $_t_LineText)
$_ptr_LicenceFieldNameArray->{$_l_NewSIzeofArray}:=Substring:C12($_t_LineText; 1; ($_l_CharPosition-1))
$_ptr_LicenceFieldValueArray->{$_l_NewSIzeofArray}:=Substring:C12($_t_LineText; ($_l_CharPosition+2))

//
//
ERR_MethodTrackerReturn("LR_LicStdAttrbNameValPairs"; $_t_oldMethodName)
