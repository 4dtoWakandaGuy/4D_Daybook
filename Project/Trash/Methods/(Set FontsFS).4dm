//%attributes = {}
If (False:C215)
	//Project Method Name:      Set_FontsFS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 19:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	C_LONGINT:C283($_l_CharPosition; $_l_FieldNumber; $_l_TableNumber; $3)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_DatatoProcess; $_t_FieldName; $_t_oldMethodName; $_t_TableName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Set_FontsFS")
//NG Feb 2008 This method is now largely defunct and replaced by SetFontsByPointerParameter the new method has the font size(as did this one), font name(optional valiue=defaults to preferred font) and font style(optional value). The new method also replaces Set_Fonts  The values are then passed as pointers.
//This method remains on a couple of disused forms and is left in place as it may be used on some superreports

Load_Fields

While ($1#"")
	IDLE:C311  // 7/04/03 pb
	$_l_CharPosition:=Position:C15("+"; $1)
	If ($_l_CharPosition=0)
		$_t_DatatoProcess:=$1
		$1:=""
	Else 
		$_t_DatatoProcess:=Substring:C12($1; 1; $_l_CharPosition-1)
		$1:=Substring:C12($1; $_l_CharPosition+1; 32000)
	End if 
	If ($_t_DatatoProcess="[@")
		$_l_CharPosition:=Position:C15("]"; $_t_DatatoProcess)
		$_t_TableName:=Substring:C12($_t_DatatoProcess; 2; $_l_CharPosition-2)
		$_t_FieldName:=Substring:C12($_t_DatatoProcess; $_l_CharPosition+1; 32000)
		$_t_TableName:=$_t_TableName
		
		$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName)
		$_l_FieldNumber:=Find in array:C230(<>SYS_at_2DFieldNames{$_l_TableNumber}; $_t_FieldName)
		$_ptr_Field:=Field:C253(<>DB_al_TableNums{$_l_TableNumber}; <>SYS_al_2DFieldNumbers{$_l_TableNumber}{$_l_FieldNumber})
	Else 
		$_ptr_Field->:=Get pointer:C304($_t_DatatoProcess)
	End if 
	OBJECT SET FONT:C164($_ptr_Field->; $2)
	If ($3>0)
		OBJECT SET FONT SIZE:C165($_ptr_Field->; $3)
	End if 
End while 
ERR_MethodTrackerReturn("Set_FontsFS"; $_t_oldMethodName)
