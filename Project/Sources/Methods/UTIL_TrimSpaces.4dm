//%attributes = {}

If (False:C215)
	//Project Method Name:      UTIL_TrimSpaces
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
	//C_UNKNOWN($0)
	C_COLLECTION:C1488($_col_CharsToStrip; $_col_Where; $_col_CharsToStrip; $_col_Where)
	C_LONGINT:C283($_l_Text; $_l_TextChar; $_l_TextChar)
	C_OBJECT:C1216($_obj_Parameters; $1; $_obj_Parameters; $1)
	C_TEXT:C284($_t_CharToStrip; $_t_InputText; $_t_InputText)
End if 
//Code Starts Here
$_obj_Parameters:=$1
If (Not:C34($_obj_Parameters.text=Null:C1517))
	$_t_InputText:=$_obj_Parameters.text
	If (Not:C34($_obj_Parameters.where=Null:C1517))
		
		$_col_Where:=$_obj_Parameters.where
	Else 
		$_col_Where:=New collection:C1472("End")
	End if 
	If (Not:C34($_obj_Parameters.chars=Null:C1517))
		
		$_col_CharsToStrip:=$_obj_Parameters.chars
	Else 
		$_col_CharsToStrip:=New collection:C1472(Char:C90(32))
	End if 
	If ($_col_Where.indexOf("End")>=0) | ($_col_Where.indexOf("B")>=0) | ($_col_Where.indexOf("both")>=0)
		For ($_l_TextChar; Length:C16($_t_InputText); 1; -1)
			If ($_col_CharsToStrip.indexOf($_t_InputText[[$_l_TextChar]])<0)
				$_t_InputText:=Substring:C12($_t_InputText; 1; $_l_TextChar)
				$_l_TextChar:=0
			End if 
		End for 
	End if 
	
	If ($_col_Where.indexOf("Start")>=0) | ($_col_Where.indexOf("B")>=0) | ($_col_Where.indexOf("both")<0)
		
		For ($_l_TextChar; 1; Length:C16($_t_InputText))
			If ($_col_CharsToStrip.indexOf($_t_InputText[[$_l_TextChar]])<0)
				$_t_InputText:=Substring:C12($_t_InputText; $_l_TextChar)
				$_l_TextChar:=Length:C16($_t_InputText)+1
			End if 
		End for 
	End if 
	$0:=$_t_InputText
	
End if 
