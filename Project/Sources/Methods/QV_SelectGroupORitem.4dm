//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_SelectGroupORitem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(QV_ai_Tick;0)
	//ARRAY TEXT(QV_at_List;0)
	C_BOOLEAN:C305(QV_ListSelected)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; $1; QV_l_SelectType; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($3; $4; $5)
	C_TEXT:C284($_t_oldMethodName; $2; QV_t_EnteredItem)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_SelectGroupORitem")
//this method will display a list of groups or items for a user to select from
//THIS IS USED FOR THE QUALITIES SEARCH

//$1=1=GROUP
//$1=2=ITEMS
//$2=POINTER TO STRING ARRAY(55)
//$3=POINTER TO IDS ARRAY
If (Count parameters:C259>=5)
	QV_l_SelectType:=$1
	QV_t_EnteredItem:=$2
	ARRAY INTEGER:C220(QV_ai_Tick; 0)
	ARRAY INTEGER:C220(QV_ai_Tick; Size of array:C274($3->))
	ARRAY TEXT:C222(QV_at_List; Size of array:C274($3->))
	For ($_l_Index; 1; Size of array:C274($3->))
		QV_at_List{$_l_Index}:=$3->{$_l_Index}
	End for 
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
	If ($1<=4)
		DIALOG:C40([CONTACTS:1]; "QV_ITEMSSELECTOR")
	Else 
		DIALOG:C40([USER:15]; "QV_SelectGroups")
	End if 
	
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	If (QV_ListSelected)
		For ($_l_Index; 1; Size of array:C274(QV_ai_Tick))
			If (QV_ai_Tick{$_l_Index}=1)
				$5->{$_l_Index}:=1
			End if 
		End for 
		
	End if 
End if 
ERR_MethodTrackerReturn("QV_SelectGroupORitem"; $_t_oldMethodName)
