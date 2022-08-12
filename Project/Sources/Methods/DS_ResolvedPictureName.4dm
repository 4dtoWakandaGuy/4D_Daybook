//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_ResolvedPictureName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_TakeOut; 0)
	C_LONGINT:C283($_l_CharacterCode; $_l_Element; $_l_Index)
	C_TEXT:C284($_t_DocumentName; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_ResolvedPictureName")
//NG March 2004
//pass this method the name of a picture.
//thisMUST be without the extension
//this will remove characters that we cant use
If (Count parameters:C259>=1)
	$_t_DocumentName:=$1
	$_t_DocumentName:=Replace string:C233($_t_DocumentName; ":"; "_")
	$_t_DocumentName:=Replace string:C233($_t_DocumentName; "\\"; "__")
	$_t_DocumentName:=Replace string:C233($_t_DocumentName; "/"; "___")
	$_t_DocumentName:=Replace string:C233($_t_DocumentName; "."; "____")
	ARRAY TEXT:C222($_at_TakeOut; Length:C16($_t_DocumentName))
	$_l_Element:=0
	If (Length:C16($_t_DocumentName)>0)
		For ($_l_Index; 1; Length:C16($_t_DocumentName))
			$_l_CharacterCode:=Character code:C91($_t_DocumentName[[$_l_Index]])
			If ($_l_CharacterCode>126) | ($_l_CharacterCode<33) | ($_l_CharacterCode=64)
				$_l_Element:=$_l_Element+1
				$_at_TakeOut{$_l_Element}:=Char:C90($_l_CharacterCode)
			End if 
		End for 
		ARRAY TEXT:C222($_at_TakeOut; $_l_Element)
		For ($_l_Index; 1; Size of array:C274($_at_TakeOut))
			$_t_DocumentName:=Replace string:C233($_t_DocumentName; $_at_TakeOut{$_l_Index}; "")
		End for 
		
	End if 
	$0:=$_t_DocumentName
End if 
ERR_MethodTrackerReturn("DS_ResolvedPictureName"; $_t_oldMethodName)