//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_DiaryCal
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 09:47
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; vDate)
	C_LONGINT:C283(vAdd; vNo)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vLongDate)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryCal")
//Diary_DiaryCal
$_d_Date:=vDate
COPY NAMED SELECTION:C331([DIARY:12]; "Selection")
Diary_Cal
If (vDate#$_d_Date)
	Diary_DateSrch
End if 
OK:=1
If (Records in selection:C76([DIARY:12])=0)
	Gen_Confirm("No Diary Items found.  Do you want to create one?"; "Try again"; "Create it")
	If (OK=0)
		SET WINDOW TITLE:C213("Enter to Diary")
		vAdd:=1
		$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
		DB_t_CurrentFormUsage:="Cal"
		ADD RECORD:C56([DIARY:12]; *)
		//DEFAULT TABLE([DIARY])
		ADD TO SET:C119([DIARY:12]; "DMaster")
		DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	End if 
End if 
If (OK=0)
	USE NAMED SELECTION:C332("Selection")
	vDate:=$_d_Date
	Long_Date2
	vLongDate:=vLongDate+"  "+Lowercase:C14(String:C10(Current time:C178; 5))
Else 
	SET WINDOW TITLE:C213(Diary_DiaryWT)
End if 
CLEAR NAMED SELECTION:C333("Selection")
vNo:=Records in selection:C76([DIARY:12])
ERR_MethodTrackerReturn("Diary_DiaryCal"; $_t_oldMethodName)