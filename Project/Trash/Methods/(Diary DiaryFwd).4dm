//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_DiaryFwd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 22:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate; vDateT)
	C_LONGINT:C283($_l_Index; vNo)
	C_TEXT:C284($_t_DateSTR; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryFwd")
//Diary_DiaryFwd
If (Records in set:C195("Userset")>0)
	CREATE SET:C116([DIARY:12]; "DMaster")
	USE SET:C118("Userset")
	$_t_DateSTR:=String:C10(<>DB_d_CurrentDate+7)
	vDateT:=Date:C102(Gen_Request("Change Date Do to:"; $_t_DateSTR))
	If (OK=1)
		If (Not:C34(In transaction:C397))
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Date_Do_From:4:=vDateT)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Date_Do_To:33:=vDateT)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Export:24:=Export_Stamp2([DIARY:12]Export:24))
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
		Else 
			FIRST RECORD:C50([DIARY:12])
			For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
				[DIARY:12]Date_Do_From:4:=vDateT
				[DIARY:12]Date_Do_To:33:=vDateT
				[DIARY:12]Export:24:=Export_Stamp2([DIARY:12]Export:24)
				DB_SaveRecord(->[DIARY:12])
				AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
				NEXT RECORD:C51([DIARY:12])
			End for 
		End if 
		
	End if 
	USE SET:C118("DMaster")
	vNo:=Records in selection:C76([DIARY:12])
Else 
	Gen_Alert("Please first highlight an item to Put Forward"; "Try again")
End if 
ERR_MethodTrackerReturn("Diary_DiaryFwd"; $_t_oldMethodName)