//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_Abbr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_positionExcludeString; $_l_TextLength; $_l_ThisCharacterCode)
	C_TEXT:C284($_t_IncomingText; $_t_oldMethodName; $_t_OutputText; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_Abbr")
If (Count parameters:C259>=1)
	$_t_IncomingText:=$1
	If ($_t_IncomingText="The @")
		$_t_IncomingText:=Substring:C12($_t_IncomingText; 5; 51)
	End if 
	$_l_positionExcludeString:=Position:C15(" Ltd"; $_t_IncomingText)
	If ($_l_positionExcludeString>0)
		$_t_IncomingText:=Substring:C12($_t_IncomingText; 1; $_l_positionExcludeString-1)+Substring:C12($_t_IncomingText; $_l_positionExcludeString+4; 51)
	End if 
	$_l_positionExcludeString:=Position:C15(" Limited"; $_t_IncomingText)
	If ($_l_positionExcludeString>0)
		$_t_IncomingText:=Substring:C12($_t_IncomingText; 1; $_l_positionExcludeString-1)+Substring:C12($_t_IncomingText; $_l_positionExcludeString+8; 51)
	End if 
	$_l_positionExcludeString:=Position:C15(" plc"; $_t_IncomingText)
	If ($_l_positionExcludeString>0)
		$_t_IncomingText:=Substring:C12($_t_IncomingText; 1; $_l_positionExcludeString-1)+Substring:C12($_t_IncomingText; $_l_positionExcludeString+4; 51)
	End if 
	$_l_positionExcludeString:=Position:C15(" llc"; $_t_IncomingText)
	If ($_l_positionExcludeString>0)
		$_t_IncomingText:=Substring:C12($_t_IncomingText; 1; $_l_positionExcludeString-1)+Substring:C12($_t_IncomingText; $_l_positionExcludeString+4; 51)
	End if 
	$_l_Index:=1
	$_l_TextLength:=Length:C16($_t_IncomingText)
	$_t_OutputText:=""
	While (($_l_Index<=$_l_TextLength) & (Length:C16($_t_OutputText)<21))
		IDLE:C311  // 03/04/03 pb
		$_l_ThisCharacterCode:=Character code:C91(Substring:C12($_t_IncomingText; $_l_Index; 1))
		If ((($_l_ThisCharacterCode>47) & ($_l_ThisCharacterCode<58)) | (($_l_ThisCharacterCode>64) & ($_l_ThisCharacterCode<91)) | (($_l_ThisCharacterCode>96) & ($_l_ThisCharacterCode<123)))
			$_t_OutputText:=$_t_OutputText+Substring:C12($_t_IncomingText; $_l_Index; 1)
		End if 
		$_l_Index:=$_l_Index+1
	End while 
	$0:=$_t_OutputText
End if 
ERR_MethodTrackerReturn("Companies_Abbr"; $_t_oldMethodName)