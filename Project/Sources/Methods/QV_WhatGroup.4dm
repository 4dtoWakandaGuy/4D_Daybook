//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_WhatGroup
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
	ARRAY LONGINT:C221($_al_ListItemsTR; 0)
	C_LONGINT:C283($_l_GroupListID; $0; $1; $2; QV_l_LastGroupID; QV_l_LastRecord)
	C_TEXT:C284($_t_GroupListItemSTR2; $_t_GroupListItemSTR3; $_t_ListItemsTR; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_WhatGroup")
//pass a quality id this will return the group id
$0:=0
If (Count parameters:C259>=1)
	
	If ($1#QV_l_LastRecord)
		MESSAGE:C88([INFORMATION:55]SubGroup:6)
		
		QV_l_LastRecord:=$1
		QV_l_LastGroupID:=0
		QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$1)
		If (Records in selection:C76([LIST_ITEMS:95])=0)
			$_t_ListItemsTR:="ERROR"
		Else 
			$_t_ListItemsTR:=[LIST_ITEMS:95]List_Entry:2
			$_l_GroupListID:=[LIST_ITEMS:95]X_ListID:4
			If ($_l_GroupListID>0)
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_GroupListID)
				If (Records in selection:C76([X_LISTS:111])=0)
					$_t_GroupListItemSTR2:="ERROR"
					$_t_GroupListItemSTR3:="ERROR"
				Else 
					$_t_GroupListItemSTR2:=[X_LISTS:111]x_ListName:2
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Entry:2=$_t_GroupListItemSTR2; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_ListID:4=$2; *)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_Item_Status:7=0)
					If (Records in selection:C76([LIST_ITEMS:95])=0)
						$_t_GroupListItemSTR3:="ERROR"
					Else 
						$_t_GroupListItemSTR3:="QUALITIES"
						$0:=[LIST_ITEMS:95]X_ID:3
						QV_l_LastGroupID:=[LIST_ITEMS:95]X_ID:3
					End if 
				End if 
				
			Else 
				$_t_GroupListItemSTR2:="ERROR"
				$_t_GroupListItemSTR3:="ERROR"
			End if 
			
		End if 
	Else 
		$0:=QV_l_LastGroupID
	End if 
	
End if 
ERR_MethodTrackerReturn("QV_WhatGroup"; $_t_oldMethodName)
