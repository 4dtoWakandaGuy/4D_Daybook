//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_DiaryPers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 22:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; vNo)
	C_TEXT:C284($_t_oldMethodName; $_t_Person)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryPers")
//Diary_DiaryPers
If (Records in set:C195("Userset")>0)
	CREATE SET:C116([DIARY:12]; "DMaster")
	USE SET:C118("Userset")
	$_t_Person:=Substring:C12(Uppercase:C13(Gen_Request("Change to Person (initials):")); 1; 5)
	If (OK=1)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_Person; *)
		QUERY:C277([PERSONNEL:11];  | ; [PERSONNEL:11]Name:2=($_t_Person+"@"))
		While ((Records in selection:C76([PERSONNEL:11])=0) & (OK=1))
			Gen_Confirm("That Person does not exist.  Try again?"; "Yes"; "No")
			If (OK=1)
				$_t_Person:=Substring:C12(Uppercase:C13(Gen_Request("Change to Person (initials):")); 1; 5)
				If (OK=1)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_Person; *)
					QUERY:C277([PERSONNEL:11];  | ; [PERSONNEL:11]Name:2=($_t_Person+"@"))
				End if 
			End if 
		End while 
	End if 
	If (OK=1)
		$_t_Person:=[PERSONNEL:11]Initials:1
		Are_You_Sure
		If (OK=1)
			If (Not:C34(In transaction:C397))
				DB_lockFile(->[DIARY:12])
				APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Person:8:=$_t_Person)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
				DB_lockFile(->[DIARY:12])
				APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Export:24:=Export_Stamp2([DIARY:12]Export:24))
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
				DB_lockFile(->[DIARY:12])
				APPLY TO SELECTION:C70([DIARY:12]; Diary_PersPrior)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			Else 
				
				FIRST RECORD:C50([DIARY:12])
				For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
					[DIARY:12]Person:8:=$_t_Person
					[DIARY:12]Export:24:=Export_Stamp2([DIARY:12]Export:24)
					Diary_PersPrior
					DB_SaveRecord(->[DIARY:12])
					AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
					NEXT RECORD:C51([DIARY:12])
				End for 
			End if 
			
		End if 
	End if 
	USE SET:C118("DMaster")
Else 
	Gen_Alert("Please first highlight an item to Delegate"; "Try again")
End if 
vNo:=Records in selection:C76([DIARY:12])
ERR_MethodTrackerReturn("Diary_DiaryPers"; $_t_oldMethodName)