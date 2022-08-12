//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_ListFindDup
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
	ARRAY BOOLEAN:C223($_abo_ColumnLock; 0)
	ARRAY BOOLEAN:C223($_abo_Enterable; 0)
	ARRAY INTEGER:C220($_ai_FontSize; 0)
	ARRAY INTEGER:C220($_ai_Footers; 0)
	ARRAY INTEGER:C220($_ai_Widths; 0)
	ARRAY LONGINT:C221($_al_FIeldNumber; 0)
	ARRAY LONGINT:C221($_al_Order; 0)
	ARRAY LONGINT:C221($_al_RelatedField; 0)
	ARRAY LONGINT:C221($_al_RelatedTable; 0)
	ARRAY LONGINT:C221($_al_TableNumber; 0)
	ARRAY TEXT:C222($_at_ArrayName; 0)
	ARRAY TEXT:C222($_at_Colours; 0)
	ARRAY TEXT:C222($_at_ColumnFormula; 0)
	ARRAY TEXT:C222($_at_Formats; 0)
	ARRAY TEXT:C222($_at_Identity; 0)
	ARRAY TEXT:C222($_at_Settings; 0)
	ARRAY TEXT:C222($_at_Title; 0)
	C_LONGINT:C283($_l_ArraySize; $_l_index)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_Identity; $_t_oldMethodName; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_ListFindDup")

//NG 19/7/06 this method is a direct replacement for ALListFindDUp
$_t_oldMethodName:=ERR_MethodTracker("LBi_ListFindDup")
//ALListFindDup - duplicates a generic setup into a ◊User one
//Note: Script of Create button on Layouts_Out also duplicates the records
//NG January 2007 Added a
If (Count parameters:C259>1)
	If (Count parameters:C259>=3)
		If ($2="")
			$_t_Identity:=$3
		Else 
			$_t_Identity:=$3+$2
		End if 
	Else 
		$_t_Identity:=$1+$2
	End if 
Else 
	$_t_Identity:=$1+<>PER_t_CurrentUserInitials
End if 
QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_Identity)
If (Records in selection:C76([LIST_LAYOUTS:96])=0)
	QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$1)
	//SELECTION TO ARRAY([LIST LAYOUTS]File No;$_al_TableNumber;[LIST LAYOUTS]Field No;$_al_FieldNumber;[LIST LAYOUTS]Title;$_at_Title;[LIST LAYOUTS]Width;$_ai_Widths;[LIST LAYOUTS]Format;$_at_Formats;[LIST LAYOUTS]Order;$_al_Order;[LIST LAYOUTS]Enterable;$_abo_Enterable;[LIST LAYOUTS]Locked;$_abo_ColumnLock;[LIST LAYOUTS]Formula;$_at_ColumnFormula;[LIST LAYOUTS]Font Size;$_ai_FontSize;[LIST LAYOUTS]Colour;$_at_Colours;[LIST LAYOUTS]Settings;$_at_Settings;[LIST LAYOUTS]Footer;$_ai_Footers)
	SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Table_Number:2; $_al_TableNumber; [LIST_LAYOUTS:96]Field_Number:3; $_al_FieldNumber; [LIST_LAYOUTS:96]Title:4; $_at_Title; [LIST_LAYOUTS:96]Width:5; $_ai_Widths; [LIST_LAYOUTS:96]Format:6; $_at_Formats; [LIST_LAYOUTS:96]Order:7; $_al_Order; [LIST_LAYOUTS:96]Enterable:8; $_abo_Enterable; [LIST_LAYOUTS:96]Locked:10; $_abo_ColumnLock; [LIST_LAYOUTS:96]Formula:9; $_at_ColumnFormula; [LIST_LAYOUTS:96]Font_Size:11; $_ai_FontSize; [LIST_LAYOUTS:96]Colour:12; $_at_Colours; [LIST_LAYOUTS:96]Settings:13; $_at_Settings; [LIST_LAYOUTS:96]Footer:14; $_ai_Footers; [LIST_LAYOUTS:96]X_Related_Field:16; $_al_RelatedField; [LIST_LAYOUTS:96]X_Related_Table:15; $_al_RelatedTable; [LIST_LAYOUTS:96]X_associatedArrayName:17; $_at_ArrayName)
	$_l_ArraySize:=Size of array:C274($_al_TableNumber)
	ARRAY TEXT:C222($_at_Identity; $_l_ArraySize)
	For ($_l_index; 1; $_l_ArraySize)
		$_at_Identity{$_l_index}:=$_t_Identity
	End for 
	REDUCE SELECTION:C351([LIST_LAYOUTS:96]; 0)
	READ WRITE:C146([LIST_LAYOUTS:96])
	
	For ($_l_index; 1; Size of array:C274($_at_Identity))
		CREATE RECORD:C68([LIST_LAYOUTS:96])
		
		[LIST_LAYOUTS:96]Layout_Reference:1:=$_at_Identity{$_l_index}
		[LIST_LAYOUTS:96]Table_Number:2:=$_al_TableNumber{$_l_index}
		[LIST_LAYOUTS:96]Field_Number:3:=$_al_FieldNumber{$_l_index}
		[LIST_LAYOUTS:96]Title:4:=$_at_Title{$_l_index}
		[LIST_LAYOUTS:96]Width:5:=$_ai_Widths{$_l_index}
		[LIST_LAYOUTS:96]Format:6:=$_at_Formats{$_l_index}
		[LIST_LAYOUTS:96]Order:7:=$_al_Order{$_l_index}
		[LIST_LAYOUTS:96]Enterable:8:=$_abo_Enterable{$_l_index}
		[LIST_LAYOUTS:96]Locked:10:=$_abo_ColumnLock{$_l_index}
		[LIST_LAYOUTS:96]Formula:9:=Macro_translate($_at_ColumnFormula{$_l_index})
		[LIST_LAYOUTS:96]Font_Size:11:=$_ai_FontSize{$_l_index}
		[LIST_LAYOUTS:96]Colour:12:=$_at_Colours{$_l_index}
		[LIST_LAYOUTS:96]Settings:13:=$_at_Settings{$_l_index}
		[LIST_LAYOUTS:96]Footer:14:=$_ai_Footers{$_l_index}
		[LIST_LAYOUTS:96]X_associatedArrayName:17:=$_at_ArrayName{$_l_index}
		[LIST_LAYOUTS:96]X_Related_Field:16:=$_al_RelatedField{$_l_index}
		[LIST_LAYOUTS:96]X_Related_Table:15:=$_al_RelatedTable{$_l_index}
		DB_SaveRecord(->[LIST_LAYOUTS:96])
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[LIST_LAYOUTS:96]))
		NEXT RECORD:C51([LIST_LAYOUTS:96])
	End for 
	QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_Identity)
	
	If (False:C215)
		ARRAY TO SELECTION:C261($_at_Title; [LIST_LAYOUTS:96]Title:4; $_ai_Widths; [LIST_LAYOUTS:96]Width:5; $_at_Formats; [LIST_LAYOUTS:96]Format:6; $_al_Order; [LIST_LAYOUTS:96]Order:7; $_abo_Enterable; [LIST_LAYOUTS:96]Enterable:8; $_abo_ColumnLock; [LIST_LAYOUTS:96]Locked:10; $_at_ColumnFormula; [LIST_LAYOUTS:96]Formula:9; $_ai_FontSize; [LIST_LAYOUTS:96]Font_Size:11; $_at_Colours; [LIST_LAYOUTS:96]Colour:12; $_at_Settings; [LIST_LAYOUTS:96]Settings:13; $_ai_Footers; [LIST_LAYOUTS:96]Footer:14)
	End if 
	READ ONLY:C145([LIST_LAYOUTS:96])
	UNLOAD RECORD:C212([LIST_LAYOUTS:96])
End if 
ERR_MethodTrackerReturn("LBi_ListFindDup"; $_t_oldMethodName)