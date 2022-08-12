//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_DiaryPr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 22:40
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SD3_at_DiaryPriority;0)
	C_LONGINT:C283(<>PER_l_AccessLevel; $_l_Index; $_l_SelectedRow; vNo)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $_t_Priority)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryPr")
//$_l_SelectedRow
If (Count parameters:C259>=1)
	$_l_SelectedRow:=$1
Else 
	$_l_SelectedRow:=<>SD3_at_DiaryPriority
End if 
COPY NAMED SELECTION:C331([DIARY:12]; "Selection")
If ($_l_SelectedRow>1)
	Case of 
		: ($_l_SelectedRow=2)
			USE SET:C118("DMaster")
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Priority:17="1")
			SET WINDOW TITLE:C213(Diary_DiaryWT+" (1)")
		: ($_l_SelectedRow=3)
			USE SET:C118("DMaster")
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Priority:17="2")
			SET WINDOW TITLE:C213(Diary_DiaryWT+" (2)")
		: ($_l_SelectedRow=4)
			USE SET:C118("DMaster")
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Priority:17="3")
			SET WINDOW TITLE:C213(Diary_DiaryWT+" (3)")
		: ($_l_SelectedRow=5)
			USE SET:C118("DMaster")
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Done:14=False:C215)
			SET WINDOW TITLE:C213(Diary_DiaryWT+" (To Do)")
		: ($_l_SelectedRow=6)
			USE SET:C118("DMaster")
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Done:14=True:C214)
			SET WINDOW TITLE:C213(Diary_DiaryWT+" (Done)")
		: ($_l_SelectedRow=7)
			USE SET:C118("DMaster")
			SET WINDOW TITLE:C213(Diary_DiaryWT)
		: ($_l_SelectedRow=8)
			If (<>PER_l_AccessLevel>1)
				Gen_Alert("You do not have access to this function"; "Cancel")
			Else 
				If (Records in set:C195("Userset")>0)
					CREATE SET:C116([DIARY:12]; "DMaster")
					USE SET:C118("Userset")
					$_t_Priority:=Substring:C12(Uppercase:C13(Gen_Request("Priority to assign:")); 1; 3)
					If (OK=1)
						Are_You_Sure
						If (OK=1)
							If (Not:C34(In transaction:C397))
								DB_lockFile(->[DIARY:12])
								APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Priority:17:=$_t_Priority)
								
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
							Else 
								
								FIRST RECORD:C50([DIARY:12])
								For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
									[DIARY:12]Priority:17:=$_t_Priority
									DB_SaveRecord(->[DIARY:12])
									AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
									NEXT RECORD:C51([DIARY:12])
								End for 
							End if 
							
						End if 
					End if 
					USE SET:C118("DMaster")
				Else 
					Gen_Alert("Please first select a Diary Item"; "Try again")
				End if 
			End if 
	End case 
	
	vNo:=Records in selection:C76([DIARY:12])
	
End if 
$_l_SelectedRow:=1
If (Records in selection:C76([DIARY:12])=0)
	Gen_Alert("No Diary Items found  - the selection is unchanged"; "")
	USE NAMED SELECTION:C332("Selection")
	SET WINDOW TITLE:C213(Diary_DiaryWT)
End if 
CLEAR NAMED SELECTION:C333("Selection")
ERR_MethodTrackerReturn("Diary_DiaryPr"; $_t_oldMethodName)