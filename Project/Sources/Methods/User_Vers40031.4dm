//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers40031
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
	ARRAY TEXT:C222($_at_List; 0)
	ARRAY TEXT:C222($_at_ListName; 0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_Vers40031")
QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1="Lists")
If (Records in selection:C76([LIST_ITEMS:95])=0)
	User_Message(Char:C90(13)+"      Converting Lists"+Char:C90(13))
	
	ARRAY TEXT:C222($_at_ListName; 16)
	$_at_ListName{1}:="Del Methods"
	$_at_ListName{2}:="Terms"
	$_at_ListName{3}:="Titles"
	$_at_ListName{4}:="VAT Prefixes"
	$_at_ListName{5}:="Ad Formats"
	$_at_ListName{6}:="Ad Colours"
	$_at_ListName{7}:="Qual Groups"
	$_at_ListName{8}:="Qual SubGroups"
	$_at_ListName{9}:="Usage Periods"
	$_at_ListName{10}:="Usage Countries"
	$_at_ListName{11}:="Mailsort"
	$_at_ListName{12}:="Skill Levels"
	$_at_ListName{13}:="Info From"
	$_at_ListName{14}:="Del Terms"
	$_at_ListName{15}:="Lists"
	$_at_ListName{16}:="Formats"
	ARRAY TEXT:C222($_at_List; 16)
	For ($_l_Index; 1; 16)
		$_at_List{$_l_Index}:="Lists"
	End for 
	
	READ WRITE:C146([LIST_ITEMS:95])
	REDUCE SELECTION:C351([LIST_ITEMS:95]; 0)
	ARRAY TO SELECTION:C261($_at_List; [LIST_ITEMS:95]List_Name:1; $_at_ListName; [LIST_ITEMS:95]List_Entry:2)
	READ ONLY:C145([LIST_ITEMS:95])
	UNLOAD RECORD:C212([LIST_ITEMS:95])
	
End if 
QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1="Formats")
If (Records in selection:C76([LIST_ITEMS:95])=0)
	ARRAY TEXT:C222($_at_ListName; 7)
	$_at_ListName{1}:="|Accounts"
	$_at_ListName{2}:="|Percent"
	$_at_ListName{3}:="|AccountsNZ"
	$_at_ListName{4}:="|Age"
	$_at_ListName{5}:="|Currency"
	$_at_ListName{6}:="###,##0.00"
	$_at_ListName{6}:="###,##0"
	ARRAY TEXT:C222($_at_List; 7)
	For ($_l_Index; 1; 7)
		$_at_List{$_l_Index}:="Formats"
	End for 
	
	READ WRITE:C146([LIST_ITEMS:95])
	REDUCE SELECTION:C351([LIST_ITEMS:95]; 0)
	ARRAY TO SELECTION:C261($_at_List; [LIST_ITEMS:95]List_Name:1; $_at_ListName; [LIST_ITEMS:95]List_Entry:2)
	READ ONLY:C145([LIST_ITEMS:95])
	UNLOAD RECORD:C212([LIST_ITEMS:95])
End if 
ERR_MethodTrackerReturn("User_Vers40031"; $_t_oldMethodName)
