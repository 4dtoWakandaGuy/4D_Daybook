//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_ListItemAddProperty
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $2; $3)
	C_TEXT:C284($_t_ListName; $_t_oldMethodName; $4)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_ListItemAddProperty")


If (Count parameters:C259>=3)
	If ($1>0) & ($2>0) & ($3>0)
		If (False:C215)
			
		Else 
			//NG July 2007--new way
			If (Count parameters:C259<4)
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$2)
				$_t_ListName:=[X_LISTS:111]x_ListName:2
			Else 
				$_t_ListName:=$4
			End if 
			READ WRITE:C146([LIST_ITEMS:95])
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$1)
			AA_SetListItemProperty($_t_ListName; $3)
			DB_SaveRecord(->[LIST_ITEMS:95])
			AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
			UNLOAD RECORD:C212([LIST_ITEMS:95])
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("AA_ListItemAddProperty"; $_t_oldMethodName)
