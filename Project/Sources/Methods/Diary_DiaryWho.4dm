//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_DiaryWho
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vCalActions; vNo)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; $User2; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vUser2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryWho")
//Diary_DiaryWho
$User2:=vUser2
vUser2:=Uppercase:C13(Gen_Request("Who:"))
If (OK=1)
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=vUser2)
	If (Records in selection:C76([PERSONNEL:11])=0)
		Gen_Alert("That is not a recognized Person"; "Cancel")
		vUser2:=$User2
	Else 
		COPY NAMED SELECTION:C331([DIARY:12]; "Selection")
		$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
		DB_t_CurrentFormUsage:="NoGroup"
		Diary_DateSrch
		DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
		If (Records in selection:C76([DIARY:12])=0)
			Gen_Alert("No Diary Items found for "+vUser2+" - the selection is unchanged"; "")
			USE NAMED SELECTION:C332("Selection")
			vUser2:=$User2
			SET WINDOW TITLE:C213(Diary_DiaryWT)
		End if 
		CLEAR NAMED SELECTION:C333("Selection")
		If (vCalActions=3)
			vCalActions:=4
		End if 
	End if 
Else 
	vUser2:=$User2
End if 
vNo:=Records in selection:C76([DIARY:12])
ERR_MethodTrackerReturn("Diary_DiaryWho"; $_t_oldMethodName)