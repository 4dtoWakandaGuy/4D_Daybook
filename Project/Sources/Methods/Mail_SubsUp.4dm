//%attributes = {}
If (False:C215)
	//Project Method Name:      Mail_SubsUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/03/2011 17:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_SubsItemNumbers; 0)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_SubsUp")
Gen_Confirm("Do you now want to record these Renewal reminders as Done?"; "Yes"; "No")
If (OK=1)
	READ WRITE:C146([SUBSCRIPTIONS:93])
	SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_SubsItemNumbers)
	QUERY WITH ARRAY:C644([SUBSCRIPTIONS:93]Order_Item_Number:4; $_al_SubsItemNumbers)
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[SUBSCRIPTIONS:93])
		APPLY TO SELECTION:C70([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Date_Done:9:=vDate)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[SUBSCRIPTIONS:93]))
	Else 
		
		FIRST RECORD:C50([SUBSCRIPTIONS:93])
		For ($_l_Index; 1; Records in selection:C76([SUBSCRIPTIONS:93]))
			[SUBSCRIPTIONS:93]Date_Done:9:=vDate
			DB_SaveRecord(->[SUBSCRIPTIONS:93])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[SUBSCRIPTIONS:93]))
			NEXT RECORD:C51([SUBSCRIPTIONS:93])
		End for 
	End if 
	UNLOAD RECORD:C212([SUBSCRIPTIONS:93])
End if 
ERR_MethodTrackerReturn("Mail_SubsUp"; $_t_oldMethodName)
