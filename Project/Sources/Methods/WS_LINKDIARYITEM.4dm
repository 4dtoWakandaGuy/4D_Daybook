//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_LINKDIARYITEM
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
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Index; $_l_PersonID)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_LINKDIARYITEM")
//this method ensures that a diary record is linked to a Person
//it is called as a process from the trigger on a diary record
//both when saving an existing or a new record

// MODIFIED 16/04/02 for new ProcessServices PB
// parameters: $1 = [DIARY]Diary Code
//                      $2 = [DIARY]Person

//C_LONGINT($3) `never used 16/4/02 pb
//C_TEXT($4)  `never used 16/4/02 pb
If (Count parameters:C259>=2)
	//$Count:=0
	// semaphore stuff no longer needed 16/4/02 PB
	//  While (Semaphore("$LinkingDiary"))
	//   Delayticks(40)
	//   $Count:=$Count+1
	//  If ($Count>200)
	//    MESSAGE("Long delay")
	//  End if
	// End while
	If ($1#"") & ($2#"")
		READ ONLY:C145([DIARY:12])
		READ ONLY:C145([PERSONNEL:11])
		If (Count parameters:C259>=2)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$2)
			If (Records in selection:C76([PERSONNEL:11])>0)
				If ([PERSONNEL:11]Personnel_ID:48=0)
					MESSAGE:C88("Updating Personnel")
					READ WRITE:C146([PERSONNEL:11])
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=0)
					If (Not:C34(In transaction:C397))
						DB_lockFile(->[PERSONNEL:11])
						APPLY TO SELECTION:C70([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48:=0)  //trigger off tirgger in order to an id to the id field (could have set ANy field to itself but seemed logical to use id as we know its value)
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERSONNEL:11]))
					Else 
						FIRST RECORD:C50([PERSONNEL:11])
						For ($_l_Index; 1; Records in selection:C76([PERSONNEL:11]))
							[PERSONNEL:11]Personnel_ID:48:=0  //trigger off tirgger in order to an id to the id field (could have set ANy field to itself but seemed logical to use id as we know its value)
							DB_SaveRecord(->[PERSONNEL:11])
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERSONNEL:11]))
							NEXT RECORD:C51([PERSONNEL:11])
						End for 
					End if 
					
					UNLOAD RECORD:C212([PERSONNEL:11])
					READ ONLY:C145([PERSONNEL:11])
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$2)
				End if 
				$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
				If ($_l_PersonID>0)
					QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1=$1; *)
					QUERY:C277([DIARY_ITEMOWNERS:106];  & ; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_PersonID)
					If (Records in selection:C76([DIARY_ITEMOWNERS:106])=0)
						CREATE RECORD:C68([DIARY_ITEMOWNERS:106])
						[DIARY_ITEMOWNERS:106]DIARY_CODE:1:=$1
						[DIARY_ITEMOWNERS:106]PERSONNEL_ID:2:=$_l_PersonID
						//            If (Count parameters<4) ` never 16/4/02 pb
						[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3:=1
						[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSNAME:4:="Diary Item Owner"
						//            Else
						//[DIARY_ITEMOWNERS]RELATIONSHIP_CLASSID:=$3
						// [DIARY_ITEMOWNERS]RELATIONSHIP_CLASSNAME:=$4
						//           End if
						DB_SaveRecord(->[DIARY_ITEMOWNERS:106])
						
					End if 
				End if 
			End if 
		End if 
	End if 
	//  CLEAR SEMAPHORE("$LinkingDiary")
End if 

$0:=True:C214  // THIS PROBABLY NEEDS CHECKING!!!!!!!!!!!!!
ERR_MethodTrackerReturn("WS_LINKDIARYITEM"; $_t_oldMethodName)
