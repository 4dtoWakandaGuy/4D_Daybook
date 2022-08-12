//%attributes = {}
If (False:C215)
	//Project Method Name:      RS_RecordAccessAllowed
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
	//ARRAY LONGINT(WS_al_aStatePropertiesNUM;0;0)
	//ARRAY TEXT(WS_at_aStateProperties;0;0)
	//ARRAY TEXT(WS_at_aStatesPropertiesSTR;0;0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_CharPosition; $_l_ItemID; $_l_ListID; $_l_ListIDPosition; $_l_PropertyAccessCode; $_l_Row)
	C_POINTER:C301($1; $2; $3; $4; $5)
	C_TEXT:C284($_t_ListIDSTR; $_t_oldMethodName; $_t_Property)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RS_RecordAccessAllowed")

ARRAY TEXT:C222(WS_at_aStateProperties; 0; 0)
ARRAY LONGINT:C221(WS_al_aStatePropertiesNUM; 0; 0)
ARRAY TEXT:C222(WS_at_aStatesPropertiesSTR; 0; 0)
$_l_ListID:=AA_LoadList($1; $2; $3; False:C215; $4; ->WS_at_aStateProperties; ->WS_al_aStatePropertiesNUM; ->WS_at_aStatesPropertiesSTR)
$0:=True:C214

If ([COMPANIES:2]Record_State:62>0)
	$_l_Row:=Find in array:C230($3->; $1->)
	If ($_l_Row>0)
		$5->:=$2->{$_l_Row}
		$_t_Property:=$4->{$_l_Row}
		$_l_ListID:=AA_GetListbyName("Record Access"; True:C214)
		$_t_ListIDSTR:=String:C10($_l_ListID)
		$_l_ListIDPosition:=Position:C15($_t_ListIDSTR; $_t_Property)
		If ($_l_ListIDPosition>0)
			//this item has this property set. sooooooo
			$_t_Property:=Substring:C12($_t_Property; $_l_ListIDPosition+Length:C16($_t_ListIDSTR); Length:C16($_t_Property))
			$_l_CharPosition:=Position:C15(";"; $_t_Property)
			If ($_l_CharPosition>0)
				$_t_Property:=Substring:C12($_t_Property; 1; $_l_CharPosition-1)
			End if 
			$_l_ItemID:=Num:C11($_t_Property)
			$_l_PropertyAccessCode:=AA_ListGetPropertyCode($_l_ItemID)
			Case of 
				: ($_l_PropertyAccessCode=100)  //administrator only
					$0:=False:C215
				: ($_l_PropertyAccessCode=102)  //accounts  only
					$0:=False:C215
				: ($_l_PropertyAccessCode=103)  //Manager  only
					$0:=False:C215
				Else 
					$0:=True:C214
			End case 
			
		End if 
	Else 
		$5->:="Unknown"
		$1->:=0
		
	End if 
	
	
Else 
	$5->:="Unknown"
End if 
ERR_MethodTrackerReturn("RS_RecordAccessAllowed"; $_t_oldMethodName)
